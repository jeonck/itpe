---
title: CPU Scheduling Algorithms
description: Non-preemptive (FCFS, SJF, HRN), preemptive (SRT, Round-Robin, MLFQ), multilevel feedback queue
type: docs
weight: 3
---

## 1. Overview of CPU Scheduling, a Policy Design that Minimizes Process Wait Time and Maximizes CPU Efficiency

```mermaid
%%{init: { 'theme': 'base', 'themeVariables': { 'edgeLabelBackground': '#fff' }}}%%
flowchart LR
    A["Many processes competing<br/>CPU idling, starvation"] --"Choosing non-preemptive or<br/>preemptive policy algorithms"--> B["Scheduling algorithms<br/>FCFS, SJF, RR, MLFQ"] --"Average wait time,<br/>throughput optimized"--> C["CPU utilization maximized,<br/>fairness and responsiveness secured"]
    style A fill:#FFEBEE,stroke:#D32F2F,color:#000
    style B fill:#E3F2FD,stroke:#1976D2,color:#000
    style C fill:#E8F5E9,stroke:#388E3C,color:#000
```

**Definition**: A core operating-system policy that decides the order and manner in which the CPU is assigned to processes in the Ready Queue, split into two families: non-preemptive and preemptive.
- Scheduling metrics: CPU utilization, throughput, turnaround time, waiting time, response time
- Non-preemptive scheduling cannot switch processes until the running process voluntarily releases the CPU
- Preemptive scheduling can forcibly reclaim the CPU from a running process based on priority or time quantum

**Characteristics**:
- **Algorithm diversity**: Choose the optimal algorithm — FCFS, SJF, HRN, SRT, RR, MLFQ — based on environment and goals
- **Starvation management**: Aging gradually raises the priority of long-waiting processes
- **Hierarchical feedback**: MLFQ adapts to process characteristics (CPU-bound vs. I/O-bound) based on past CPU usage history

---

## 2. Core Structure of CPU Scheduling

### A. Non-Preemptive Scheduling: FCFS, SJF, HRN

```mermaid
%%{init: { 'theme': 'base', 'themeVariables': { 'edgeLabelBackground': '#fff' }}}%%
flowchart LR
    Q["Ready Queue"] --> FCFS["FCFS<br/>In arrival order,<br/>first in first out"]
    Q --> SJF["SJF<br/>Shortest service time<br/>process first"]
    Q --> HRN["HRN<br/>Priority = wait + service<br/>divided by service"]
    FCFS --> CPU["CPU allocation<br/>Non-preemptive execution"]
    SJF --> CPU
    HRN --> CPU
    style Q fill:#E3F2FD,stroke:#1976D2,color:#000
    style FCFS fill:#FFF3E0,stroke:#F57C00,color:#000
    style SJF fill:#F3E5F5,stroke:#7B1FA2,color:#000
    style HRN fill:#E0F2F1,stroke:#00796B,color:#000
    style CPU fill:#1E3A5F,stroke:#1E3A5F,color:#fff
```

| Algorithm | Selection Criteria | Starvation | Overhead | Suitable Environment | Notes |
|---|---|---|---|---|---|
| **FCFS** | Arrival time order (first in first out) | None | Very low | Batch processing systems | Convoy effect: a long job makes short jobs wait |
| **SJF** | Prioritizes the process with the shortest service time (CPU burst) | Occurs (long jobs wait indefinitely) | Low | Interactive systems, minimizing average wait | Optimal algorithm, but service time cannot be predicted |
| **HRN** | Priority = (waiting time + service time) / service time | None (aging built in) | Medium | Environments needing to fix SJF's starvation | Priority rises automatically the longer a process waits |

---

### B. Preemptive Scheduling: SRT, Round-Robin, MLFQ, and the Multilevel Feedback Queue

```mermaid
%%{init: { 'theme': 'base', 'themeVariables': { 'edgeLabelBackground': '#fff' }}}%%
flowchart TD
    ROOT["Preemptive Scheduling"] --> SRT["SRT<br/>Shortest Remaining Time<br/>Preempts for shortest remaining time"]
    ROOT --> RR["Round-Robin<br/>Allocated cyclically<br/>in time-quantum units"]
    ROOT --> MLFQ["MLFQ<br/>Multilevel Feedback Queue<br/>Dynamic priority"]
    MLFQ --> Q1["Queue 1: Highest priority<br/>Short time quantum (interactive)"]
    MLFQ --> Q2["Queue 2: Medium priority<br/>Medium time quantum"]
    MLFQ --> Q3["Queue 3: Lowest priority<br/>Long time quantum (batch)"]
    Q1 --"Demoted if quantum exceeded"--> Q2
    Q2 --"Demoted if quantum exceeded"--> Q3
    Q3 --"Promoted when aging applies"--> Q2
    style ROOT fill:#1E3A5F,stroke:#1E3A5F,color:#fff
    style SRT fill:#E8F5E9,stroke:#388E3C,color:#000
    style RR fill:#E3F2FD,stroke:#1976D2,color:#000
    style MLFQ fill:#F3E5F5,stroke:#7B1FA2,color:#000
    style Q1 fill:#FFEBEE,stroke:#D32F2F,color:#000
    style Q2 fill:#FFF3E0,stroke:#F57C00,color:#000
    style Q3 fill:#E0F2F1,stroke:#00796B,color:#000
```

| Algorithm | Selection Criteria | Starvation | Overhead | Time Quantum | Suitable Environment |
|---|---|---|---|---|---|
| **SRT** | Preempts for the process with the shortest remaining service time | Occurs (long jobs wait indefinitely) | Medium (frequent preemption) | None (event-driven) | Minimizing response time, interactive |
| **Round-Robin** | Forces a switch to the next process when the time quantum (q) expires | None | Proportional to quantum size | 10-100 ms recommended | Time-sharing systems, fairness-focused environments |
| **MLFQ** | A process is demoted to a lower queue for using more CPU, and returns to a higher queue when I/O completes | Prevented via aging | High (managing movement between queues) | Varies by queue (shorter at the top) | General-purpose OS (Linux CFS-based), mixed workloads |
| **Time quantum choice** | Too small causes context-switch overhead to spike; too large approaches FCFS | - | Inversely proportional to quantum size | Empirically, about 80% of processes finish within one quantum | Decided after analyzing the process's average CPU burst distribution |

---

## 3. Expected Benefits and Practical Applications of Applying CPU Scheduling

| Category | Key Benefits | Practical Applications |
|---|---|---|
| **Performance** | Choosing the right algorithm shortens average wait and turnaround time and maximizes CPU utilization | Applying SJF/MLFQ after analyzing workload characteristics (CPU-bound vs. I/O-bound), visualizing performance with Gantt charts |
| **Fairness** | Round-Robin and aging guarantee every process a reasonable share of CPU time | Linux's CFS (Completely Fair Scheduler) distributes CPU fairly based on virtual runtime, priority adjusted via the nice value |
| **Responsiveness** | Preemptive MLFQ keeps interactive processes in higher queues, improving perceived response speed | Applying Rate-Monotonic and EDF algorithms in real-time systems (RTOS), guaranteeing deadline-based priority |
| **Scalability** | Combining CPU affinity and load balancing in multicore environments enables linear scaling | Pinning threads to cores with Linux `taskset`/`sched_setaffinity`, minimizing memory latency with NUMA-aware scheduling |
