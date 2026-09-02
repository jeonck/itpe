---
title: Software Maintenance
description: The 4 maintenance types under IEEE 1219, the legacy-modernization 3R strategy, and refactoring
type: docs
weight: 50
---

## I. Overview of Software Maintenance, Extending SW Lifespan Through Change Control

```mermaid
%%{init: { 'theme': 'base', 'themeVariables': { 'edgeLabelBackground': '#fff' }}}%%
flowchart LR
    A["SW defects, environment change<br/>Performance decay, legacy buildup"] --"Maintenance<br/>4 types applied"--> B["Corrective, adaptive, perfective, preventive<br/>Systematic change management"] --"Quality maintained<br/>Lifespan extended"--> C["Stable operations<br/>Business continuity secured"]

    style A fill:#FFEBEE,stroke:#D32F2F,color:#000
    style B fill:#E3F2FD,stroke:#1976D2,color:#000
    style C fill:#E8F5E9,stroke:#388E3C,color:#000
```

**Definition**:  
An engineering process that maintains SW quality and lifespan through post-delivery defect correction, environmental adaptation, functional improvement, and preventive activity  
- Classified under the IEEE 1219 standard into 4 types: corrective, adaptive, perfective, and preventive  
- The core phase accounting for 60-80% of the total SW life-cycle cost  
- Manages technical debt systematically through legacy modernization (3R) and refactoring  

**Characteristics**:  
( **Cost concentration** ) Maintenance cost exceeds development cost, with perfective maintenance making up about 50% of the total  
( **Change risk** ) Every change can introduce unforeseen defects (regression errors), requiring systematic control  
( **Quality continuity** ) Refactoring and preventive maintenance suppress SW aging and sustain quality  

---

## II. Core Structure of Software Maintenance

### A. Classifying Maintenance Types and Cost Structure

```mermaid
%%{init: { 'theme': 'base', 'themeVariables': { 'edgeLabelBackground': '#fff' }}}%%
flowchart TD
    ROOT["Software Maintenance<br/>IEEE 1219"]
    ROOT --> A["Corrective maintenance<br/>Corrective ~20%"]
    ROOT --> B["Adaptive maintenance<br/>Adaptive ~25%"]
    ROOT --> C["Perfective maintenance<br/>Perfective ~50%"]
    ROOT --> D["Preventive maintenance<br/>Preventive ~5%"]

    style ROOT fill:#1E3A5F,stroke:#1E3A5F,color:#fff
    style A fill:#FFEBEE,stroke:#D32F2F,color:#000
    style B fill:#FFF3E0,stroke:#F57C00,color:#000
    style C fill:#E3F2FD,stroke:#1976D2,color:#000
    style D fill:#E8F5E9,stroke:#388E3C,color:#000
```

| Type | Definition | Cause | Share | Example |
|---|---|---|---|---|
| **Corrective** | Fixes errors and defects found during operation | Residual bugs, design flaws | About 20% | Fixing a NullPointerException, patching a logic error |
| **Adaptive** | Modifies SW in response to environmental change | OS upgrade, regulatory change, hardware replacement | About 25% | Java version migration, reflecting personal-data-protection law updates |
| **Perfective** | Improves performance and adds new features | Growing user demand, competitive pressure | About 50% | Adding search functionality, optimizing response time |
| **Preventive** | Proactive action to prevent future defects | SW aging, accumulated technical debt | About 5% | Code refactoring, updating documentation, test automation |

---

### B. Legacy Modernization (3R) Strategy and Refactoring

```mermaid
%%{init: { 'theme': 'base', 'themeVariables': { 'edgeLabelBackground': '#fff' }}}%%
flowchart LR
    L["Legacy system<br/>Accumulated technical debt"] --> R1["Reverse Engineering<br/>Extract design from code"]
    R1 --> R2["Re-engineering<br/>Restructure, reimplement"]
    R1 --> R3["Reuse<br/>Recycle components"]
    R2 --> M["Modernized system<br/>Improved quality, maintainability"]
    R3 --> M

    style L fill:#FFEBEE,stroke:#D32F2F,color:#000
    style R1 fill:#F3E5F5,stroke:#7B1FA2,color:#000
    style R2 fill:#E3F2FD,stroke:#1976D2,color:#000
    style R3 fill:#FFF3E0,stroke:#F57C00,color:#000
    style M fill:#E8F5E9,stroke:#388E3C,color:#000
```

**The Legacy-Modernization 3R Strategy**

| Strategy | Definition | Input | Output | When to apply |
|---|---|---|---|---|
| **Reverse engineering** | Extracts design and requirements back out of existing SW | Source code, executable | Design documents, requirements specification | Analyzing undocumented legacy systems |
| **Re-engineering** | Restructures after reverse engineering to produce new SW | Existing design + reverse-engineering output | A modernized new system | When minimizing risk matters more than a full rebuild |
| **Reuse** | Carries existing components into the new system as-is | Proven modules and libraries | Reused components | When reliable existing assets are on hand |

**Key Refactoring Techniques**

| Code smell | Symptom | Refactoring technique |
|---|---|---|
| **Duplicate code** | The same logic repeated in multiple places | Extract Method, Pull Up Method |
| **Long method** | A single method handling too many roles | Extract Method, Decompose Conditional |
| **God class** | Excessive responsibility concentrated in one class | Extract Class, Extract Subclass |
| **Long parameter list** | 4 or more method parameters | Introduce Parameter Object, Preserve Whole Object |
| **Shotgun surgery** | One change ripples across multiple classes | Move Method, Move Field, Inline Class |

---

## III. Expected Benefits and Practical Applications of Adopting Software Maintenance

| Category | Key benefits | Use and practical application |
|---|---|---|
| **Quality stability** | Systematic defect correction minimizes downtime and heads off regressions | Standardize the corrective-maintenance process; build an automated regression-test pipeline |
| **Technical debt management** | Refactoring and preventive maintenance suppress code complexity and prevent SW aging | Maintain a technical-debt register; allocate refactoring time every sprint (the 20% rule) |
| **Legacy modernization** | Applying the 3R strategy protects existing assets while modernizing incrementally | Recover design documents via reverse engineering; apply re-engineering techniques during a microservices transition |
| **Cost optimization** | Concentrating investment in perfective maintenance maximizes business value and cuts unnecessary fix cost | Optimize budget allocation by maintenance type; measure maintenance effectiveness with KPIs |
