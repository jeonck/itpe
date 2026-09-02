---
title: Transaction and Concurrency Control
weight: 2
---

A transaction is a logical unit of work in a database that ensures data consistency and integrity through ACID properties. Controlling conflicts between transactions occurring simultaneously in multi-user environments and mechanisms for data recovery when system failures occur are core DBMS functions. In professional engineer exams, ACID, concurrency issues, isolation level anomaly matrices, and recovery techniques are annual standard exam topics.

| Order | Topic | Key Terms | Importance |
|:---:|:---|:---|:---:|
| 1 | [Transaction](transaction) | ACID, state transition diagram, Commit, Rollback, atomicity, consistency, isolation, durability | ★★★★★ |
| 2 | [Concurrency Control](concurrency-control) | Lost Update, Dirty Read, locking, 2PL, deadlock, MVCC, timestamp | ★★★★★ |
| 3 | [Transaction Isolation Level](isolation-level) | Dirty Read, Non-Repeatable Read, Phantom Read, four-level isolation level | ★★★★★ |
| 4 | [Recovery Techniques](recovery) | REDO, UNDO, immediate update, deferred update, checkpoint, shadow page | ★★★★☆ |
