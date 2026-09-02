---
title: Linear Data Structures
description: Array vs. linked list memory comparison, stack (LIFO), queue (FIFO), circular queue, deque, hash table collision resolution (chaining, open addressing)
type: docs
weight: 1
---

## 1. Overview of Linear Data Structures, Managing Ordered Data as Contiguous, Linked, LIFO, or FIFO

```mermaid
%%{init: { 'theme': 'base', 'themeVariables': { 'edgeLabelBackground': '#fff' }}}%%
flowchart LR
    A["Unordered data<br/>Inefficient search, insert, delete"] --"Order relationships,<br/>linear structuring"--> B["Arrays, lists, stacks<br/>Queues, hash tables"] --"O(1) to O(n),<br/>operation optimization"--> C["Memory efficiency,<br/>secured processing performance"]
    style A fill:#FFEBEE,stroke:#D32F2F,color:#000
    style B fill:#E3F2FD,stroke:#1976D2,color:#000
    style C fill:#E8F5E9,stroke:#388E3C,color:#000
```

**Definition**: A basic classification of data structures that lines data up in a row and expresses order relationships through indexes, pointers, and access policies.
- Includes arrays (fixed index), linked lists (pointer links), stacks (LIFO), queues (FIFO), and hash tables (key-value mapping)
- Each data structure has different time-complexity characteristics for search, insert, and delete, so the choice depends on purpose
- The most basic building block of algorithm implementation, used extensively inside operating systems, compilers, and databases

**Characteristics**:
- **Varied access patterns**: Supports patterns from direct index access (arrays) to LIFO/FIFO policy access (stacks, queues)
- **Different memory layouts**: Arrays sit in contiguous memory and are cache-friendly; linked lists sit in scattered memory and resize dynamically
- **Hash-based O(1)**: A hash table averages O(1) search and insert, the core structure optimized for large-scale data processing

---

## 2. Core Structure of Linear Data Structures

### A. Structure and Time Complexity of Arrays, Linked Lists, Stacks, and Queues

```mermaid
%%{init: { 'theme': 'base', 'themeVariables': { 'edgeLabelBackground': '#fff' }}}%%
flowchart TD
    ROOT["Linear data structures"] --> A["Array<br/>Contiguous memory allocation<br/>Direct index access"]
    ROOT --> B["Linked List<br/>Node + pointer structure<br/>Dynamic resizing"]
    ROOT --> C["Stack<br/>LIFO<br/>Single-ended top pointer"]
    ROOT --> D["Queue<br/>FIFO<br/>front/rear pointers"]
    A --> A1["Static array<br/>Fixed size"]
    A --> A2["Dynamic array<br/>Auto-expanding"]
    B --> B1["Singly linked<br/>One direction"]
    B --> B2["Doubly linked<br/>Both directions"]
    C --> C1["Function call stack<br/>Recursion handling"]
    D --> D1["Circular queue<br/>Space reuse"]
    D --> D2["Deque<br/>Insert/delete at both ends"]
    style ROOT fill:#1E3A5F,stroke:#1E3A5F,color:#fff
    style A fill:#E3F2FD,stroke:#1976D2,color:#000
    style B fill:#F3E5F5,stroke:#7B1FA2,color:#000
    style C fill:#FFF3E0,stroke:#F57C00,color:#000
    style D fill:#E8F5E9,stroke:#388E3C,color:#000
    style A1 fill:#E3F2FD,stroke:#1976D2,color:#000
    style A2 fill:#E3F2FD,stroke:#1976D2,color:#000
    style B1 fill:#F3E5F5,stroke:#7B1FA2,color:#000
    style B2 fill:#F3E5F5,stroke:#7B1FA2,color:#000
    style C1 fill:#FFF3E0,stroke:#F57C00,color:#000
    style D1 fill:#E8F5E9,stroke:#388E3C,color:#000
    style D2 fill:#E8F5E9,stroke:#388E3C,color:#000
```

| Data structure | Search | Insert (front) | Insert (back) | Delete | Memory |
|---|---|---|---|---|---|
| **Array** | O(1) | O(n) | O(1) amortized | O(n) | Contiguous allocation, high cache efficiency |
| **Linked list** | O(n) | O(1) | O(n) or O(1)* | O(1)** | Scattered allocation, pointer overhead |
| **Stack** | O(n) | — | O(1) push | O(1) pop | Array- or list-based |
| **Queue** | O(n) | O(1) enqueue | — | O(1) dequeue | Circular array for space reuse |
| **Deque** | O(n) | O(1) | O(1) | O(1) at both ends | Doubly linked list based |

*O(1) if a tail pointer is kept; **assumes a pointer to the node is already held

---

### B. Hash Table: Hash Function Principle and Collision Resolution

```mermaid
%%{init: { 'theme': 'base', 'themeVariables': { 'edgeLabelBackground': '#fff' }}}%%
flowchart LR
    KEY["Key"] --> HF["Hash function<br/>h(k) = k mod m"]
    HF --> IDX["Bucket index<br/>0 to m-1"]
    IDX --> COLL{"Collision?"}
    COLL --"Yes · Chaining"--> CH["Chaining<br/>Append to linked list"]
    COLL --"Yes · Open Addressing"--> OA["Open addressing<br/>Probe for the next empty slot"]
    COLL --"No"--> STORE["Store directly<br/>O(1) done"]
    OA --> L1["Linear probing<br/>Sequential search, +1 each step"]
    OA --> L2["Double hashing<br/>h2(k) sets the interval"]
    style KEY fill:#FFEBEE,stroke:#D32F2F,color:#000
    style HF fill:#E3F2FD,stroke:#1976D2,color:#000
    style IDX fill:#E3F2FD,stroke:#1976D2,color:#000
    style COLL fill:#FFF3E0,stroke:#F57C00,color:#000
    style CH fill:#F3E5F5,stroke:#7B1FA2,color:#000
    style OA fill:#F3E5F5,stroke:#7B1FA2,color:#000
    style STORE fill:#E8F5E9,stroke:#388E3C,color:#000
    style L1 fill:#E0F2F1,stroke:#00796B,color:#000
    style L2 fill:#E0F2F1,stroke:#00796B,color:#000
```

| Category | Chaining | Open Addressing |
|---|---|---|
| **Collision resolution** | Links entries into a list at the same bucket | Probes for an empty slot and relocates |
| **Space efficiency** | Load factor can exceed 1 | Load factor must stay below 1 |
| **Search performance** | Average O(1 + α), α = load factor | Performance drops sharply as load factor rises |
| **Implementation complexity** | Simple, easy to delete | Deletion requires tombstone marking |
| **Cache efficiency** | Low (pointer dereferencing) | High (contiguous-memory probing) |
| **Recommended load factor** | 0.7 or below | 0.5-0.7 or below |
| **Common probing methods** | — | Linear probing, quadratic probing, double hashing |

---

## 3. Expected Benefits and Practical Applications of Linear Data Structures

| Category | Key benefits | Practical applications |
|---|---|---|
| **Performance optimization** | Choosing the data structure that fits the operation minimizes time complexity | Use a hash table for frequent lookups, a queue for order processing, a stack for recursion |
| **Memory efficiency** | Mixing arrays and linked lists meets both static and dynamic memory needs | Use an array for fixed-size data, a linked list for frequent insert/delete |
| **System implementation** | Stacks and queues implement core OS scheduler and compiler functions | Managing the function call stack, process wait queues, BFS/DFS search engines |
| **Data access** | A hash table's average O(1) performance speeds up large-scale key-value lookups | DB indexes, cache implementations (Redis), language runtime symbol tables |
