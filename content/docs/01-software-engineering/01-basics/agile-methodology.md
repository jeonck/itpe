---
title: Agile Methodology
description: Core summary of Agile Methodology, an iterative, collaboration-centered software development methodology that adapts flexibly to change
type: docs
weight: 5
---

## I. Overview of Agile Methodology, Iterative and Collaborative Development That Adapts to Change

```mermaid
%%{init: { 'theme': 'base', 'themeVariables': { 'edgeLabelBackground': '#fff' }}}%%
flowchart LR
    A["Plan-driven limits<br/>Cannot handle requirement changes<br/>Long release cycles"] --"Iterative sprints,<br/>customer collaboration"--> B["Agile adoption<br/>Short iterative development<br/>Continuous feedback"] --"Fast value delivery,<br/>early risk reduction"--> C["Business agility<br/>Customer satisfaction<br/>Continuous improvement"]
    style A fill:#FFEBEE,stroke:#D32F2F,color:#000
    style B fill:#E3F2FD,stroke:#1976D2,color:#000
    style C fill:#E8F5E9,stroke:#388E3C,color:#000
```

**Definition**:  
A development methodology that uses iterative development cycles and customer collaboration as its core mechanisms to adapt flexibly to change and deliver software value continuously  
- Based on the 4 values and 12 principles that 17 software professionals declared in the 2001 Agile Manifesto  
- Implemented through frameworks such as Scrum, XP, Kanban, and SAFe, applied at scales from a single team to an entire enterprise  
- Iteratively releases working software in Sprint (Iteration) units of 1 to 4 weeks, surfacing risk early  

**Characteristics**:  
( **Adaptive planning** ) A flexible planning structure that welcomes change instead of fixed requirements and re-prioritizes each Sprint  
( **Continuous feedback** ) Regular events such as Sprint Review and Daily Stand-up let the customer and team exchange feedback immediately  
( **Working software first** ) Delivers a working Increment periodically over comprehensive documentation, verifying value directly  

---

## II. Core Structure of Agile Methodology

### A. Agile Core Values and the Scrum Framework Structure

```mermaid
%%{init: { 'theme': 'base', 'themeVariables': { 'edgeLabelBackground': '#fff' }}}%%
flowchart LR
    PB["Product<br/>Backlog"] --> SP["Sprint<br/>Planning"]
    SP --> SB["Sprint<br/>Backlog"]
    SB --> SG["Sprint<br/>1-4 weeks"]
    SG --> DS["Daily<br/>Scrum"]
    DS --> SG
    SG --> SR["Sprint<br/>Review"]
    SR --> RT["Retrospective"]
    RT --> PB

    style PB fill:#1E3A5F,stroke:#1E3A5F,color:#fff
    style SP fill:#E3F2FD,stroke:#1976D2,color:#000
    style SB fill:#E3F2FD,stroke:#1976D2,color:#000
    style SG fill:#F3E5F5,stroke:#7B1FA2,color:#000
    style DS fill:#FFF3E0,stroke:#F57C00,color:#000
    style SR fill:#E8F5E9,stroke:#388E3C,color:#000
    style RT fill:#E8F5E9,stroke:#388E3C,color:#000
```

| Category | Item | Description |
|---|---|---|
| **Role** | Product Owner (PO) | Defines product vision, sets Product Backlog priority, owns maximizing business value |
| **Role** | Scrum Master (SM) | Upholds Agile principles, removes impediments, coaches the team toward self-organization |
| **Role** | Development Team | A self-organizing team of 3-9, executes the Sprint Backlog, owns completing the Increment |
| **Event** | Sprint Planning | Sets the Sprint goal and scope, selects Sprint Backlog items from the Product Backlog |
| **Event** | Daily Stand-up | A 15-minute daily sync, shares progress through three questions: yesterday, today, and blockers |
| **Event** | Sprint Review | Demonstrates the Increment at Sprint end, gathers stakeholder feedback |
| **Event** | Retrospective | Identifies team process improvements, finalizes Action Items for the next Sprint |
| **Artifact** | Product Backlog | The full list of requirements, in User Story form, prioritized by the PO |
| **Artifact** | Sprint Backlog | The list of tasks to complete in the current Sprint, managed autonomously by the team |
| **Artifact** | Increment | Completed working software at the end of each Sprint, must meet the DoD |
| **Artifact** | Burndown Chart | Visualizes remaining work over time, tracks Sprint progress |

---

### B. XP Practices and a Comparison of Large-Scale Agile Frameworks

```mermaid
%%{init: { 'theme': 'base', 'themeVariables': { 'edgeLabelBackground': '#fff' }}}%%
flowchart TD
    PF["Portfolio Layer<br/>Strategy, investment, Epic management"] --> AR["Program Layer / ART<br/>PI Planning, Feature coordination"]
    AR --> T1["Team 1<br/>Scrum/Kanban"]
    AR --> T2["Team 2<br/>Scrum/Kanban"]
    AR --> T3["Team N<br/>Scrum/Kanban"]

    style PF fill:#1E3A5F,stroke:#1E3A5F,color:#fff
    style AR fill:#E3F2FD,stroke:#1976D2,color:#000
    style T1 fill:#E8F5E9,stroke:#388E3C,color:#000
    style T2 fill:#E8F5E9,stroke:#388E3C,color:#000
    style T3 fill:#E8F5E9,stroke:#388E3C,color:#000
```

| Category | Scrum | XP | Kanban | SAFe / LeSS |
|---|---|---|---|---|
| **Scale of use** | Small to mid-size single team | Small development team | Team to service level | Mid-to-large organization, enterprise |
| **Core mechanism** | Sprint iteration, separated roles | TDD, pair programming, CI | WIP limits, pull system | PI Planning, ART, portfolio layer |
| **Key artifacts** | Product Backlog, Increment, Burndown | Test code, integrated build, refactoring results | Kanban Board, cumulative flow diagram | PI Roadmap, Feature, Program Increment |
| **Characteristics** | Roles, events, and artifacts are clearly defined; low learning curve | Emphasizes technical practices; code quality, TDD, pair programming | Flexible flow management, responds to change immediately, visualizes bottlenecks | Provides large-scale alignment and governance; LeSS simplifies to a single Backlog |
| **XP's 5 values** | — | Communication, simplicity, feedback, courage, respect | — | — |
| **Scaling approach** | No structure for coordinating multiple teams | — | — | SAFe: 3 layers / LeSS: single PO, multiple teams |

---

## III. Expected Benefits and Practical Applications of Adopting Agile Methodology

| Category | Key Benefits | Practical Applications |
|---|---|---|
| **Process** | Sprint-based iteration accepts requirement changes early and steadily lowers delivery risk | Reprioritize the Product Backlog every Sprint and codify Definition of Done criteria to secure quality standards |
| **Technology** | Applying XP practices such as TDD, CI, and refactoring improves code quality and technical debt management | Embed a Jenkins/GitHub Actions-based CI/CD pipeline and SonarQube static analysis into the Sprint cycle |
| **Organization/Culture** | Self-organizing teams improve member autonomy, accountability, and psychological safety, and activate knowledge sharing | Track Retrospective outcomes as Action Items and realize collective code ownership through pair and mob programming |
| **Strategy/Scale** | Adopting SAFe/LeSS keeps strategic goals and team execution aligned even at scales of dozens to hundreds of people | Make the full ART roadmap visible through quarterly PI Planning and manage Epic flow at the strategic level with a Portfolio Kanban |
