# ITPE Knowledge Base (English)

An English-language knowledge base for the Korean **Professional Engineer Information
Management** certification (정보관리기술사) and **Professional Engineer Computer System
Applications** (컴퓨터시스템응용기술사).

The Korean exam's first session asks for structured, diagram-heavy essay answers on IT
frameworks, methodologies and standards. This site carries 185 of those topics — each one an
overview, a core-structure breakdown, and a benefits table, with Mermaid diagrams throughout —
into English, so the material is usable by readers who do not read Korean.

Built with [Hugo](https://gohugo.io/) and the [Hextra](https://github.com/imfing/hextra) theme,
deployed to GitHub Pages.

**Live site:** https://jeonck.github.io/itpe/

---

## Relationship to the Korean original

This repository is a translation of [`jeonck/itpe-KM`](https://github.com/jeonck/itpe-KM).

Directory structure, file names, front-matter `type`/`weight` values and every internal
relative link are **identical** to the original — only the prose, headings, table cells and
Mermaid labels are in English. That keeps the two repositories navigable side by side, and
means a change upstream maps to exactly one file here.

Translation is governed by two documents kept in the repo:

| File | What it fixes |
|---|---|
| [`.claude/TRANSLATION_RULES.md`](.claude/TRANSLATION_RULES.md) | What may and may not change — front matter, Mermaid internals, tables, links, register |
| [`.claude/GLOSSARY.md`](.claude/GLOSSARY.md) | ~300 Korean→English term mappings, so 185 files use one vocabulary |

---

## Contents

Eight sections, 185 documents.

| # | Section | Topics | Covers |
|---|---|---|---|
| 01 | Software Engineering | 20 | Life cycles, methodologies, requirements, analysis and design, testing and quality, maintenance, DevOps/SRE/MLOps |
| 02 | Database | 20 | Modelling and normalization, transactions, performance and indexing, HA and distribution, modern architectures, governance |
| 03 | Network | 16 | OSI model, lower and upper layers, SDN/NFV, wireless and mobile, traffic management |
| 04 | Security | 19 | Cryptography, network security, application security, modern security models, governance and compliance |
| 05 | Computer Architecture and OS | 16 | CPU architecture, memory, advanced hardware, processes and threads, concurrency and deadlock, memory management, storage |
| 06 | IT Management | 13 | IT strategy, IT governance, sourcing, business continuity, modern management paradigms |
| 07 | Emerging Technology | 15 | AI and LLMs, cloud native, Web3 and blockchain, metaverse and IoT, next-generation tech |
| 08 | Algorithms and Data Structures | 11 | Linear and non-linear structures, design paradigms, applied algorithms, complexity theory |

Every topic page follows the same three-part shape:

1. **Overview** — a three-node block diagram (problem → mechanism → value), a one-line
   definition, and three characteristics.
2. **Core structure** — two sub-sections, each with a diagram and a table.
3. **Expected benefits and practical applications** — a four-row table.

---

## Running it locally

Requires **Hugo extended ≥ 0.146** (the Hextra version pinned here needs it) and Git.

```bash
git clone --recurse-submodules https://github.com/jeonck/itpe.git
cd itpe
hugo server -D
```

Then open http://localhost:1313/itpe/.

If you already cloned without `--recurse-submodules`, pull the theme in separately:

```bash
git submodule update --init --recursive
```

Build the static site the way CI does:

```bash
hugo --minify          # output in public/
```

> Hextra fetches Mermaid and FlexSearch from `cdn.jsdelivr.net` at build time. On a machine
> without outbound access to that CDN the build stops with
> `Could not retrieve Mermaid js file`. The pages themselves still render; only those two
> scripts are missing.

### Local checks

Two scripts guard the translation. Both compare against a checkout of the Korean original.

```bash
# structural diff of every file against its Korean source
git clone --depth 1 https://github.com/jeonck/itpe-KM.git ../itpe-KM
SRC=../itpe-KM OUT=. scripts/verify.sh
```

`verify.sh` compares, per file: Mermaid block count and inner line count, the set of node IDs,
every `style`/`classDef` line, `<br/>` totals, arrow counts, `%%{init}%%` blocks, heading
counts, table separator rows, relative link targets, front-matter `type`/`weight`, and leftover
Hangul. It writes failing paths to `failed-files.txt`.

```bash
# parse all 417 Mermaid blocks with the real Mermaid parser
mkdir -p ../mmdcheck && cd ../mmdcheck && npm init -y && npm i mermaid@11 playwright && cd -
node scripts/validate-mermaid.mjs
```

`validate-mermaid.mjs` runs headless Chromium, loads Mermaid, and calls `mermaid.parse()` on
every block. Blocks listed in [`scripts/mermaid-baseline.txt`](scripts/mermaid-baseline.txt)
are known to fail in the Korean source too and are subtracted from the result.

> **Locale note.** These scripts run in containers whose locale is POSIX. There,
> `grep '[가-힣]'` collapses to a *byte* range and falsely matches em dashes, arrows and Greek
> letters. Both scripts use `perl -CSD ... \p{Hangul}` instead. If you write your own check,
> do the same.

---

## Deployment

`.github/workflows/deploy.yaml` builds on every push to `main` and publishes to GitHub Pages.
It checks out submodules, installs Hugo extended, and runs
`hugo --minify --baseURL "<pages base url>/"`.

To deploy your own copy, enable Pages for the repository with **Source: GitHub Actions**, and
set `baseURL` in `hugo.yaml` to your Pages URL.

---

## Repository layout

```
content/docs/          185 topic pages, eight numbered sections
layouts/               site-level template overrides
assets/                custom CSS
archetypes/            new-page templates
themes/hextra/         theme, as a git submodule
scripts/               verify.sh, validate-mermaid.mjs, mermaid-baseline.txt
.claude/               TRANSLATION_RULES.md, GLOSSARY.md, translator agent definitions
hugo.yaml              site configuration
```

---

## License

Content follows the upstream repository, [`jeonck/itpe-KM`](https://github.com/jeonck/itpe-KM).
The Hextra theme is MIT licensed by its authors.
