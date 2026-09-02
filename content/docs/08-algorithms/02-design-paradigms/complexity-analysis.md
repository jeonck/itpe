---
title: Algorithm Complexity Analysis
description: Time/space complexity concepts, Big-O/Ω/Θ asymptotic notation, Master Theorem T(n)=aT(n/b)+f(n) recurrence complexity analysis
type: docs
weight: 1
---

## 1. Overview of Complexity Analysis, Mathematically Expressing the Growth Rate of Resource Consumption as Input Size Grows

```mermaid
%%{init: { 'theme': 'base', 'themeVariables': { 'edgeLabelBackground': '#fff' }}}%%
flowchart LR
    A["Algorithm performance<br/>Limits of intuitive measurement"] --"Mathematical quantification<br/>via asymptotic notation"--> B["Complexity analysis<br/>Big-O, Ω, Θ notation"] --"Predicting worst, best,<br/>and average-case guarantees"--> C["Choosing the optimal algorithm<br/>Efficient use of system resources"]
    style A fill:#FFEBEE,stroke:#D32F2F,color:#000
    style B fill:#E3F2FD,stroke:#1976D2,color:#000
    style C fill:#E8F5E9,stroke:#388E3C,color:#000
```

**Definition**: An analytical methodology that mathematically expresses, via asymptotic notation, how an algorithm's execution time and memory usage grow with input size n.
- Time complexity: expresses the operation count as a function of input size n
- Space complexity: expresses the memory an algorithm needs as a function of n
- Compares an algorithm's intrinsic performance abstractly, independent of hardware or environment

**Characteristics**:
- **Asymptotic analysis**: Ignores constant factors and lower-order terms, focusing on the growth trend as input becomes sufficiently large
- **Three notations**: Big-O (worst case), Ω (best case), and Θ (average, exact asymptotic bound) each carry a different performance guarantee
- **Recurrence analysis**: The Master Theorem derives a closed-form complexity for divide-and-conquer algorithms

---

## 2. Core Structure of Complexity Analysis

### A. Time/Space Complexity and the Three Asymptotic Notations

```mermaid
%%{init: { 'theme': 'base', 'themeVariables': { 'edgeLabelBackground': '#fff' }}}%%
flowchart LR
    O1["O(1)<br/>Constant"] --> O2["O(log N)<br/>Logarithmic"] --> O3["O(N)<br/>Linear"] --> O4["O(N log N)<br/>Linearithmic"] --> O5["O(N²)<br/>Quadratic"] --> O6["O(2^N)<br/>Exponential"]
    style O1 fill:#E8F5E9,stroke:#388E3C,color:#000
    style O2 fill:#E3F2FD,stroke:#1976D2,color:#000
    style O3 fill:#E0F2F1,stroke:#00796B,color:#000
    style O4 fill:#FFF3E0,stroke:#F57C00,color:#000
    style O5 fill:#F3E5F5,stroke:#7B1FA2,color:#000
    style O6 fill:#FFEBEE,stroke:#D32F2F,color:#000
```

| Notation | Meaning | Description | Example |
|---|---|---|---|
| **Big-O (O)** | Asymptotic upper bound (worst case) | Positive constants c, n₀ exist such that f(n) ≤ c·g(n) | Bubble sort O(N²) |
| **Omega (Ω)** | Asymptotic lower bound (best case) | Positive constants c, n₀ exist such that f(n) ≥ c·g(n) | Linear search Ω(1) |
| **Theta (Θ)** | Asymptotic tight bound (average) | Both c₁·g(n) ≤ f(n) ≤ c₂·g(n) hold | Merge sort Θ(N log N) |
| **O(1)** | Constant time | Independent of input size, a single operation | Array index access, hash lookup |
| **O(log N)** | Logarithmic time | Search range halves at every step | Binary search, balanced BST |
| **O(N)** | Linear time | Operations grow proportionally to input size | Linear search, array traversal |
| **O(N log N)** | Linearithmic time | Optimal complexity for divide-and-conquer-based sorting | Merge sort, quicksort (average) |
| **O(N²)** | Quadratic time | Nested loops, inefficient sorting | Bubble, selection, insertion sort |
| **O(2^N)** | Exponential time | Exploring every subset, exponential blowup | Fibonacci (naive recursion), enumerating subsets |

---

### B. The Master Theorem and Deriving Recurrence Complexity

```mermaid
%%{init: { 'theme': 'base', 'themeVariables': { 'edgeLabelBackground': '#fff' }}}%%
flowchart LR
    START["T(n) = aT(n/b) + f(n)<br/>Set up the recurrence"] --> CMP["Compare f(n)<br/>with n^(log_b a)"]
    CMP --> C1["Case 1<br/>f(n) = O(n^(log_b a - e))<br/>Smaller by at least e"]
    CMP --> C2["Case 2<br/>f(n) = Θ(n^(log_b a))<br/>Same degree"]
    CMP --> C3["Case 3<br/>f(n) = Ω(n^(log_b a + e))<br/>Larger by at least e"]
    C1 --> R1["T(n) = Θ(n^(log_b a))"]
    C2 --> R2["T(n) = Θ(n^(log_b a) · log n)"]
    C3 --> R3["T(n) = Θ(f(n))"]
    style START fill:#1E3A5F,stroke:#1E3A5F,color:#fff
    style CMP fill:#E3F2FD,stroke:#1976D2,color:#000
    style C1 fill:#E8F5E9,stroke:#388E3C,color:#000
    style C2 fill:#FFF3E0,stroke:#F57C00,color:#000
    style C3 fill:#F3E5F5,stroke:#7B1FA2,color:#000
    style R1 fill:#E8F5E9,stroke:#388E3C,color:#000
    style R2 fill:#FFF3E0,stroke:#F57C00,color:#000
    style R3 fill:#F3E5F5,stroke:#7B1FA2,color:#000
```

| Case | Condition | Result | Derivation example |
|---|---|---|---|
| **Case 1** | f(n) is smaller than n^(log_b a) by at least a polynomial degree e | T(n) = Θ(n^(log_b a)) | T(n)=8T(n/2)+n² → log₂8=3, f(n)=n²=O(n^(3-1)) → Θ(n³) |
| **Case 2** | f(n) is asymptotically the same degree as n^(log_b a) | T(n) = Θ(n^(log_b a) · log n) | Merge sort T(n)=2T(n/2)+n → log₂2=1, f(n)=n=Θ(n¹) → Θ(N log N) |
| **Case 3** | f(n) is larger than n^(log_b a) by at least a polynomial degree e (regularity condition holds) | T(n) = Θ(f(n)) | T(n)=T(n/2)+n → log₂1=0, f(n)=n=Ω(n^(0+1)) → Θ(N) |
| **Merge sort derivation** | T(n)=2T(n/2)+n, a=2, b=2, f(n)=n | n^(log₂2)=n¹ = f(n) → Case 2 | T(n) = Θ(N log N) — O(1) split + O(N) merge × log N levels |

---

## 3. Expected Benefits and Practical Applications of Complexity Analysis

| Category | Key benefits | Practical applications |
|---|---|---|
| **Design** | Comparing candidate algorithms' performance mathematically before implementation minimizes rework | Estimate the expected input-size range during requirements analysis, then set an acceptable complexity ceiling |
| **Optimization** | Identifying the complexity class of a bottleneck reveals the path from O(N²) to O(N log N) | Profile to find hotspots, swap in a better sorting/search algorithm, or adopt a hash-based structure |
| **Recurrence analysis** | The Master Theorem quickly derives a closed-form complexity for divide-and-conquer algorithms | Verify cases the Master Theorem cannot handle with the recursion-tree method or the substitution method |
| **Testing and validation** | Verifying both correctness and efficiency, theoretically and empirically, builds confidence | Measure execution time across input sizes and confirm the actual complexity class on a log-log plot |
