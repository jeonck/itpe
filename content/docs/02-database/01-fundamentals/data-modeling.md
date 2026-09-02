---
title: Data Modeling
description: A design technique that abstracts the real world into a database structure through a conceptual-logical-physical 3-stage transformation
type: docs
weight: 2
---

## 1. Overview of Data Modeling, a Systematic Design Technique That Transforms the Real World into a DB Structure Through 3-Stage Abstraction

```mermaid
%%{init: { 'theme': 'base', 'themeVariables': { 'edgeLabelBackground': '#fff' }}}%%
flowchart LR
    A["Unstructured real world<br/>Business requirements<br/>Complex relationship structures"] --"Abstraction, conceptualization,<br/>3-stage transformation process"--> B["Data modeling<br/>Conceptual → Logical → Physical<br/>Progressive refinement"] --"Implementable design,<br/>structure, operations, constraints defined"--> C["Optimized DB schema<br/>Easy maintenance<br/>Performance, scalability secured"]
    style A fill:#FFEBEE,stroke:#D32F2F,color:#000
    style B fill:#E3F2FD,stroke:#1976D2,color:#000
    style C fill:#E8F5E9,stroke:#388E3C,color:#000
```

**Definition**: A systematic technique that designs a database structure by progressively abstracting real-world business concepts and relationships through three stages — conceptual, logical, and physical.
- Conceptual modeling represents business entities and relationships with an E-R diagram; logical modeling converts them into a relation schema
- Physical modeling determines indexes, partitions, and storage structure to produce a DBMS-optimized final schema
- It responds flexibly to requirement changes and serves as a communication tool between the development team and domain experts

**Characteristics**:
- **Progressive refinement**: Detail grows progressively from the highly abstract conceptual model to the implementation-level physical model, catching errors early
- **Independent representation**: A logical model that isn't tied to a specific DBMS lets the physical model map to various platforms
- **Communication tool**: The E-R diagram works as a shared language that even non-technical staff can understand, and it's used to verify requirements

---

## 2. Core Structure of Data Modeling

### A. The 3-Stage Data Modeling Procedure and E-R Diagram Components

```mermaid
%%{init: { 'theme': 'base', 'themeVariables': { 'edgeLabelBackground': '#fff' }}}%%
flowchart LR
    S1["Conceptual modeling<br/>E-R diagram<br/>Identify entities, relationships, attributes"] --> S2["Logical modeling<br/>Relation schema<br/>Normalization, key definition"] --> S3["Physical modeling<br/>Tables, indexes<br/>Partitions, storage structure"]
    style S1 fill:#F3E5F5,stroke:#7B1FA2,color:#000
    style S2 fill:#E3F2FD,stroke:#1976D2,color:#000
    style S3 fill:#E8F5E9,stroke:#388E3C,color:#000
```

**Core Components of the E-R Diagram**

```mermaid
%%{init: { 'theme': 'base', 'themeVariables': { 'edgeLabelBackground': '#fff' }}}%%
flowchart TD
    ROOT["E-R Diagram<br/>Components"] --> E["Entity"]
    ROOT --> R["Relationship"]
    ROOT --> A["Attribute"]
    E --> E1["Strong entity<br/>Can exist independently"]
    E --> E2["Weak entity<br/>Depends on a parent entity"]
    R --> R1["1:1 relationship<br/>One-to-one correspondence"]
    R --> R2["1:N relationship<br/>One-to-many correspondence"]
    R --> R3["M:N relationship<br/>Many-to-many junction table"]
    A --> A1["Simple attribute<br/>Cannot be decomposed further"]
    A --> A2["Composite attribute<br/>Composed of several simple attributes"]
    A --> A3["Multivalued attribute<br/>Can hold multiple values"]
    style ROOT fill:#1E3A5F,stroke:#1E3A5F,color:#fff
    style E fill:#E3F2FD,stroke:#1976D2,color:#000
    style R fill:#F3E5F5,stroke:#7B1FA2,color:#000
    style A fill:#FFF3E0,stroke:#F57C00,color:#000
    style E1 fill:#E3F2FD,stroke:#1976D2,color:#000
    style E2 fill:#E3F2FD,stroke:#1976D2,color:#000
    style R1 fill:#F3E5F5,stroke:#7B1FA2,color:#000
    style R2 fill:#F3E5F5,stroke:#7B1FA2,color:#000
    style R3 fill:#F3E5F5,stroke:#7B1FA2,color:#000
    style A1 fill:#FFF3E0,stroke:#F57C00,color:#000
    style A2 fill:#FFF3E0,stroke:#F57C00,color:#000
    style A3 fill:#FFF3E0,stroke:#F57C00,color:#000
```

| Modeling Stage | Deliverable | Key Activities | Participants |
|:---:|:---|:---|:---|
| **Conceptual modeling** | E-R diagram | Identify entities, define relationships, derive key attributes, determine cardinality | Business staff, DA |
| **Logical modeling** | Relation schema | E-R → table conversion, normalization, PK/FK definition, domain setup | DBA, DA |
| **Physical modeling** | DDL script | Index design, partition strategy, storage parameters, clustering decisions | DBA, system engineer |

**E-R Diagram → Relation Schema Conversion Rules**

| Conversion Target | Conversion Rule | Result |
|:---:|:---|:---|
| **Strong entity** | Entity → independent table, primary-key attribute → PK | Creates a standalone table |
| **Weak entity** | Partial key + parent PK → composite PK | Table includes the parent's FK |
| **1:1 relationship** | Add FK to the table with lower participation, or merge the tables | FK added, or a single table |
| **1:N relationship** | Add the "1" side's PK as an FK on the "N" side table | FK column on the "N" side |
| **M:N relationship** | Create a separate junction table, both PKs → composite PK | Creates a cross-reference table |
| **Multivalued attribute** | Split into a separate table, original entity's PK → FK | A separate table in a 1:N structure |

---

### B. Data Model Representation Elements and Physical Modeling Design Strategy

```mermaid
%%{init: { 'theme': 'base', 'themeVariables': { 'edgeLabelBackground': '#fff' }}}%%
flowchart TD
    ROOT["Data model<br/>3 representation elements"] --> S["Structure"]
    ROOT --> O["Operation"]
    ROOT --> C["Constraint"]
    S --> S1["Entities, attributes, relationships<br/>Static schema structure"]
    O --> O1["Insert, delete, update, search<br/>Data manipulation operations"]
    C --> C1["Domain, integrity<br/>Business rules applied"]
    style ROOT fill:#1E3A5F,stroke:#1E3A5F,color:#fff
    style S fill:#E3F2FD,stroke:#1976D2,color:#000
    style O fill:#F3E5F5,stroke:#7B1FA2,color:#000
    style C fill:#FFF3E0,stroke:#F57C00,color:#000
    style S1 fill:#E3F2FD,stroke:#1976D2,color:#000
    style O1 fill:#F3E5F5,stroke:#7B1FA2,color:#000
    style C1 fill:#FFF3E0,stroke:#F57C00,color:#000
```

**Core Design Elements of Physical Modeling**

```mermaid
%%{init: { 'theme': 'base', 'themeVariables': { 'edgeLabelBackground': '#fff' }}}%%
flowchart LR
    P1["Index design<br/>B-Tree, Bitmap<br/>Composite, function-based indexes"] --> P2["Partitioning<br/>Range, Hash, List<br/>Composite partitions"] --> P3["Clustering<br/>IOT, cluster tables<br/>Optimized data placement"] --> P4["Storage structure<br/>Tablespaces<br/>Block size, row migration"]
    style P1 fill:#E3F2FD,stroke:#1976D2,color:#000
    style P2 fill:#F3E5F5,stroke:#7B1FA2,color:#000
    style P3 fill:#FFF3E0,stroke:#F57C00,color:#000
    style P4 fill:#E8F5E9,stroke:#388E3C,color:#000
```

| Physical Design Element | Design Criteria | Performance Effect | Cautions |
|:---:|:---|:---|:---|
| **B-Tree index** | High-cardinality columns, range-search conditions | 10-100x faster point and range searches | Degrades DML performance; avoid over-indexing |
| **Bitmap index** | Low-cardinality columns (gender, status code), OLAP | Parallel AND/OR processing, optimized aggregate queries | Unsuited to OLTP; wide lock scope |
| **Range partition** | Large history tables keyed by date or sequence | Partition pruning greatly narrows the scan range | Partition key choice determines performance |
| **Hash partition** | When even distribution is needed; optimizes join performance | Guarantees uniform distribution with no data skew | No range search; use a power of two for partition count |
| **Cluster index** | Table groups that are frequently queried together | Minimizes join I/O via the cluster key | Changing the cluster key requires data relocation |

---

## 3. Expected Benefits and Practical Applications of Data Modeling

| Category | Key Benefits | Practical Application |
|:---:|:---|:---|
| **Design quality** | Catches requirement errors early, cutting downstream rework costs by 60-80% | Adopt a conceptual model review checklist; run joint E-R diagram review workshops with domain experts |
| **Communication** | Using the E-R diagram as a shared language minimizes requirement misunderstandings between business, development, and DBA teams | Define API contracts based on the logical model; use the domain model to design microservice boundaries |
| **System flexibility** | Keeping a DBMS-independent logical model eases cloud migration and multi-DB architecture changes | Manage a logical model repository; automate the physical model with DDL generation tools (ERwin, DataGrip) |
| **Performance optimization** | Pre-designing indexes and partitions at the physical modeling stage proactively prevents performance issues after go-live | Design indexes based on query-pattern analysis; cut lookup response time with a partition strategy for large history tables |
