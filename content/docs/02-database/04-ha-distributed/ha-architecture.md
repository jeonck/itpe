---
title: High Availability Architecture
description: HA design that delivers uninterrupted service through synchronous/asynchronous replication and Shared Disk / Shared Nothing clustering
type: docs
weight: 2
---

## 1. Overview of High Availability Architecture — DB Design That Keeps the Service Running Through Failures

```mermaid
%%{init: { 'theme': 'base', 'themeVariables': { 'edgeLabelBackground': '#fff' }}}%%
flowchart LR
    A["Single-server limits<br/>SPOF, downtime occur"] --"Replication, clustering<br/>Automatic failover"--> B["High-availability DB architecture<br/>Replication + clustering"] --"Service continuity<br/>Minimized RTO/RPO"--> C["Uninterrupted service<br/>99.999% availability"]
    style A fill:#FFEBEE,stroke:#D32F2F,color:#000
    style B fill:#E3F2FD,stroke:#1976D2,color:#000
    style C fill:#E8F5E9,stroke:#388E3C,color:#000
```

**Definition**: A DB redundancy architecture designed to guarantee service continuity within a predefined recovery target (RTO/RPO) even when hardware, software, or network failures occur.
- RTO (Recovery Time Objective): the maximum allowed time for the service to recover after a failure
- RPO (Recovery Point Objective): the maximum allowed data-loss point in the event of a failure (how recently the system can recover)
- Availability is expressed as (uptime / total time x 100%); 99.999% ("five nines") allows only about 5 minutes 26 seconds of downtime per year

**Characteristics**:
- **Automatic failover**: promotes a Secondary automatically upon detecting a Primary failure, resuming service without manual intervention
- **Data replication**: delivers changes from the Primary to the Secondary in real time or asynchronously to keep the data redundant
- **Health check**: periodic status monitoring proactively detects failures and triggers automatic recovery

---

## 2. Core Structure of High Availability Architecture

### A. Comparing Data Replication Methods

```mermaid
%%{init: { 'theme': 'base', 'themeVariables': { 'edgeLabelBackground': '#fff' }}}%%
flowchart LR
    subgraph SYNC["Synchronous Replication"]
        direction LR
        SP["Primary<br/>Write"] --> SS1["Secondary1<br/>Confirms receipt"]
        SP --> SS2["Secondary2<br/>Confirms receipt"]
        SS1 --> SACK["After both ACK<br/>Client response"]
        SS2 --> SACK
        style SP fill:#E3F2FD,stroke:#1976D2,color:#000
        style SS1 fill:#E3F2FD,stroke:#1976D2,color:#000
        style SS2 fill:#E3F2FD,stroke:#1976D2,color:#000
        style SACK fill:#E8F5E9,stroke:#388E3C,color:#000
    end

    subgraph ASYNC["Asynchronous Replication"]
        direction LR
        AP["Primary<br/>Write"] --> AACK["Immediate<br/>Client response"]
        AP --> AS["Secondary<br/>Receives later"]
        style AP fill:#F3E5F5,stroke:#7B1FA2,color:#000
        style AACK fill:#E8F5E9,stroke:#388E3C,color:#000
        style AS fill:#FFF3E0,stroke:#F57C00,color:#000
    end

    subgraph SEMI["Semi-Synchronous Replication"]
        direction LR
        MP["Primary<br/>Write"] --> MS["At least 1 Secondary<br/>Confirms receipt"]
        MS --> MACK["After 1 ACK<br/>Client response"]
        style MP fill:#E0F2F1,stroke:#00796B,color:#000
        style MS fill:#E0F2F1,stroke:#00796B,color:#000
        style MACK fill:#E8F5E9,stroke:#388E3C,color:#000
    end
```

| Replication method | Data safety | Performance impact | RTO | RPO | Suitable cases |
|---|---|---|---|---|---|
| **Synchronous replication** | Highest (guarantees no data loss) | High (waits for Secondary response) | Within a few seconds | 0 (no loss) | Financial transactions, medical records, legal data |
| **Asynchronous replication** | Low (some data loss possible) | Minimal (only the Primary commits) | Tens of seconds | Seconds to minutes | Large-volume logs, analytics data, long-distance geo-replication |
| **Semi-synchronous replication** | Medium (guarantees at least 1 Secondary) | Medium (waits for only 1 response) | Seconds to tens of seconds | Minimized | E-commerce, general business systems, MySQL's default HA |
| **Group replication** | High (majority-node consensus) | Medium-high (consensus-protocol overhead) | Automatic, immediate | 0 to a few seconds | Multi-master environments, MySQL InnoDB Cluster |
| **Delayed replication** | Low (deliberately delayed) | Minimal | Minutes to hours | Minutes to hours | Recovering from logical errors, guarding against accidental deletes |

---

### B. Comparing DB Clustering Architectures

```mermaid
%%{init: { 'theme': 'base', 'themeVariables': { 'edgeLabelBackground': '#fff' }}}%%
flowchart TD
    subgraph SHARED_DISK["Shared Disk Architecture: Oracle RAC"]
        direction TB
        SD_N1["Node 1<br/>Instance"] --> SD_SAN["Shared SAN storage<br/>Equal access from every node"]
        SD_N2["Node 2<br/>Instance"] --> SD_SAN
        SD_N1 <--> SD_CF["Cache Fusion<br/>Interconnect"]
        SD_N2 <--> SD_CF
        style SD_N1 fill:#E3F2FD,stroke:#1976D2,color:#000
        style SD_N2 fill:#E3F2FD,stroke:#1976D2,color:#000
        style SD_SAN fill:#1E3A5F,stroke:#1E3A5F,color:#fff
        style SD_CF fill:#FFF3E0,stroke:#F57C00,color:#000
    end

    subgraph SHARED_NOTHING["Shared Nothing Architecture: Cassandra, Vitess"]
        direction TB
        SN_N1["Node 1<br/>Data partition 1"] --> SN_D1["Local storage 1"]
        SN_N2["Node 2<br/>Data partition 2"] --> SN_D2["Local storage 2"]
        SN_N3["Node 3<br/>Data partition 3"] --> SN_D3["Local storage 3"]
        SN_N1 <--> SN_N2
        SN_N2 <--> SN_N3
        style SN_N1 fill:#F3E5F5,stroke:#7B1FA2,color:#000
        style SN_N2 fill:#F3E5F5,stroke:#7B1FA2,color:#000
        style SN_N3 fill:#F3E5F5,stroke:#7B1FA2,color:#000
        style SN_D1 fill:#E0F2F1,stroke:#00796B,color:#000
        style SN_D2 fill:#E0F2F1,stroke:#00796B,color:#000
        style SN_D3 fill:#E0F2F1,stroke:#00796B,color:#000
    end
```

| Architecture type | Configuration | Advantages | Drawbacks | Representative products |
|---|---|---|---|---|
| **Shared Disk** | Every node accesses the same shared storage (SAN), sharing the buffer cache via Cache Fusion | High data consistency, simple data management, easy to add nodes | Storage is a SPOF, high storage cost, limited horizontal scaling | Oracle RAC, IBM DB2 pureScale |
| **Shared Nothing** | Each node holds independent storage, data distributed via partitioning | Fully horizontal scaling, no storage SPOF, cost efficient | Partitioning complexity, cost of cross-partition queries | Cassandra, Vitess, CockroachDB |
| **Active-Active** | Every node handles reads and writes simultaneously | Maximizes load distribution, uninterrupted on node failure | Complex conflict resolution, write-consistency challenges | Oracle RAC, Galera Cluster, CockroachDB |
| **Active-Standby** | Only one Active node writes; Standby waits to receive replication | Simple configuration, easy to guarantee consistency | Wasted Standby resources, RTO exists on failover | MySQL MHA, PostgreSQL Patroni, AWS RDS |
| **Active-Active (asynchronous)** | Active-Active but replication runs asynchronously | Performance-first, allows geographic distribution | RPO exists, conflicts need manual resolution | MySQL Group Replication (asynchronous mode) |

---

## 3. Expected Benefits and Practical Applications of High Availability Architecture

| Category | Key benefits | Practical application |
|---|---|---|
| **Continuity** | Uninterrupted service at RTO of a few seconds and RPO of 0 achieves an SLA of 99.999% | Meet legal requirements for financial, medical, and e-commerce systems with synchronous replication + Active-Standby |
| **Performance** | An Active-Active configuration spreads read load to Secondaries, increasing throughput | Deploy multiple read replicas in read-heavy systems, cutting Primary load by 70-80% |
| **Data protection** | Geographically distributed replication preserves data even through a disaster (fire, flood) | Combine asynchronous replication to a DR (disaster recovery) site with regular snapshots to minimize RPO |
| **Operational efficiency** | Automatic failover and health checks enable unattended recovery from overnight or weekend failures | Automate failover with an orchestrator such as Patroni (PostgreSQL) or MHA (MySQL) |
