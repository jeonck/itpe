# TRANSLATION_RULES.md

Korean → English translation rules for the ITPE Knowledge Base (`itpe-KM` → `itpe-KM-en`).

**Read `GLOSSARY.md` in this same directory before translating anything.** Every term listed
there has a fixed English equivalent. Do not invent synonyms for glossary terms.

**Read `src/<path>`, write `out/<path>`. Never modify anything under `src/`.**
The output path must be byte-identical to the input path. 266 internal relative links depend on it.

---

## 1. Front matter

Only two keys are translated:

| Key | Action |
|---|---|
| `title` | Translate |
| `description` | Translate |
| `type` | **NEVER touch** — neither key nor value |
| `weight` | **NEVER touch** — neither key nor value |

- Keep the `---` fences exactly where they are (line 1 and the closing fence).
- Keep the key order exactly as in the original.
- Do not add keys. Do not remove keys. Do not reformat quoting.
- If `title` contains a parenthetical English gloss — `자료구조 (Data Structures)` — collapse it
  to the English term alone: `Data Structures`. Do not produce `Data Structures (Data Structures)`.

```yaml
# BEFORE
---
title: 선형 자료구조
description: 배열 vs 연결 리스트 메모리 비교, 스택(LIFO)·큐(FIFO)·원형 큐·덱
type: docs
weight: 1
---

# AFTER
---
title: Linear Data Structures
description: Array vs. linked list memory comparison, stack (LIFO), queue (FIFO), circular queue, deque
type: docs
weight: 1
---
```

---

## 2. Mermaid blocks — the highest-risk region

405 Mermaid blocks across 138 files. A single broken block is visible on the rendered page.

### Translate
- Text **inside double quotes only**: `A["텍스트"]` → `A["text"]`
- Edge labels inside quotes: `--"텍스트"-->` → `--"text"-->`
- `subgraph` labels inside quotes: `subgraph PUB["퍼블릭 클라우드"]` → `subgraph PUB["Public Cloud"]`
- Pipe-form edge labels: `-->|"텍스트"|` → `-->|"text"|`

### Never touch
| Element | Example |
|---|---|
| Node IDs | `A`, `B`, `CP`, `ETCD`, `API`, `XaaS`, `USER1`, `PR1` |
| subgraph IDs | `PUB`, `PRIV`, `HYB`, `MULTI` |
| Arrows / connectors | `-->`, `---`, `--"..."-->`, `-.->`, `==>` |
| Every `style ` line | `style A fill:#FFEBEE,stroke:#D32F2F,color:#000` — copy verbatim, including the node ID |
| `classDef` / `class` lines | copy verbatim |
| `%%{init: ... }%%` blocks | copy verbatim, byte for byte |
| Diagram declarations | `flowchart LR`, `flowchart TD`, `graph TB`, `sequenceDiagram`, `direction TB` |
| `end` keywords | closing a `subgraph` |
| Indentation | keep the original leading whitespace on every line |

### `<br/>` — hard constraint
- The number of `<br/>` in a node label **must be identical before and after**.
- Their **position relative to the label's segments must be preserved**: if the Korean label is
  `"온프레미스 한계<br/>높은 초기 투자"`, the English must also be two segments separated by one `<br/>`.
- If the English is longer than the Korean, **do not delete a `<br/>` and do not add one**.
  Redistribute the words across the existing segments so each segment reads naturally.
- Never replace `<br/>` with `\n`. `\n` breaks the Mermaid parser.

```
# BEFORE
    A["온프레미스 한계<br/>높은 초기 투자·긴 구축 기간"] --"온디맨드 제공·<br/>공동 책임 모델"--> B["클라우드 컴퓨팅 적용<br/>IaaS·PaaS·SaaS 선택"]
    style A fill:#FFEBEE,stroke:#D32F2F,color:#000

# AFTER  (same node IDs, same arrows, same <br/> count, style line untouched)
    A["On-premises limits<br/>High upfront cost, long build time"] --"On-demand delivery,<br/>shared responsibility model"--> B["Cloud computing adopted<br/>IaaS, PaaS, SaaS choice"]
    style A fill:#FFEBEE,stroke:#D32F2F,color:#000
```

### Line count
The number of lines inside a Mermaid block must be identical before and after. Never split one
node definition across two lines, never merge two lines into one.

### Characters that break rendering
| Forbidden | Why | Use instead |
|---|---|---|
| `\n` | Mermaid parse error | `<br/>` |
| `<br/>` inside `( )` | `"(text<br/>text)"` parse error | move the break outside the parens, or drop the parens |
| Emoji in a `subgraph` label | parse error | remove |
| `A --> B & C` | fails on some versions | split into `A --> B` and `A --> C` |
| `<` immediately before a digit (`<1ms`) | MDX reads it as a JSX tag | write `under 1 ms` |
| Unescaped `"` inside a quoted label | terminates the label early | rephrase without quotes |

The `·` middle dot is used heavily in the Korean source as a list separator inside labels.
In English, replace it with a comma or a slash — whichever reads better — but keep the label
on the same side of its `<br/>`.

---

## 3. Body text

### Do not translate
- Fenced code blocks (```` ``` ````) — the code itself
- Inline code (`` `...` ``)
- YAML / JSON / shell / SQL examples
- Command names, flags, file paths, URLs, product names, RFC numbers, standard IDs
  (ISO 27001, IEEE 830, TCP/IP, BGP, K8s, etc.)

### Do translate
- **Korean comments inside code blocks.** `# 노드 상태 확인` → `# Check node status`.
  Keep the comment marker and the indentation.

### Markdown tables
- Column count must not change.
- The separator row keeps its shape: `|---|---|---|` stays `|---|---|---|`
  (do not "improve" it to `|:---|:---:|---:|`).
- The number of `|` per row must not change.
- Header cells are translated; so are body cells, except code/identifiers.
- Symbol cells (`★★★`, `O`, `X`, `-`, `높음`/`중간`/`낮음`) — translate the Korean words
  (`High` / `Medium` / `Low`), keep the symbols.

### Relative links
`](docs/...)`, `](sorting-algorithms)`, `](../02-database/)`, `](#anchor)` — **never modify the
target**. Translate only the link text.

```
[정렬 알고리즘](sorting-algorithms)   →   [Sorting Algorithms](sorting-algorithms)
```

Heading anchors: if a link points at `#개요`, leave the target alone. Hugo regenerates anchors
from the translated heading; a rewritten target would be wrong either way, and leaving it
matches the original repo's behavior.

### Section structure
The source follows the Korean Professional Engineer exam answer format. **Preserve it exactly:**
- Heading levels (`##`, `###`) and their order
- Section numbering: `## 1.`, `## 2.`, `## 3.`
- Sub-section markers: `### 가.` → `### A.`, `### 나.` → `### B.`, `### 다.` → `### C.`
- The `**정의**:` / `**특징**:` / `**구성**:` / `**고려사항**:` bold-label pattern →
  `**Definition**:` / `**Characteristics**:` / `**Components**:` / `**Considerations**:`
- Horizontal rules (`---`) stay where they are
- Bullet nesting depth and marker style (`-`) stay the same

---

## 4. Voice and register

Write like an English-language technical reference, not like a translated exam script.

| Avoid (literal) | Prefer |
|---|---|
| "It achieves availability through redundancy." | "Redundancy keeps the service available." |
| "This is a technique which is used for the purpose of ~" | "This technique ~" |
| "By applying X, Y can be obtained." | "X yields Y." |
| "~을 통하여 ~을 달성한다" → "through ~, achieves ~" | active voice, one clause |

- Active voice. Present tense. Second person only where the original addresses the reader.
- Drop filler that only exists for Korean sentence flow (`~라고 할 수 있다`, `~하는 것이 중요하다`).
- Keep sentences short enough to fit a table cell without wrapping three times.
- Keep the terse, nominal style of headings: `Overview of X`, not `An Overview of the X System`.
- Do not add content. Do not add explanatory parentheticals the original does not have.
- Do not remove content. Every bullet, row, and node in the source has a counterpart in the output.

---

## 5. Self-check before writing the file

Run through this list on the text you are about to write:

1. Same number of ```` ```mermaid ```` blocks as the source.
2. Same number of lines inside each Mermaid block.
3. Same set of node IDs, in the same order.
4. Every `style ` line copied verbatim.
5. Same total `<br/>` count.
6. `type:` and `weight:` values unchanged.
7. Same number of `|---` table separator rows.
8. No remaining Korean characters (`가-힣`) anywhere in the file.
9. No relative link target changed.
