---
title: Software Crisis
description: A technical reference covering the triple-failure causes of delivery delays, cost overruns, and quality decline, and the software engineering strategies that address them.
type: docs
weight: 2
---

## I. Overview of the Software Crisis, the Limits of SW Development Capability Exposed by Triple Failure in Delivery, Cost, and Quality

```mermaid
%%{init: { 'theme': 'base', 'themeVariables': { 'edgeLabelBackground': '#fff' }}}%%
flowchart LR
    A["Rapid hardware growth<br/>SW complexity explosion"] --"Insufficient development capability,<br/>immature management methodology"--> B["Software crisis<br/>Simultaneous failure of cost, delivery, quality"] --"SW engineering principles,<br/>systematic methodology adoption"--> C["Secured reliability, productivity<br/>Improved quality competitiveness"]
    style A fill:#FFEBEE,stroke:#D32F2F,color:#000
    style B fill:#E3F2FD,stroke:#1976D2,color:#000
    style C fill:#E8F5E9,stroke:#388E3C,color:#000
```

**Definition**:  
A structural problem phenomenon of **cost overruns, delivery delays, and quality decline** that arose in the 1960s as software development capability fell behind the pace of hardware advancement  
- A concept formally raised at the 1968 NATO Conference on Software Engineering, the direct trigger for the birth of software engineering  
- Its core cause is the **complexity barrier**, where complexity grows exponentially as development scale increases  
- The historical phenomenon that gave rise to Brooks's Law ("adding manpower to a late software project makes it later")  

**Characteristics**:  
( **Lack of visibility** ) Software has no physical form, making it hard to measure progress and quality or to catch problems early  
( **Complexity explosion** ) Code complexity grows non-linearly as feature requirements increase, creating situations that are unpredictable and uncontrollable  
( **Recurring pattern** ) A structural, chronic phenomenon in which the same failure pattern repeats regardless of scale or domain  

## II. Causal Structure of the Software Crisis and the Engineering Response System

### A. Classification of Software Crisis Causes and Key Symptoms

```mermaid
%%{init: { 'theme': 'base', 'themeVariables': { 'edgeLabelBackground': '#fff' }}}%%
flowchart TD
    ROOT["Software crisis<br/>causal structure"] --> A["Technical causes"]
    ROOT --> B["Management causes"]
    ROOT --> C["Environmental/human causes"]
    A --> A1["Complexity explosion<br/>Absence of design methodology"]
    A --> A2["Immature test/<br/>verification techniques"]
    B --> B1["Inaccurate schedule<br/>and cost estimation"]
    B --> B2["Poor control of<br/>requirement changes"]
    C --> C1["HW advancement gap<br/>Surging expectations"]
    C --> C2["Uneven developer skill,<br/>broken communication"]
    style ROOT fill:#1E3A5F,stroke:#1E3A5F,color:#fff
    style A fill:#E3F2FD,stroke:#1976D2,color:#000
    style B fill:#F3E5F5,stroke:#7B1FA2,color:#000
    style C fill:#FFF3E0,stroke:#F57C00,color:#000
    style A1 fill:#E3F2FD,stroke:#1976D2,color:#000
    style A2 fill:#E3F2FD,stroke:#1976D2,color:#000
    style B1 fill:#F3E5F5,stroke:#7B1FA2,color:#000
    style B2 fill:#F3E5F5,stroke:#7B1FA2,color:#000
    style C1 fill:#FFF3E0,stroke:#F57C00,color:#000
    style C2 fill:#FFF3E0,stroke:#F57C00,color:#000
```

| Cause Category | Core Cause | Key Symptom |
|:---:|:---|:---|
| **Technical** | Absence of design methodology, failed complexity management | Spaghetti code, unmaintainable state |
| **Management** | Unrealistic schedule/budget, uncontrolled requirements | Delivery delays, project cancellation/failure |
| **Environmental** | HW advancement gap, surging user expectations | Rapid SW scale growth, performance dissatisfaction |
| **Human** | Uneven developer skill, broken cross-team communication | Rising defect density, collaboration conflicts |

### B. Software Engineering Strategies and the Evolution of Methodology

```mermaid
%%{init: { 'theme': 'base', 'themeVariables': { 'edgeLabelBackground': '#fff' }}}%%
flowchart LR
    S1["1st generation<br/>Coding-centered<br/>1960s"] --> S2["2nd generation<br/>Structured methodology<br/>1970s"] --> S3["3rd generation<br/>Object-oriented CASE<br/>1980s-90s"] --> S4["4th generation<br/>Agile, DevOps<br/>2000s-"]
    style S1 fill:#FFEBEE,stroke:#D32F2F,color:#000
    style S2 fill:#FFF3E0,stroke:#F57C00,color:#000
    style S3 fill:#E3F2FD,stroke:#1976D2,color:#000
    style S4 fill:#E8F5E9,stroke:#388E3C,color:#000
```

| Response Strategy | Key Methodology and Standard | Expected Benefit |
|:---:|:---|:---|
| **Process standardization** | SDLC, CMMI, ISO/IEC 12207 | Better development predictability, unified quality criteria |
| **Adopting a design methodology** | Structured, object-oriented, component-based design | Complexity decomposition, better module reusability |
| **Iterative, incremental development** | Scrum, Kanban, XP, Lean development | Secures the ability to respond to requirement changes |
| **Automation, DevOps** | CI/CD, automated testing, code review | Early defect detection, shorter deployment cycles |

## III. Expected Benefits and Practical Applications of Addressing the Software Crisis

| Category | Key Benefits | Practical Applications |
|:---:|:---|:---|
| **Quality management** | Applying systematic methodology lowers defect density and secures reliability | Diagnose the CMMI level, then build a phased process improvement roadmap |
| **Project management** | WBS/EVM-based estimation improves schedule and cost accuracy | Estimate scale with Function Point and build a risk response plan |
| **Technical capability** | Accumulates reusable component and architecture assets | Standardize internal frameworks and build a design pattern library |
| **Organizational culture** | Establishing a learning organizational culture prevents repeated failure | Institutionalize periodic Retrospectives and adopt a knowledge management system |
