---
title: High Availability and Distributed Database
weight: 4
---

Modern enterprise systems require 24/7 continuous service and global-scale data processing. Single-node databases cannot meet these requirements, so distributed databases and high-availability architectures have become essential technical components.

Distributed databases store data across multiple geographically dispersed nodes while providing transparency that makes the system appear as a single logical database to users. High-availability architecture is a design philosophy that guarantees service continuity even when failures occur.

This section covers the four transparencies of distributed databases, CAP and PACELC theory, and the replication methods and clustering architectures that implement high availability.

## Topic List

| Topic | Core Content | Key Keywords |
|---|---|---|
| **[Distributed Database](distributed-db)** | Design principles and trade-offs of distributed databases understood through four transparencies (location, fragmentation, allocation, replication) and CAP and PACELC theory | location transparency, CAP theory, CP/AP system, PACELC, HBase, Cassandra |
| **[High-Availability Architecture](ha-architecture)** | Zero-downtime service design implemented through synchronous, asynchronous, and semi-synchronous replication and Shared Disk and Shared Nothing clustering | synchronous/asynchronous replication, RTO/RPO, Oracle RAC, Shared Nothing, Active-Active |
