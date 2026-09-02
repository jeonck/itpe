---
title: File Systems and Virtualization
description: Contiguous, linked, and indexed (Unix Inode) file allocation methods; Type 1/2 hypervisor vs. container (Docker) virtualization comparison
type: docs
weight: 2
---

## 1. Maximizing Resource Efficiency with File Allocation and Hypervisors/Containers, Overview of File Systems and Virtualization

```mermaid
%%{init: { 'theme': 'base', 'themeVariables': { 'edgeLabelBackground': '#fff' }}}%%
flowchart LR
    A["Disk fragmentation, resource waste<br/>Single-OS exclusive environment"] --"Optimizes allocation method<br/>Separates OS instances"--> B["Efficient Inode-based access<br/>Hypervisors, containers"] --"Fast deployment, portability<br/>Resource sharing, isolation"--> C["Improved storage efficiency<br/>Maximized infrastructure density"]
    style A fill:#FFEBEE,stroke:#D32F2F,color:#000
    style B fill:#E3F2FD,stroke:#1976D2,color:#000
    style C fill:#E8F5E9,stroke:#388E3C,color:#000
```

**Definition**: A system software technique that raises storage utilization and infrastructure efficiency through file allocation methods that efficiently distribute disk space among files, and virtualization technology that provides multiple independent execution environments on a single physical server.
- File allocation methods fall into three types — contiguous, linked, and indexed — chosen based on access pattern and fragmentation tolerance
- A hypervisor operates by providing hardware resources to virtual machines either directly or through a host OS
- Containers share the OS kernel while isolating with namespaces and cgroups, minimizing overhead compared to a hypervisor

**Characteristics**:
- **Allocation flexibility**: Choose contiguous allocation for fast access, linked allocation to avoid fragmentation, or Inode-based indexed allocation for efficient random access, depending on purpose
- **Balance of isolation and sharing**: A hypervisor achieves strong hardware-level isolation, while a container achieves lightweight process-level isolation
- **Portability**: Container images package environment dependencies, guaranteeing a consistent execution environment across dev, test, and production

---

## 2. Core Structure of File Systems and Virtualization

### A. Comparing Three File Allocation Methods

```mermaid
%%{init: { 'theme': 'base', 'themeVariables': { 'edgeLabelBackground': '#fff' }}}%%
flowchart LR
    subgraph CON["Contiguous allocation"]
        direction LR
        B0["Block 0"] --> B1["Block 1"] --> B2["Block 2"] --> B3["Block 3"]
    end
    subgraph LINK["Linked allocation"]
        direction LR
        L0["Block 0<br/>Next: L2"] --> L2["Block 2<br/>Next: L5"] --> L5["Block 5<br/>Next: NULL"]
    end
    subgraph IDX["Indexed allocation (Inode)"]
        direction LR
        IN["Inode<br/>12 direct pointers<br/>3 indirect pointers"] --> D0["Data block 0"]
        IN --> D1["Data block 1"]
        IN --> IP["Indirect block"]
        IP --> D2["Data block N"]
    end
    style B0 fill:#E3F2FD,stroke:#1976D2,color:#000
    style B1 fill:#E3F2FD,stroke:#1976D2,color:#000
    style B2 fill:#E3F2FD,stroke:#1976D2,color:#000
    style B3 fill:#E3F2FD,stroke:#1976D2,color:#000
    style L0 fill:#FFF3E0,stroke:#F57C00,color:#000
    style L2 fill:#FFF3E0,stroke:#F57C00,color:#000
    style L5 fill:#FFF3E0,stroke:#F57C00,color:#000
    style IN fill:#1E3A5F,stroke:#1E3A5F,color:#fff
    style D0 fill:#E8F5E9,stroke:#388E3C,color:#000
    style D1 fill:#E8F5E9,stroke:#388E3C,color:#000
    style IP fill:#F3E5F5,stroke:#7B1FA2,color:#000
    style D2 fill:#E8F5E9,stroke:#388E3C,color:#000
```

| Allocation Method | Principle | Sequential Access | Random Access | External Fragmentation | Internal Fragmentation | Typical Use |
|---|---|---|---|---|---|---|
| **Contiguous allocation** | Stores a file in contiguous blocks, location expressed as start block + length | Very fast | Fast | Occurs | None | CD-ROM, early file systems |
| **Linked allocation** | Each block holds a pointer to the next block; evolved into FAT | Fast | Slow | None | Wastes space on pointers | FAT16, FAT32 |
| **Indexed allocation** | Pointers centralized in an Inode, with direct, single, double, and triple indirect pointers | Fast | Fast | None | Small amount of waste | ext2/ext4, NTFS, HFS+ |

---

### B. Comparing Virtualization Types: Hypervisor vs. Container

```mermaid
%%{init: { 'theme': 'base', 'themeVariables': { 'edgeLabelBackground': '#fff' }}}%%
flowchart TD
    HW["Physical hardware<br/>CPU, memory, storage"]
    HW --> T1["Type 1 hypervisor<br/>Bare-Metal<br/>VMware ESXi, Hyper-V, KVM"]
    HW --> HOST["Host OS<br/>Windows, Linux, macOS"]
    HOST --> T2["Type 2 hypervisor<br/>Hosted<br/>VirtualBox, VMware Workstation"]
    HOST --> CR["Container runtime<br/>Docker, containerd"]
    T1 --> VM1["Guest OS + app<br/>Virtual machine 1"]
    T1 --> VM2["Guest OS + app<br/>Virtual machine 2"]
    T2 --> VM3["Guest OS + app<br/>Virtual machine 3"]
    CR --> C1["App + libraries<br/>Container 1"]
    CR --> C2["App + libraries<br/>Container 2"]
    style HW fill:#1E3A5F,stroke:#1E3A5F,color:#fff
    style T1 fill:#E3F2FD,stroke:#1976D2,color:#000
    style HOST fill:#E0F2F1,stroke:#00796B,color:#000
    style T2 fill:#F3E5F5,stroke:#7B1FA2,color:#000
    style CR fill:#FFF3E0,stroke:#F57C00,color:#000
    style VM1 fill:#E8F5E9,stroke:#388E3C,color:#000
    style VM2 fill:#E8F5E9,stroke:#388E3C,color:#000
    style VM3 fill:#E8F5E9,stroke:#388E3C,color:#000
    style C1 fill:#FFEBEE,stroke:#D32F2F,color:#000
    style C2 fill:#FFEBEE,stroke:#D32F2F,color:#000
```

| Category | Type 1 Hypervisor | Type 2 Hypervisor | Container (Docker) |
|---|---|---|---|
| **Operating method** | Controls hardware directly, runs without an OS | Runs on top of the host OS | Shares the host OS kernel, isolated via namespaces/cgroups |
| **Isolation level** | Strong hardware-level isolation | OS-level isolation | Lightweight process-level isolation |
| **Overhead** | Low (under 5%) | High (10-20%) | Very low (1-2%) |
| **Boot time** | Tens of seconds | Several minutes | A few seconds |
| **Portability** | VM image unit (several GB) | VM image unit (several GB) | Container image (tens to hundreds of MB) |
| **Representative products** | VMware ESXi, KVM, Hyper-V | VirtualBox, VMware Workstation | Docker, Podman, containerd |
| **Primary use** | Data center server virtualization | Dev/test environments | Microservices, CI/CD pipelines |

---

## 3. Expected Benefits and Practical Applications of File Systems and Virtualization

| Category | Key Benefits | Practical Applications |
|---|---|---|
| **Storage efficiency** | Inode-based indexed allocation minimizes fragmentation, improves random-access speed for large files | Adopt the ext4/XFS file system, enable journaling to guarantee data consistency after an abnormal shutdown |
| **Infrastructure density** | Type 1 hypervisor runs dozens of VMs on a single physical server, achieving over 70% server utilization | Build a private cloud on VMware vSphere/KVM, use vMotion/Live Migration for zero-downtime VM relocation |
| **Deployment agility** | Reusing container images shortens deployment time and eliminates environment mismatch problems | Set up a CI/CD pipeline on Docker + Kubernetes, standardize application deployment with Helm Charts |
| **Security/isolation** | VMs strengthen multi-tenant security with strong isolation, containers prevent conflicts between services via namespaces | Isolate sensitive workloads in Type 1 hypervisor VMs, deploy general microservices lightweight via containers |
