---
title: Distributed Database
description: Design principles and trade-offs of distributed databases, understood through the four transparencies and CAP/PACELC theory
type: docs
weight: 1
---

## 1. Overview of Distributed Databases — A Single Logical DB System Spread Geographically

```mermaid
%%{init: { 'theme': 'base', 'themeVariables': { 'edgeLabelBackground': '#fff' }}}%%
flowchart LR
    A["Single-node limits<br/>Lacking scalability, availability"] --"Distributed storage,<br/>Guaranteed transparency"--> B["Distributed database<br/>Four transparencies + CAP design"] --"Global service<br/>Uninterrupted scaling"--> C["High availability achieved<br/>Horizontal scaling realized"]
    style A fill:#FFEBEE,stroke:#D32F2F,color:#000
    style B fill:#E3F2FD,stroke:#1976D2,color:#000
    style C fill:#E8F5E9,stroke:#388E3C,color:#000
```

**Definition**: A DB system that distributes data across multiple physical nodes connected by a network, while providing users the transparency of a single logical database.
- Each node operates independently and can handle both local and distributed transactions.
- Consistency is maintained through distributed transaction protocols such as 2PC (Two-Phase Commit) or the Saga pattern.
- Under CAP theory, only two of consistency (C), availability (A), and partition tolerance (P) can be guaranteed at the same time.

**Characteristics**:
- **Transparency**: provides logical unity so users can access data without knowing its physical location, splitting method, or replication status
- **Autonomy**: a distributed control structure where each node manages its local data independently while still cooperating at the system-wide level
- **Horizontal scalability**: processing capacity scales linearly just by adding nodes, overcoming a single server's physical limits

---

## 2. Core Structure of Distributed Databases

### A. The Four Transparencies of a Distributed DB

```mermaid
%%{init: { 'theme': 'base', 'themeVariables': { 'edgeLabelBackground': '#fff' }}}%%
flowchart TD
    USER["User request<br/>A simple SQL query"]
    style USER fill:#1E3A5F,stroke:#1E3A5F,color:#fff

    T1["Location Transparency<br/>Access regardless of data location"]
    T2["Fragmentation Transparency<br/>Access regardless of split method"]
    T3["Replication Transparency<br/>Access regardless of replication"]
    T4["Concurrency Transparency<br/>Unaware of concurrent-access conflicts"]

    style T1 fill:#E3F2FD,stroke:#1976D2,color:#000
    style T2 fill:#F3E5F5,stroke:#7B1FA2,color:#000
    style T3 fill:#FFF3E0,stroke:#F57C00,color:#000
    style T4 fill:#E0F2F1,stroke:#00796B,color:#000

    PHYSICAL["Physically distributed storage<br/>Node A / Node B / Node C"]
    style PHYSICAL fill:#E8F5E9,stroke:#388E3C,color:#000

    USER --> T1
    USER --> T2
    USER --> T3
    USER --> T4
    T1 --> PHYSICAL
    T2 --> PHYSICAL
    T3 --> PHYSICAL
    T4 --> PHYSICAL
```

| Transparency type | Definition | Implementation mechanism | Effect |
|---|---|---|---|
| **Location transparency** | Accessible without knowing which node stores the data | Global catalog, distributed directory service | No application change when physically relocating the DB |
| **Fragmentation transparency** | Data appears whole even when horizontally or vertically split | Query decomposer, union recombination | No application change when the splitting strategy changes |
| **Replication transparency** | Data replicated across multiple nodes appears as a single copy | Replication manager, version vectors | No application change when adjusting the replication count |
| **Concurrency transparency** | Concurrent access by many users hides conflicts from them | Distributed lock, MVCC | Concurrency control logic is handled automatically at the DB layer |
| **Failure transparency** | The whole system appears to work normally even when some nodes fail | Automatic failover, retry mechanism | Prevents partial failures from reaching users |

---

### B. CAP Theory and PACELC Theory

```mermaid
%%{init: { 'theme': 'base', 'themeVariables': { 'edgeLabelBackground': '#fff' }}}%%
flowchart TD
    subgraph CAP["CAP theory - cannot guarantee all three at once"]
        direction LR
        C["Consistency C<br/>Consistency<br/>Every node has identical data"]
        A["Availability A<br/>Availability<br/>Always guarantees a response"]
        P["Partition tolerance P<br/>Partition Tolerance<br/>Tolerates network splits"]
        style C fill:#E3F2FD,stroke:#1976D2,color:#000
        style A fill:#F3E5F5,stroke:#7B1FA2,color:#000
        style P fill:#FFF3E0,stroke:#F57C00,color:#000
    end

    subgraph CP["CP systems"]
        CP1["HBase<br/>Zookeeper<br/>MongoDB (default)"]
        style CP1 fill:#E3F2FD,stroke:#1976D2,color:#000
    end

    subgraph AP["AP systems"]
        AP1["Cassandra<br/>CouchDB<br/>DynamoDB"]
        style AP1 fill:#F3E5F5,stroke:#7B1FA2,color:#000
    end

    subgraph PACELC["PACELC extended theory"]
        direction LR
        PAC["During a network partition<br/>P: A (available) vs C (consistent)"] --> ELC["Without a partition<br/>E: L (latency) vs C (consistent)"]
        style PAC fill:#FFEBEE,stroke:#D32F2F,color:#000
        style ELC fill:#E8F5E9,stroke:#388E3C,color:#000
    end

    C --> CP
    A --> AP
    P --> CP
    P --> AP
    CAP --> PACELC
```

| CAP combination | What is sacrificed | Characteristics | Representative systems | Suitable use cases |
|---|---|---|---|---|
| **CP system** | Availability (A) | Rejects some requests during a partition, guarantees strong consistency | HBase, Zookeeper, MongoDB (default) | Financial transactions, inventory management, distributed coordination |
| **AP system** | Consistency (C) | Can return stale data during a partition, always responds | Cassandra, CouchDB, DynamoDB | Social feeds, shopping carts, DNS systems |
| **CA system** | Partition tolerance (P) | Single node or same network, does not tolerate partitions | Traditional RDBMS (MySQL, PostgreSQL) | Single-datacenter OLTP systems |
| **PACELC: PC/EL** | Availability, latency | Prioritizes consistency both during a partition and normally | HBase, VoltDB | Environments requiring strong consistency, such as finance and healthcare |
| **PACELC: PA/EL** | Consistency (both cases) | Available during a partition, minimizes latency normally | Cassandra, DynamoDB | Large-scale global services, eventual consistency acceptable |
| **PACELC: PA/EC** | Consistency, latency (mixed) | Available during a partition, consistent normally | PNUTS, Megastore | Multi-region, read-heavy services |

---

## 3. Expected Benefits and Practical Applications of Distributed Databases

| Category | Key benefits | Practical application |
|---|---|---|
| **Scalability** | Horizontal scaling maintains linear performance even under a data explosion | Dynamically add nodes to handle peak load for high-traffic services (commerce, gaming) |
| **Availability** | Eliminating a single point of failure (SPOF) keeps the service continuous even when some nodes fail | Achieve uninterrupted service and RPO 0 with an Active-Active configuration |
| **Performance** | Region-based data placement minimizes network latency and spreads reads | Combine with a CDN pattern to serve global users with the lowest possible data latency |
| **Design optimization** | CAP/PACELC theory lets you choose a DB suited to the service's characteristics | Apply the selection criteria: CP systems (HBase) for finance, AP systems (Cassandra) for social media and logs |
