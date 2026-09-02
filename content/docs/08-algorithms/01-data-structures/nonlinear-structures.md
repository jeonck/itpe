---
title: Non-Linear Data Structures
description: Binary tree/BST skew problem, AVL/Red-Black tree rebalancing, max/min heap priority queues, graph adjacency matrix vs. adjacency list
type: docs
weight: 2
---

## 1. Overview of Non-Linear Data Structures, Representing Hierarchical and Connective Relationships as Trees and Graphs

```mermaid
%%{init: { 'theme': 'base', 'themeVariables': { 'edgeLabelBackground': '#fff' }}}%%
flowchart LR
    A["Limits of linear structures<br/>Cannot express hierarchical or mesh relationships"] --"Trees, graphs,<br/>non-linear structuring"--> B["BST, AVL, heap,<br/>graph representation"] --"O(log N) search,<br/>shortest-path derivation"--> C["Efficient hierarchy management,<br/>optimized network paths"]
    style A fill:#FFEBEE,stroke:#D32F2F,color:#000
    style B fill:#E3F2FD,stroke:#1976D2,color:#000
    style C fill:#E8F5E9,stroke:#388E3C,color:#000
```

**Definition**: A non-linear data structure that represents data through parent-child hierarchy (tree) or arbitrary connections (graph) between nodes.
- A tree is an acyclic hierarchy used for search, sorting, and priority management; a graph represents arbitrary connection relationships
- BST offers O(log N) search, a heap offers O(log N) insert/delete to implement a priority queue, and graphs support shortest-path algorithms
- A core foundation for many real-world systems: file systems, DB indexes (B-Tree), network routing, and social graphs

**Characteristics**:
- **Guaranteed self-balancing**: AVL and Red-Black trees use rotation operations to prevent skewed trees and guarantee O(log N)
- **Priority handling**: A heap structure gives O(1) access to the max/min value and O(log N) insert/delete, implementing schedulers and event queues
- **Representational flexibility**: A graph uses an adjacency matrix or adjacency list to represent sparse and dense graphs with a balance of memory and performance

---

## 2. Core Structure of Non-Linear Data Structures

### A. Tree Structures: Binary Tree, BST, AVL, Red-Black Tree

```mermaid
%%{init: { 'theme': 'base', 'themeVariables': { 'edgeLabelBackground': '#fff' }}}%%
flowchart TD
    ROOT["Tree<br/>Hierarchical non-linear structure"] --> BT["Binary Tree<br/>At most 2 children<br/>Preorder, inorder, postorder traversal"]
    ROOT --> BST["BST, binary search tree<br/>Left smaller, right larger<br/>Average O(log N) search"]
    BST --> SKEW["Skewed tree problem<br/>Worst case O(n)<br/>Occurs with sequential insertion"]
    BST --> AVL["AVL tree<br/>Keeps BF between -1 and +1<br/>LL, LR, RL, RR rotations"]
    BST --> RB["Red-Black tree<br/>Maintains 5 properties<br/>Recoloring and rotation on insert/delete"]
    AVL --> ROT["4 rotation types<br/>LL: right rotation<br/>RR: left rotation<br/>LR: left-then-right rotation<br/>RL: right-then-left rotation"]
    RB --> PROP["Properties<br/>Root and leaves = Black<br/>Red node's children = Black<br/>Equal Black height"]
    style ROOT fill:#1E3A5F,stroke:#1E3A5F,color:#fff
    style BT fill:#E3F2FD,stroke:#1976D2,color:#000
    style BST fill:#E3F2FD,stroke:#1976D2,color:#000
    style SKEW fill:#FFEBEE,stroke:#D32F2F,color:#000
    style AVL fill:#E8F5E9,stroke:#388E3C,color:#000
    style RB fill:#F3E5F5,stroke:#7B1FA2,color:#000
    style ROT fill:#E0F2F1,stroke:#00796B,color:#000
    style PROP fill:#E0F2F1,stroke:#00796B,color:#000
```

| Category | BST | AVL tree | Red-Black tree |
|---|---|---|---|
| **Average search** | O(log N) | O(log N) | O(log N) |
| **Worst-case search** | O(n) when skewed | O(log N) guaranteed | O(log N) guaranteed |
| **Insert cost** | O(log N) | O(log N) + rotation | O(log N) + recoloring |
| **Delete cost** | O(log N) | O(log N) + rotation | O(log N) + recoloring |
| **Balance condition** | None | BF strictly -1 to +1 | Equal Black height |
| **Rotation frequency** | None | Frequent on every insert/delete | Relatively rare on insert/delete |
| **Main use** | Basic search | Read-heavy systems | Linux kernel, Java TreeMap |

---

### B. Heap and Graph Representation Structures

```mermaid
%%{init: { 'theme': 'base', 'themeVariables': { 'edgeLabelBackground': '#fff' }}}%%
flowchart TD
    subgraph HEAP["　"]
        direction LR
        MH["Max-Heap<br/>Root = maximum value<br/>Parent >= child"]
        MIH["Min-Heap<br/>Root = minimum value<br/>Parent <= child"]
    end
    subgraph GRAPH["　"]
        direction LR
        AM["Adjacency Matrix<br/>V x V<br/>2D array"]
        AL["Adjacency List<br/>Linked list<br/>per node"]
    end
    style HEAP fill:none,stroke:none
    style GRAPH fill:none,stroke:none
    style MH fill:#FFF3E0,stroke:#F57C00,color:#000
    style MIH fill:#E3F2FD,stroke:#1976D2,color:#000
    style AM fill:#F3E5F5,stroke:#7B1FA2,color:#000
    style AL fill:#E8F5E9,stroke:#388E3C,color:#000
```

| Category | Max-heap | Min-heap |
|---|---|---|
| **Root value** | Overall maximum | Overall minimum |
| **Insert** | O(log N) sift-up | O(log N) sift-up |
| **Delete (root)** | O(log N) sift-down | O(log N) sift-down |
| **Max/min access** | O(1) | O(1) |
| **Main use** | Max-priority queue, heap sort | Dijkstra's shortest path, task scheduler |

| Category | Adjacency matrix | Adjacency list |
|---|---|---|
| **Space complexity** | O(V²) | O(V + E) |
| **Edge check** | O(1) | O(degree) |
| **Full edge traversal** | O(V²) | O(V + E) |
| **Suited to** | Dense graphs (E close to V²) | Sparse graphs (E close to V) |
| **Memory efficiency** | Very wasteful on sparse graphs | Efficient on sparse graphs |
| **Implementation difficulty** | Simple (2D array) | Moderate (array of linked lists) |

---

## 3. Expected Benefits and Practical Applications of Non-Linear Data Structures

| Category | Key benefits | Practical applications |
|---|---|---|
| **Search performance** | AVL/Red-Black trees guarantee O(log N), preventing performance loss from skewed trees | DB indexes (B-Tree), Java TreeMap/TreeSet, the Linux kernel's process scheduler |
| **Priority management** | Heap-based O(1) min-value access enables real-time priority queue processing | OS process scheduling, Dijkstra's shortest path, event-driven systems |
| **Network modeling** | Graph structures efficiently represent complex connections and path search | Shortest-path routing protocols, social-network relationship analysis, building dependency graphs |
| **Space optimization** | Choosing an adjacency list or matrix to fit sparse or dense graph characteristics | Cutting memory on large-scale graphs, optimizing sparse-matrix operations, improving cache locality |
