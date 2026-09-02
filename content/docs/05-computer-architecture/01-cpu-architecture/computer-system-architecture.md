---
title: Basic Computer System Architecture
description: Von Neumann vs. Harvard architecture comparison, the system bus (data, address, control), and bus arbitration methods
type: docs
weight: 1
---

## 1. Realizing General-Purpose Computing Through the Stored-Program Concept — Overview of Basic Computer System Architecture

```mermaid
%%{init: { 'theme': 'base', 'themeVariables': { 'edgeLabelBackground': '#fff' }}}%%
flowchart LR
    A["Dedicated hardwired structure<br/>circuit redesign needed to change instructions"] --"Stored program<br/>memory-based instruction processing"--> B["Von Neumann, Harvard<br/>architectures adopted"] --"Generality, scalability<br/>bus-based connections"--> C["Modern computers realized<br/>PCs, servers, embedded systems"]
    style A fill:#FFEBEE,stroke:#D32F2F,color:#000
    style B fill:#E3F2FD,stroke:#1976D2,color:#000
    style C fill:#E8F5E9,stroke:#388E3C,color:#000
```

**Definition**: A hardware configuration for a digital computer that connects the CPU, memory, and I/O devices via a system bus and processes instructions using the stored-program concept.
- The Von Neumann architecture is a simple, general-purpose model that processes instructions and data through the same memory and bus.
- The Harvard architecture separates instruction memory from data memory to maximize parallel-access performance.
- The system bus (data, address, control) is the communication path for every component, and the bus arbitration method determines the bottleneck.

**Characteristics**:
- **Stored Program**: Stores instructions in memory, allowing the computer's function to change simply by swapping software.
- **Bus-Centered Connectivity**: A standardized system bus structure unifies data exchange among the CPU, memory, and I/O devices.
- **Von Neumann Bottleneck**: Instructions and data share the same bus, so memory bandwidth sets the performance limit.

---

## 2. Core Structure of Basic Computer System Architecture

### A. Von Neumann vs. Harvard Architecture Comparison

```mermaid
%%{init: { 'theme': 'base', 'themeVariables': { 'edgeLabelBackground': '#fff' }}}%%
flowchart LR
    CPU1["CPU<br/>ALU + control unit"] --"Single bus<br/>instructions + data shared"--> MEM1["Unified memory<br/>instructions + data mixed"]
    MEM1 --"Sequential access<br/>bottleneck occurs"--> IO1["I/O device<br/>input/output processing"]
    style CPU1 fill:#E3F2FD,stroke:#1976D2,color:#000
    style MEM1 fill:#F3E5F5,stroke:#7B1FA2,color:#000
    style IO1 fill:#FFF3E0,stroke:#F57C00,color:#000
```

```mermaid
%%{init: { 'theme': 'base', 'themeVariables': { 'edgeLabelBackground': '#fff' }}}%%
flowchart LR
    CPU2["CPU<br/>ALU + control unit"] --"Instruction bus<br/>parallel access"--> IMEM["Instruction memory<br/>program code"]
    CPU2 --"Data bus<br/>parallel access"--> DMEM["Data memory<br/>variables, stack"]
    style CPU2 fill:#E3F2FD,stroke:#1976D2,color:#000
    style IMEM fill:#E8F5E9,stroke:#388E3C,color:#000
    style DMEM fill:#E0F2F1,stroke:#00796B,color:#000
```

| Comparison | Von Neumann Architecture | Harvard Architecture |
|---|---|---|
| **Memory Structure** | Unified instruction and data memory | Separate instruction and data memory |
| **Bus Structure** | Single bus (instructions + data shared) | Dual bus (instructions/data independent) |
| **Processing Method** | Cannot access data while fetching an instruction | Can fetch an instruction and access data simultaneously |
| **Performance** | Bottleneck occurs, simple design | Bottleneck removed, higher hardware complexity |
| **Self-Modifying Code** | Possible (instructions can be treated as data) | Not possible (instructions and data are separate) |
| **Primary Use** | x86/ARM general-purpose CPUs, PCs, servers | AVR/PIC microcontrollers, DSPs, inside cache |

---

### B. System Bus Structure and Bus Arbitration Methods

```mermaid
%%{init: { 'theme': 'base', 'themeVariables': { 'edgeLabelBackground': '#fff' }}}%%
flowchart TD
    SYS["System Bus"]
    SYS --> DB["Data bus<br/>carries actual data<br/>width: 8/16/32/64-bit"]
    SYS --> AB["Address bus<br/>specifies memory address<br/>unidirectional, width sets address space"]
    SYS --> CB["Control bus<br/>Read/Write, IRQ, clock<br/>timing and status signals"]
    DB --> MASTER["Bus master<br/>CPU, DMA, I/O controller"]
    AB --> MASTER
    CB --> ARB["Bus arbiter<br/>Arbiter"]
    MASTER --"Bus request<br/>BR signal"--> ARB
    ARB --"Bus grant<br/>BG signal"--> MASTER
    style SYS fill:#1E3A5F,stroke:#1E3A5F,color:#fff
    style DB fill:#E3F2FD,stroke:#1976D2,color:#000
    style AB fill:#F3E5F5,stroke:#7B1FA2,color:#000
    style CB fill:#FFF3E0,stroke:#F57C00,color:#000
    style MASTER fill:#E0F2F1,stroke:#00796B,color:#000
    style ARB fill:#E8F5E9,stroke:#388E3C,color:#000
```

| Bus Arbitration Method | Operating Principle | Advantages | Disadvantages | Application Example |
|---|---|---|---|---|
| **Daisy Chain** | Propagates the BG signal serially; the device that receives it first claims the bus | Simple to implement, low hardware cost | Fixed priority, starvation for lower-priority devices | ISA bus, early I/O |
| **Centralized** | An arbiter collects requests, then decides priority and grants access | Flexible priority policy, can guarantee fairness | Arbiter bottleneck, single point of failure | PCI bus, memory controller |
| **Distributed** | Every device monitors bus state and decides autonomously | No arbiter needed, high reliability | Complex protocol, must resolve simultaneous request collisions | IEEE 1394, CAN bus |
| **Polling** | The CPU periodically checks device request status in sequence | Priority can be changed dynamically with ease | CPU overhead, response delay | Embedded systems, legacy I/O |

---

## 3. Expected Benefits and Practical Applications of Basic Computer System Architecture

| Category | Key Benefit | Practical Application |
|---|---|---|
| **Design Optimization** | Choosing an architecture (Von Neumann/Harvard) achieves the optimal balance of performance, cost, and power | Apply a modified Harvard architecture (separate cache) in embedded systems, keep Von Neumann for general-purpose servers |
| **Performance Improvement** | Improving bus width, clock, and arbitration method eases memory bandwidth bottlenecks | Adopt high-speed DDR5/PCIe 5.0 buses, work around the Von Neumann bottleneck with cache hierarchy design |
| **Reliability** | Choosing the right bus arbitration method prevents deadlock and starvation and guarantees real-time response | Priority-based centralized arbitration in RTOS environments, real-time vehicle control via CAN bus |
| **Scalability Management** | Standard bus protocols (PCIe, USB, I2C) make it easy to connect heterogeneous devices | PCIe Gen5-based GPU/NVMe expansion, integrate IoT sensor modules via I2C/SPI |
