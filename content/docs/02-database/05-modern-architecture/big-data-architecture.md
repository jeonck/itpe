---
title: Big Data Storage and Analytics Architecture
description: The evolution of data warehouses, data lakes, and lakehouses, and the Hadoop/Spark distributed processing frameworks
type: docs
weight: 2
---

## 1. Overview of Big Data Architecture — An Ecosystem That Handles Collection, Storage, and Analysis End to End

```mermaid
%%{init: { 'theme': 'base', 'themeVariables': { 'edgeLabelBackground': '#fff' }}}%%
flowchart LR
    A["Limits of a traditional DW<br/>Cannot store unstructured data<br/>High cost, vertical scaling"] --"Distributed storage/processing<br/>Schema-on-read"--> B["Big data platform<br/>Lakehouse + Spark<br/>Lambda architecture"] --"Unified batch and real time<br/>ML, BI analysis"--> C["Data-driven enterprise<br/>Real-time insights<br/>Cost-efficient analysis"]
    style A fill:#FFEBEE,stroke:#D32F2F,color:#000
    style B fill:#E3F2FD,stroke:#1976D2,color:#000
    style C fill:#E8F5E9,stroke:#388E3C,color:#000
```

**Definition**: A distributed-computing data-platform architecture that collects, stores, processes, and analyzes large volumes of structured, semi-structured, and unstructured data, handling data with the 4V characteristics — Volume, Velocity, Variety, and Veracity.
- Data storage has evolved from schema-on-write (DW) to schema-on-read (Data Lake), and now to the lakehouse, which unifies the strengths of both.
- Processing frameworks have progressed from Hadoop MapReduce batch processing to Spark's in-memory processing, and on to Flink's real-time stream processing.
- Lambda architecture and Kappa architecture are the representative design patterns that unify batch and real-time data processing.

**Characteristics**:
- **Handling multiple data forms**: manages structured (CSV, DB), semi-structured (JSON, XML, logs), and unstructured (images, video, text) data together on a single platform
- **Linearly scaling distributed processing**: a horizontally scaling architecture that processes petabyte-scale data in parallel across hundreds to thousands of commodity servers
- **Cost-efficient storage**: uses inexpensive commodity disks and object storage (S3) instead of costly SAN, cutting the cost per TB stored to roughly a tenth

---

## 2. Core Structure of Big Data Architecture

### A. The Evolution of Data Storage Architecture

```mermaid
%%{init: { 'theme': 'base', 'themeVariables': { 'edgeLabelBackground': '#fff' }}}%%
flowchart LR
    DW["Data Warehouse DW<br/>Structured data<br/>Schema-on-write<br/>Optimized for OLAP"]

    DM["Data Mart<br/>A departmental subset of the DW<br/>Domain-specific"]

    DL["Data Lake<br/>All raw data<br/>Schema-on-read"]

    LH["Data Lakehouse<br/>Lakehouse<br/>DW manageability + lake flexibility<br/>Delta Lake, Iceberg"]

    DW --> DM
    DW --> DL
    DL --> LH

    style DW fill:#E3F2FD,stroke:#1976D2,color:#000
    style DM fill:#F3E5F5,stroke:#7B1FA2,color:#000
    style DL fill:#FFF3E0,stroke:#F57C00,color:#000
    style LH fill:#1E3A5F,stroke:#1E3A5F,color:#fff
```

**Data warehouse (DW) multidimensional modeling**:
- **MOLAP (Multidimensional OLAP)**: stores data pre-aggregated as a hypercube; fastest query speed, inefficient storage space
- **ROLAP (Relational OLAP)**: stores data in a relational DB via a star or snowflake schema; flexible but slower aggregation
- **HOLAP (Hybrid OLAP)**: a mix of MOLAP and ROLAP — summary data in a cube, detail data stored relationally

| Storage type | Data form | Schema approach | Strengths | Weaknesses |
|---|---|---|---|---|
| **Data warehouse** | Structured data, ETL preprocessing done | Schema-on-write (predefined) | High-performance OLAP queries, guaranteed data quality | Cannot handle unstructured data, schema-change cost |
| **Data mart** | A DW subset, department-specific | Schema-on-write | Fast domain analysis, easy for users to understand | Depends on the DW, burden of managing duplicate data |
| **Data lake** | Structured, semi-structured, and unstructured raw data | Schema-on-read (defined at use time) | Stores all data, low-cost object storage | Governance failures create a data swamp |
| **Data lakehouse** | Unified structured and unstructured data, ACID support | Metadata management + schema evolution | DW performance + lake flexibility, unified governance | New-technology adoption complexity, still maturing |
| **Data mesh** | Domain-distributed management | Domain-ownership based | Organizational autonomy, scalability | Governance standardization is challenging |

---

### B. Large-Scale Processing Frameworks

```mermaid
%%{init: { 'theme': 'base', 'themeVariables': { 'edgeLabelBackground': '#fff' }}}%%
flowchart TD
    subgraph HADOOP["Hadoop Ecosystem - Disk-Based"]
        direction LR
        HDFS["HDFS<br/>Distributed file system<br/>Block replication"] --> MR["MapReduce<br/>Batch processing<br/>Map + Reduce"]
        YARN["YARN<br/>Resource manager"] --> MR
        style HDFS fill:#FFF3E0,stroke:#F57C00,color:#000
        style MR fill:#FFF3E0,stroke:#F57C00,color:#000
        style YARN fill:#FFF3E0,stroke:#F57C00,color:#000
    end

    subgraph SPARK["Apache Spark - In-Memory Based"]
        direction LR
        SC["Spark Core<br/>RDD, DataFrame<br/>In-memory engine"] --> SQL["Spark SQL<br/>Structured data"]
        SC --> SS["Spark Streaming<br/>Micro-batch"]
        SC --> ML["MLlib<br/>Machine learning"]
        SC --> GX["GraphX<br/>Graph processing"]
        style SC fill:#E3F2FD,stroke:#1976D2,color:#000
        style SQL fill:#E3F2FD,stroke:#1976D2,color:#000
        style SS fill:#E3F2FD,stroke:#1976D2,color:#000
        style ML fill:#E3F2FD,stroke:#1976D2,color:#000
        style GX fill:#E3F2FD,stroke:#1976D2,color:#000
    end

    subgraph LAMBDA["Lambda Architecture"]
        direction LR
        RAW["Raw data"] --> BATCH["Batch layer<br/>Hadoop, Spark<br/>Full reprocessing"]
        RAW --> SPEED["Speed layer<br/>Flink, Kafka Streams<br/>Real-time processing"]
        BATCH --> SERVING["Serving layer<br/>Druid, Cassandra<br/>Query responses"]
        SPEED --> SERVING
        style RAW fill:#FFEBEE,stroke:#D32F2F,color:#000
        style BATCH fill:#FFF3E0,stroke:#F57C00,color:#000
        style SPEED fill:#F3E5F5,stroke:#7B1FA2,color:#000
        style SERVING fill:#E8F5E9,stroke:#388E3C,color:#000
    end

    HADOOP --> SPARK
    SPARK --> LAMBDA
```

| Framework | Processing method | Strengths | Weaknesses | Suitable cases |
|---|---|---|---|---|
| **Hadoop MapReduce** | Disk-based batch processing, Map -> Shuffle -> Reduce | Proven stability, handles petabytes, open-source ecosystem | Slow processing from a disk I/O bottleneck, inefficient for iterative work | Log analysis, large-scale ETL, overnight batch jobs |
| **Apache Spark** | In-memory RDD/DataFrame, DAG-optimized execution | 10x faster than MapReduce for batch, 100x faster in-memory | Memory cost, OOM risk, inefficient for small data | Machine learning, interactive analytics, streaming, SQL queries |
| **Apache Flink** | True event-driven stream processing, stateful operations | Lowest latency for real-time processing, guarantees exactly-once | Learning curve, less optimized for batch processing | Real-time fraud detection, event-driven processing |
| **Kafka Streams** | Stream processing on Kafka topics, a lightweight library | No separate cluster needed, integrates with the Kafka ecosystem | Limited processing complexity, no batch support | Real-time data transformation, event aggregation |
| **Delta Lake / Iceberg** | Lakehouse table format, ACID transaction support | Schema evolution, time travel, statistics-based optimization | Extra metadata management, small-file problem | Lakehouse-based analytics workloads needing ACID guarantees |

---

## 3. Expected Benefits and Practical Applications of Big Data Architecture

| Category | Key benefits | Practical application |
|---|---|---|
| **Cost reduction** | Combining object storage (S3) with Spark instead of an expensive DW cuts cost per TB to roughly a tenth | Migrate an existing Teradata/Oracle DW to an S3-based lakehouse (Delta Lake) on AWS |
| **Processing speed** | Spark's in-memory processing shrinks daily batch jobs to hours or minutes, minimizing decision-making delay | Convert an overnight batch ETL pipeline to Spark, turning D+1 reports into a real-time dashboard |
| **Data integration** | Unifying structured and unstructured data in a single lake breaks down data silos and enables integrated analysis | Combine purchase history (DB), social media text, and app logs into a 360-degree customer view |
| **AI/ML integration** | Tools like MLlib and TensorFlow on Spark build large-scale, data-driven machine learning pipelines | Automate a Spark-based ML pipeline from feature engineering through model training and serving |
