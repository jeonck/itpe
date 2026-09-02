---
title: Disk Scheduling and RAID
description: FCFS, SSTF, SCAN, C-SCAN, LOOK scheduling; RAID 0/1/5/6/10 level characteristics (striping, mirroring, parity)
type: docs
weight: 1
---

## 1. Maximizing I/O Performance by Minimizing Head Movement, Overview of Disk Scheduling and RAID

```mermaid
%%{init: { 'theme': 'base', 'themeVariables': { 'edgeLabelBackground': '#fff' }}}%%
flowchart LR
    A["Random I/O requests<br/>Excessive head movement, delay"] --"Scheduling algorithms<br/>RAID parallelization"--> B["Minimizes head movement<br/>Distributes data storage"] --"Shortens seek time<br/>Ensures fault tolerance"--> C["Maximizes I/O throughput<br/>Improves availability, reliability"]
    style A fill:#FFEBEE,stroke:#D32F2F,color:#000
    style B fill:#E3F2FD,stroke:#1976D2,color:#000
    style C fill:#E8F5E9,stroke:#388E3C,color:#000
```

**Definition**: A storage management technique that improves both I/O performance and reliability using scheduling algorithms that optimize disk head movement order and RAID technology that logically combines multiple disks.
- Disk scheduling determines the order in which pending I/O requests are processed, minimizing average seek time
- RAID reflects the performance, capacity, and reliability trade-off in its design through combinations of striping, mirroring, and parity
- When designing server and storage systems, the level must be chosen based on workload characteristics (read-heavy, write-heavy, or mixed)

**Characteristics**:
- **Seek-time-centered optimization**: Algorithms shorten seek time, which accounts for the largest share of rotational latency and transfer time
- **RAID parallelism**: Distributing data across multiple disks improves throughput by a level-dependent multiple compared to a single disk
- **Fault tolerance**: Parity and mirroring guarantee lossless data recovery even when one or two disks fail

---

## 2. Core Structure of Disk Scheduling and RAID

### A. Comparing Five Disk Scheduling Algorithms

```mermaid
%%{init: { 'theme': 'base', 'themeVariables': { 'edgeLabelBackground': '#fff' }}}%%
flowchart LR
    REQ["I/O request queue<br/>98, 183, 37, 122, 14, 124, 65, 67"] --> FCFS["FCFS<br/>Processes in<br/>request order"]
    REQ --> SSTF["SSTF<br/>Prioritizes the request<br/>closest to the current position"]
    REQ --> SCAN["SCAN<br/>Moves to one end<br/>then reverses direction"]
    REQ --> CSCAN["C-SCAN<br/>Services one direction only<br/>then returns end-to-start"]
    REQ --> LOOK["LOOK<br/>Reverses direction<br/>at the last request position"]
    style REQ fill:#1E3A5F,stroke:#1E3A5F,color:#fff
    style FCFS fill:#FFEBEE,stroke:#D32F2F,color:#000
    style SSTF fill:#FFF3E0,stroke:#F57C00,color:#000
    style SCAN fill:#E3F2FD,stroke:#1976D2,color:#000
    style CSCAN fill:#F3E5F5,stroke:#7B1FA2,color:#000
    style LOOK fill:#E8F5E9,stroke:#388E3C,color:#000
```

| Algorithm | Processing Method | Average Seek Time | Fairness | Starvation | Characteristics |
|---|---|---|---|---|---|
| **FCFS** | Processes requests in arrival order | Largest | High | None | Simple to implement, worst performance |
| **SSTF** | Prioritizes the request closest to the current head position | Small | Low | Can occur | High throughput, but risk of starving outer-cylinder requests |
| **SCAN** | Moves to one end, then repeats in reverse | Medium | Medium | None | Elevator algorithm, wait-time difference exists between the two ends |
| **C-SCAN** | Services one direction, then returns to the start | Medium | High | None | Evens out wait times vs. SCAN, but return-move overhead |
| **LOOK** | Reverses direction at the last request position | Small | Medium | None | An improved SCAN, eliminates unnecessary end-of-track movement |

---

### B. RAID Level Structures and Characteristics

```mermaid
%%{init: { 'theme': 'base', 'themeVariables': { 'edgeLabelBackground': '#fff' }}}%%
flowchart TD
    ROOT["RAID<br/>Redundant Array of<br/>Independent Disks"]
    R0["RAID 0<br/>Striping<br/>Performance first"]
    R1["RAID 1<br/>Mirroring<br/>Reliability first"]
    R5["RAID 5<br/>Distributed parity<br/>Performance/reliability balance"]
    R6["RAID 6<br/>Dual parity<br/>High availability"]
    R10["RAID 10<br/>Striping + mirroring<br/>Performance and reliability together"]
    ROOT --> R0
    ROOT --> R1
    ROOT --> R5
    ROOT --> R6
    ROOT --> R10
    style ROOT fill:#1E3A5F,stroke:#1E3A5F,color:#fff
    style R0 fill:#FFEBEE,stroke:#D32F2F,color:#000
    style R1 fill:#E3F2FD,stroke:#1976D2,color:#000
    style R5 fill:#E8F5E9,stroke:#388E3C,color:#000
    style R6 fill:#F3E5F5,stroke:#7B1FA2,color:#000
    style R10 fill:#FFF3E0,stroke:#F57C00,color:#000
```

| RAID Level | Minimum Disks | Usable Capacity | Reliability | Read Performance | Write Performance | Primary Use |
|---|---|---|---|---|---|---|
| **RAID 0** | 2 | All N disks | None (single failure loses everything) | Very high | Very high | Video editing, temporary data |
| **RAID 1** | 2 | N/2 | Tolerates 1 disk failure | High | Medium | OS disk, boot volume |
| **RAID 5** | 3 | N-1 disks | Tolerates 1 disk failure | High | Medium | File server, NAS |
| **RAID 6** | 4 | N-2 disks | Tolerates 2 simultaneous disk failures | High | Low | Large-scale archive, backup |
| **RAID 10** | 4 | N/2 | Tolerates 1 failure per mirror pair | Very high | High | DB server, high-performance transactions |

---

## 3. Expected Benefits and Practical Applications of Disk Scheduling and RAID

| Category | Key Benefits | Practical Applications |
|---|---|---|
| **Performance** | LOOK/SSTF cut average seek time by 30-50%, RAID 0/10 improve I/O throughput | RAID 10 for DB servers, RAID 5 combined with a SCAN algorithm for log servers with heavy sequential access |
| **Reliability** | RAID 5/6 parity recovers data losslessly on disk failure; RAID 6 tolerates 2 simultaneous failures | Apply RAID 6 in mission-critical systems, keep hot-spare disks on standby for automatic rebuild |
| **Availability** | Hot-swap/hot-spare support enables disk replacement with no downtime, ensuring service continuity | Duplicate RAID controllers in SAN/NAS storage, use battery-backed cache to offset write performance |
| **Cost optimization** | Choosing a RAID level suited to workload characteristics cuts unnecessary disk costs | RAID 0 (low-cost, high-performance) for dev/test environments, tiered storage design with RAID 5/10 for production |
