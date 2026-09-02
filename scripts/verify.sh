#!/usr/bin/env bash
# verify.sh — structural diff of every translated file against its Korean source.
#
#   usage: scripts/verify.sh [file-list]
#   with no argument it checks every *.md under src/content plus the root guides.
#   prints one line per failing file; writes the failing paths to failed-files.txt.
#
# Exit status: 0 = everything matched, 1 = at least one file failed.

set -uo pipefail

SRC=${SRC:-/home/user/build/src}
OUT=${OUT:-/home/user/build/out}
FAILED=${FAILED:-/home/user/build/failed-files.txt}
BR_EXC=${BR_EXC:-$(dirname "$0")/br-exceptions.txt}

: > "$FAILED"

if [ $# -ge 1 ] && [ -f "$1" ]; then
  mapfile -t FILES < "$1"
else
  mapfile -t FILES < <(cd "$SRC" && find content -name '*.md' | sort
                       cd "$SRC" && ls *.md 2>/dev/null)
fi

# --- extractors -------------------------------------------------------------

# every ```mermaid fence
n_blocks()   { grep -c '^[[:space:]]*```mermaid' "$1" 2>/dev/null || echo 0; }
# total lines living inside mermaid fences
n_mermaid_lines() { awk '/^[[:space:]]*```mermaid/{f=1;next} f&&/^[[:space:]]*```/{f=0;next} f{n++} END{print n+0}' "$1"; }
# node / subgraph identifiers — ONLY inside ```mermaid fences. Scanning the whole file would
# also match ordinary English prose like "cache (fast)", which the Korean source cannot produce
# and the English translation can, giving a guaranteed false mismatch on every translated file.
mermaid_body(){ awk '/^[[:space:]]*```mermaid/{f=1;next} f&&/^[[:space:]]*```/{f=0;next} f' "$1"; }
# Blank out quoted label text before extracting IDs: a label like `Range(year)` or
# `MongoDB(default)` is prose, not a node identifier, and its punctuation legitimately shifts
# in translation.
node_ids()   { mermaid_body "$1" | sed 's/"[^"]*"/""/g' \
                 | grep -oE '(^|[[:space:]]|>|\||-)([A-Za-z][A-Za-z0-9_-]*)[[({]' \
                 | grep -oE '[A-Za-z][A-Za-z0-9_-]*[[({]$' | sed 's/.$//' | sort -u; }
# every style line, reduced to "style <ID>" so colours are compared too
style_lines(){ grep -oE '^[[:space:]]*(style|classDef|class) +[A-Za-z0-9_,-]+.*' "$1" | sed 's/^[[:space:]]*//' | sort; }
n_style()    { grep -c '^[[:space:]]*style ' "$1" 2>/dev/null || echo 0; }
n_br()       { grep -oF '<br/>' "$1" 2>/dev/null | wc -l | tr -d ' '; }
frontmatter(){ awk 'NR==1&&/^---$/{f=1;next} f&&/^---$/{exit} f&&/^(type|weight):/{print}' "$1"; }
n_tablesep() { grep -c '|[[:space:]]*-\{2,\}' "$1" 2>/dev/null || echo 0; }
n_links()    { grep -oE '\]\([^)]*\)' "$1" 2>/dev/null | sort; }
n_arrows()   { grep -oE '(-->|---|-\.->|==>)' "$1" 2>/dev/null | wc -l | tr -d ' '; }
n_init()     { grep -c '%%{init' "$1" 2>/dev/null || echo 0; }
n_headings() { grep -c '^#\{1,6\} ' "$1" 2>/dev/null || echo 0; }

# --- main -------------------------------------------------------------------

total=0; ok=0; missing=0; bad=0

for rel in "${FILES[@]}"; do
  [ -z "$rel" ] && continue
  s="$SRC/$rel"; o="$OUT/$rel"
  [ -f "$s" ] || continue
  total=$((total+1))

  if [ ! -f "$o" ]; then
    echo "MISSING       $rel"
    echo "$rel" >> "$FAILED"; missing=$((missing+1)); continue
  fi

  errs=()

  [ "$(n_blocks "$s")"       = "$(n_blocks "$o")"       ] || errs+=("mermaid-blocks $(n_blocks "$s")->$(n_blocks "$o")")
  [ "$(n_mermaid_lines "$s")" = "$(n_mermaid_lines "$o")" ] || errs+=("mermaid-lines $(n_mermaid_lines "$s")->$(n_mermaid_lines "$o")")
  [ "$(n_style "$s")"        = "$(n_style "$o")"        ] || errs+=("style-lines $(n_style "$s")->$(n_style "$o")")
  # <br/> must survive translation one-for-one, EXCEPT for the bilingual-label collapses
  # recorded in scripts/br-exceptions.txt (see that file for why). Anything beyond the recorded
  # allowance for this file is a real defect.
  allow=$(awk -F'\t' -v f="$rel" '$1==f {print $2}' "$BR_EXC" 2>/dev/null); allow=${allow:-0}
  want=$(( $(n_br "$s") - allow ))
  [ "$want" = "$(n_br "$o")" ] || errs+=("br $(n_br "$s")-$allow=$want->$(n_br "$o")")
  [ "$(n_tablesep "$s")"     = "$(n_tablesep "$o")"     ] || errs+=("table-sep $(n_tablesep "$s")->$(n_tablesep "$o")")
  [ "$(n_arrows "$s")"       = "$(n_arrows "$o")"       ] || errs+=("arrows $(n_arrows "$s")->$(n_arrows "$o")")
  [ "$(n_init "$s")"         = "$(n_init "$o")"         ] || errs+=("init-blocks $(n_init "$s")->$(n_init "$o")")
  [ "$(n_headings "$s")"     = "$(n_headings "$o")"     ] || errs+=("headings $(n_headings "$s")->$(n_headings "$o")")

  diff -q <(node_ids "$s")    <(node_ids "$o")    >/dev/null 2>&1 || errs+=("node-ids")
  diff -q <(style_lines "$s") <(style_lines "$o") >/dev/null 2>&1 || errs+=("style-content")
  diff -q <(frontmatter "$s") <(frontmatter "$o") >/dev/null 2>&1 || errs+=("frontmatter-type/weight")
  diff -q <(n_links "$s")     <(n_links "$o")     >/dev/null 2>&1 || errs+=("link-targets")

  # NOTE: `grep '[가-힣]'` is NOT safe here. This container runs in the POSIX locale, where a
  # bracket range over multi-byte characters degrades to a byte range and matches em dashes,
  # arrows and Greek letters. Perl's \p{Hangul} is codepoint-aware and correct.
  kr=$(perl -CSD -ne 'print if /\p{Hangul}/' "$o" | wc -l | tr -d ' ')
  if [ "$kr" != "0" ]; then
    errs+=("korean-remains:${kr}L")
  fi
  if grep -q '\\n' "$o" && grep -q '```mermaid' "$o"; then
    awk '/```mermaid/{f=1} f&&/\\n/{print;exit} /^```$/{f=0}' "$o" | grep -q . && errs+=("literal-backslash-n-in-mermaid")
  fi
  # `<` immediately before a digit is MDX-hostile — but only flag it if the translation
  # introduced it. If the Korean source already had it, it is not ours to fix.
  a_s=$(grep -oE '<[0-9]' "$s" | wc -l | tr -d ' ')
  a_o=$(grep -oE '<[0-9]' "$o" | wc -l | tr -d ' ')
  [ "$a_o" -gt "$a_s" ] && errs+=("angle-before-digit +$((a_o-a_s))")

  if [ ${#errs[@]} -eq 0 ]; then
    ok=$((ok+1))
  else
    printf 'FAIL  %-72s %s\n' "$rel" "${errs[*]}"
    echo "$rel" >> "$FAILED"; bad=$((bad+1))
  fi
done

echo
echo "----------------------------------------------------------------"
printf 'checked %d   passed %d   failed %d   missing %d\n' "$total" "$ok" "$bad" "$missing"
echo "failing paths -> $FAILED"
echo "----------------------------------------------------------------"

[ $((bad+missing)) -eq 0 ]
