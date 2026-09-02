---
title: Process and Thread Management
weight: 4
---

Process and thread management and CPU scheduling, core to operating systems, are fundamental technologies determining system performance and resource efficiency. This section covers three key topics: process lifecycle and context switching, multithreading models, and scheduling algorithms.

| Topic | Core Content | Key Keywords |
|---|---|---|
| **[Process Management](process)** | PCB structure, process state transitions (Create→Ready→Running→Waiting→Terminated), context switching mechanism | PCB, context switching, state transition diagram |
| **[Thread Models and Multithreading](thread)** | Process vs thread differences, user-level, kernel-level, hybrid (M:N) threading model comparison | User-level thread, kernel-level thread, M:1, 1:1, M:N |
| **[CPU Scheduling Algorithms](cpu-scheduling)** | Non-preemptive (FCFS, SJF, HRN), preemptive (SRT, Round-Robin, MLFQ), multilevel feedback queue operating principles | Starvation, aging, time quantum, MLFQ |
