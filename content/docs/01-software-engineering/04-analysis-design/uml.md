---
title: UML
description: OMG's standard visual modeling language for object-oriented analysis and design
type: docs
weight: 30
---

## I. Overview of UML, Standardizing Object-Oriented Design Visually

```mermaid
%%{init: { 'theme': 'base', 'themeVariables': { 'edgeLabelBackground': '#fff' }}}%%
flowchart LR
    A["Complex systems<br/>Lack of design communication"] --"Standard notation<br/>Visual modeling"--> B["Structural, behavioral diagrams<br/>14 UML types"] --"Common language<br/>Clear design"--> C["Quality improved<br/>Maintainability secured"]

    style A fill:#FFEBEE,stroke:#D32F2F,color:#000
    style B fill:#E3F2FD,stroke:#1976D2,color:#000
    style C fill:#E8F5E9,stroke:#388E3C,color:#000
```

**Definition**:  
A visual modeling language for object-oriented analysis and design, standardized by the OMG (Object Management Group)  
- Represents the entire software system through 6 structural diagram types and 7 behavioral diagram types  
- Used as a deliverable across every SDLC phase, from requirements analysis to deployment configuration  
- Gives developers, designers, and customers a common notation, minimizing communication errors  

**Characteristics**:  
( **Standardization** ) An official OMG standard, providing tool- and language-independent general-purpose modeling notation  
( **Comprehensiveness** ) Covers static structure and dynamic behavior across 14 diagram types  
( **Traceability** ) Design can be traced through the chain from use case → class → sequence → deployment diagram  

---

## II. Core Structure of UML

### A. UML Diagram Classification (Structural vs. Behavioral)

```mermaid
%%{init: { 'theme': 'base', 'themeVariables': { 'edgeLabelBackground': '#fff' }}}%%
flowchart TD
    ROOT["UML 2.x<br/>14 diagram types"]
    ROOT --> STR["Structural Diagrams<br/>Structural"]
    ROOT --> BEH["Behavioral Diagrams<br/>Behavioral"]

    STR --> C["Class"]
    STR --> OB["Object"]
    STR --> CP["Component"]
    STR --> DP["Deployment"]
    STR --> CS["Composite Structure<br/>Composite"]
    STR --> PK["Package"]

    BEH --> UC["Use Case"]
    BEH --> SQ["Sequence"]
    BEH --> ST["State Machine"]
    BEH --> AC["Activity"]
    BEH --> CM["Communication"]

    style ROOT fill:#1E3A5F,stroke:#1E3A5F,color:#fff
    style STR fill:#E3F2FD,stroke:#1976D2,color:#000
    style BEH fill:#F3E5F5,stroke:#7B1FA2,color:#000
    style C fill:#E3F2FD,stroke:#1976D2,color:#000
    style OB fill:#E3F2FD,stroke:#1976D2,color:#000
    style CP fill:#E3F2FD,stroke:#1976D2,color:#000
    style DP fill:#E3F2FD,stroke:#1976D2,color:#000
    style CS fill:#E3F2FD,stroke:#1976D2,color:#000
    style PK fill:#E3F2FD,stroke:#1976D2,color:#000
    style UC fill:#F3E5F5,stroke:#7B1FA2,color:#000
    style SQ fill:#F3E5F5,stroke:#7B1FA2,color:#000
    style ST fill:#F3E5F5,stroke:#7B1FA2,color:#000
    style AC fill:#F3E5F5,stroke:#7B1FA2,color:#000
    style CM fill:#F3E5F5,stroke:#7B1FA2,color:#000
```

| Diagram | Represents | Key elements | When to use |
|---|---|---|---|
| **Class** | Class attributes, methods, relationships | Association, aggregation, composition, inheritance, dependency, realization | Core deliverable of the analysis and design phase |
| **Object** | State of class instances | `objectName:ClassName`, attribute values | Depicting system state at a specific point in time |
| **Component** | Independently deployable software units | Component, interface, port | Component-based design and architecture |
| **Deployment** | Mapping of physical hardware to software | Node, artifact, communication path | Infrastructure and deployment environment design |
| **Package** | Namespace and module grouping | Package, dependency, merge, import | Modularizing large-scale systems |

---

### B. Key Behavioral Diagrams — Sequence and Use Case

```mermaid
%%{init: { 'theme': 'base', 'themeVariables': { 'edgeLabelBackground': '#fff' }}}%%
flowchart TD
    UC_ROOT["Use Case Diagram<br/>Relationship types"]
    UC_ROOT --> INC["Include relationship<br/>include"]
    UC_ROOT --> EXT["Extend relationship<br/>extend"]
    UC_ROOT --> GEN["generalization"]

    SQ_ROOT["Sequence Diagram<br/>Components"]
    SQ_ROOT --> LL["Lifeline"]
    SQ_ROOT --> AB["Activation Bar"]
    SQ_ROOT --> MSG["Message<br/>Sync, async, return"]
    SQ_ROOT --> FR["Frame<br/>alt, loop, opt"]

    style UC_ROOT fill:#1E3A5F,stroke:#1E3A5F,color:#fff
    style SQ_ROOT fill:#1E3A5F,stroke:#1E3A5F,color:#fff
    style INC fill:#E3F2FD,stroke:#1976D2,color:#000
    style EXT fill:#E3F2FD,stroke:#1976D2,color:#000
    style GEN fill:#E3F2FD,stroke:#1976D2,color:#000
    style LL fill:#F3E5F5,stroke:#7B1FA2,color:#000
    style AB fill:#F3E5F5,stroke:#7B1FA2,color:#000
    style MSG fill:#F3E5F5,stroke:#7B1FA2,color:#000
    style FR fill:#F3E5F5,stroke:#7B1FA2,color:#000
```

| Diagram | Represents | Core elements | Exam point |
|---|---|---|---|
| **Use Case** | Relationships between actors and system functions | Actor, use case, include/extend/generalization | Difference between include and extend; system boundary |
| **Sequence** | Time-ordered messages between objects | Lifeline, activation bar, sync/async messages, frame | alt/loop/opt frames, lifeline destruction |
| **State** | An object's state-transition cycle | State, transition, event, guard, action | Entry/exit actions, composite states |
| **Activity** | Workflow and parallel processing | Start/end, fork/join, swimlane, decision | Fork/join parallelism, swimlane role separation |
| **Communication** | Collaboration and message order between objects | Object, link, numbered message | Difference from the sequence diagram |

---

## III. Expected Benefits and Practical Applications of Adopting UML

| Category | Key benefits | Use and practical application |
|---|---|---|
| **Communication** | A common language across developers, designers, and customers minimizes misunderstanding and omissions | Agree on functional scope with a use case diagram before requirements are finalized |
| **Design quality** | A class diagram visualizes relationships and dependencies, enabling coupling analysis | Review SOLID compliance against the class diagram during design review |
| **Traceability** | Chaining use case → class → sequence → deployment traces requirements to implementation | Link the RTM to UML diagrams to see change impact immediately |
| **Maintenance** | A deployment diagram documents infrastructure structure, improving operational efficiency | Analyze business-process automation using activity and state diagrams |
