---
title: Sorting Algorithms
description: Bubble, selection, insertion (O(N²)) basic sorts; quick, merge, heap (O(N log N)) fast sorts; counting, radix specialized sorts; full comparison table (time complexity, space, stability)
type: docs
weight: 1
---

## 1. Overview of sorting algorithms, choosing the optimal sorting strategy for the data's characteristics

```mermaid
%%{init: { 'theme': 'base', 'themeVariables': { 'edgeLabelBackground': '#fff' }}}%%
flowchart LR
    A["Random data<br/>needs sorting<br/>algorithm selection"] --"Analyze data traits<br/>size, stability"--> B["Apply and run<br/>the appropriate sort algorithm"] --"Sorting complete<br/>search, analysis optimization"--> C["Achieve O(N log N)<br/>meet stability, space<br/>requirements"]
    style A fill:#FFEBEE,stroke:#D32F2F,color:#000
    style B fill:#E3F2FD,stroke:#1976D2,color:#000
    style C fill:#E8F5E9,stroke:#388E3C,color:#000
```

**Definition**: An algorithm that rearranges data into a specific order (ascending or descending), classified into comparison-based and non-comparison sorts, chosen by time complexity, space complexity, and stability.
- Comparison-based sorts have a theoretical lower bound of O(N log N), and split further into basic and fast sorts
- Non-comparison sorts (counting, radix) can achieve O(N) under bounded data-range conditions
- In practice, the algorithm is chosen or hybridized based on data size, distribution, and stability requirements

**Characteristics**:
- **Comparison-based lower bound**: the theoretical optimal lower bound for comparison sorting on arbitrary input is mathematically proven to be Ω(N log N)
- **Stability**: the property of preserving the original order of elements with equal keys, important for multi-key sorting
- **In-place**: space-efficient sorting using O(1) extra memory, a practical selection criterion alongside cache locality

---

## 2. Core structure of sorting algorithms

### A. How basic sorts (O(N²)) and fast sorts (O(N log N)) work

```mermaid
%%{init: { 'theme': 'base', 'themeVariables': { 'edgeLabelBackground': '#fff' }}}%%
flowchart LR
    subgraph BASIC["O(N²) basic sorts"]
        direction LR
        B1["Bubble sort<br/>swap adjacent<br/>elements, repeat"]
        B2["Selection sort<br/>select minimum<br/>swap"]
        B3["Insertion sort<br/>insert into<br/>sorted segment"]
    end
    subgraph FAST["O(N log N) fast sorts"]
        direction LR
        F1["Quicksort<br/>divide and conquer<br/>by pivot"]
        F2["Merge sort<br/>split in half<br/>merge"]
        F3["Heap sort<br/>use heap<br/>data structure"]
    end
    BASIC --"Performance improvement"--> FAST
    style B1 fill:#FFEBEE,stroke:#D32F2F,color:#000
    style B2 fill:#FFEBEE,stroke:#D32F2F,color:#000
    style B3 fill:#FFEBEE,stroke:#D32F2F,color:#000
    style F1 fill:#E3F2FD,stroke:#1976D2,color:#000
    style F2 fill:#E3F2FD,stroke:#1976D2,color:#000
    style F3 fill:#E3F2FD,stroke:#1976D2,color:#000
```

| Algorithm | Best time | Average time | Worst time | Space complexity | Stability |
|---|---|---|---|---|---|
| **Bubble sort** | O(N) | O(N²) | O(N²) | O(1) | Stable |
| **Selection sort** | O(N²) | O(N²) | O(N²) | O(1) | Unstable |
| **Insertion sort** | O(N) | O(N²) | O(N²) | O(1) | Stable |
| **Quicksort** | O(N log N) | O(N log N) | O(N²) | O(log N) | Unstable |
| **Merge sort** | O(N log N) | O(N log N) | O(N log N) | O(N) | Stable |
| **Heap sort** | O(N log N) | O(N log N) | O(N log N) | O(1) | Unstable |

---

### B. Counting/radix sort (non-comparison) and algorithm selection criteria

```mermaid
%%{init: { 'theme': 'base', 'themeVariables': { 'edgeLabelBackground': '#fff' }}}%%
flowchart LR
    INPUT["Input array<br/>bounded integer range"] --> CS1["Tally each element's<br/>frequency in a count array"]
    CS1 --> CS2["Compute cumulative sum<br/>update count array"]
    CS2 --> CS3["Place elements<br/>into the output array"]
    CS3 --> OUT1["Counting sort complete<br/>O(N+K)"]
    INPUT --> RS1["Process from the<br/>least significant digit (LSD)"]
    RS1 --> RS2["Perform a stable sort<br/>on each digit"]
    RS2 --> RS3["Repeat for the<br/>next digit"]
    RS3 --> OUT2["Radix sort complete<br/>O(d×N)"]
    style INPUT fill:#1E3A5F,stroke:#1E3A5F,color:#fff
    style CS1 fill:#E3F2FD,stroke:#1976D2,color:#000
    style CS2 fill:#E3F2FD,stroke:#1976D2,color:#000
    style CS3 fill:#E3F2FD,stroke:#1976D2,color:#000
    style OUT1 fill:#E8F5E9,stroke:#388E3C,color:#000
    style RS1 fill:#F3E5F5,stroke:#7B1FA2,color:#000
    style RS2 fill:#F3E5F5,stroke:#7B1FA2,color:#000
    style RS3 fill:#F3E5F5,stroke:#7B1FA2,color:#000
    style OUT2 fill:#E8F5E9,stroke:#388E3C,color:#000
```

| Comparison item | Comparison-based sort | Non-comparison sort (counting, radix) |
|---|---|---|
| **Time complexity lower bound** | Theoretical lower bound of Ω(N log N) | O(N+K) or O(d×N), linear time possible |
| **Applicable condition** | When any data type with a defined order relation | Integer or finite-range data, when range K is small |
| **Space complexity** | O(1) to O(N) | O(N+K): space waste if K is large |
| **Stability** | Varies by algorithm (merge: stable, quick: unstable) | Both counting and radix sort are stable |
| **Practical selection criteria** | General-purpose data sorting, Java's TimSort, C++ std::sort | Integer score sorting, fixed-digit identifiers (postal codes, phone numbers) |

---

## 3. Expected benefits and practical applications of sorting algorithms

| Category | Key benefits | Practical applications |
|---|---|---|
| **Performance optimization** | O(N log N) fast sorts cut large-dataset processing time by tens of times versus O(N²) | Apply quicksort (average case) or merge sort (when stability is needed) to datasets of millions of records or more |
| **Stability guarantee** | Stable sorts preserve existing order under multi-key sorting, maintaining data integrity | Apply merge sort or TimSort to operations requiring order preservation, such as multi-column DB ORDER BY or transaction-history sorting |
| **Special data handling** | Counting/radix sort achieves O(N) linear time on bounded-integer-range data | Apply counting sort to bounded-range integer data such as grade processing (0-100) or telecom subscriber-number sorting |
| **Algorithm design** | Gains a justified ability to choose a sorting algorithm based on data traits (size, distribution, stability, range) | Understand hybrid sort designs such as Timsort (Python, Java) and Introsort (C++), and implement custom comparators |
