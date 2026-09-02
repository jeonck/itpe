---
title: Architectural Styles and Patterns
description: The concepts, classification, and application of architectural styles and patterns that define the structural design of a software system
type: docs
weight: 31
---

## I. Overview of Architectural Styles and Patterns, a Framework for Strategically Designing System Structure

```mermaid
%%{init: { 'theme': 'base', 'themeVariables': { 'edgeLabelBackground': '#fff' }}}%%
flowchart LR
    A["Absence of structural design<br/>Arbitrary code placement,<br/>unmaintainable"] --"Apply proven<br/>design patterns"--> B["Architectural patterns<br/>Layered, MVC, MSA"] --"Secured structural<br/>quality"--> C["Maintainability,<br/>scalability, reusability<br/>achieved"]

    style A fill:#FFEBEE,stroke:#D32F2F,color:#000
    style B fill:#E3F2FD,stroke:#1976D2,color:#000
    style C fill:#E8F5E9,stroke:#388E3C,color:#000
```

**Definition**:  
A design strategy that systematizes repeatedly proven structural design solutions to achieve software quality attributes  
- A high-level design decision that governs the placement of components, separation of responsibilities, and communication style across the whole system  
- A key deliverable that directly affects quality attributes such as maintainability, scalability, and testability  
- Chosen after requirements analysis and before detailed design, since the cost of changing it later is very high  

**Characteristics**:  
( **Separation of concerns** ) Each layer/component holds a single responsibility, localizing the impact of change  
( **Reusability** ) Applying proven patterns repeatedly reduces design time and defects  
( **Quality trade-offs** ) Every pattern carries a trade-off among performance, complexity, and development speed  

---

## II. Core Structure of Architectural Styles and Patterns

### A. Traditional Architectural Patterns (Layered, MVC, MVVM)

```mermaid
%%{init: { 'theme': 'base', 'themeVariables': { 'edgeLabelBackground': '#fff' }}}%%
flowchart TD
    V["View<br/>UI rendering, user display"]
    C["Controller<br/>Input handling, flow control"]
    M["Model<br/>Data, business logic"]

    V --"Passes user input"--> C
    C --"Requests/changes data"--> M
    M --"Notifies of state change"--> V
    C --"Selects view, directs update"--> V

    style V fill:#E8F5E9,stroke:#388E3C,color:#000
    style C fill:#E3F2FD,stroke:#1976D2,color:#000
    style M fill:#F3E5F5,stroke:#7B1FA2,color:#000
```

| Pattern | Components | Core Principle | Frameworks | Advantages/Disadvantages |
|---|---|---|---|---|
| **Layered** | Presentation / Business Logic / Data Access / DB | One-way dependency between layers, separation of concerns | Spring MVC, .NET, Django | Pro: clear role separation / Con: call overhead between layers |
| **MVC** | Model / View / Controller | Model and View are separated, the Controller mediates | Spring MVC, Rails, ASP.NET | Pro: clear roles, easy to test / Con: risk of a bloated Controller |
| **MVVM** | Model / View / ViewModel | Two-way data binding, the ViewModel manages state | React (+Redux), Vue, Angular | Pro: declarative UI, easy to test / Con: complex binding debugging |
| **Pipe-Filter** | Source / Filter / Pipe / Sink | An independent filter chain, a data transformation stream | Unix pipes, ETL, compilers | Pro: filters recombine easily / Con: shared state is hard to handle |
| **Client-Server** | Client / Server / Network | Request-response, server-centralized | Web, REST API, gRPC | Pro: easy central management / Con: server is a single point of failure |

---

### B. Core MSA Concepts and a Comparison with Monolithic Architecture

```mermaid
%%{init: { 'theme': 'base', 'themeVariables': { 'edgeLabelBackground': '#fff' }}}%%
flowchart TD
    GW["API Gateway<br/>Routing, authentication, rate limiting"]
    CB["Circuit Breaker<br/>Blocks failure propagation"]
    SAGA["Saga Pattern<br/>Coordinates distributed transactions"]
    CQRS["CQRS<br/>Separates command and query"]
    SD["Service Discovery<br/>Dynamically locates services"]

    GW --> CB
    GW --> SD
    CB --> SAGA
    SD --> SAGA
    SAGA --> CQRS

    style GW fill:#1E3A5F,stroke:#1E3A5F,color:#fff
    style CB fill:#FFEBEE,stroke:#D32F2F,color:#000
    style SAGA fill:#E3F2FD,stroke:#1976D2,color:#000
    style CQRS fill:#F3E5F5,stroke:#7B1FA2,color:#000
    style SD fill:#FFF3E0,stroke:#F57C00,color:#000
```

| Comparison Item | Monolithic | MSA |
|---|---|---|
| **Deployment unit** | The whole application deployed as one unit | Independent deployment per service |
| **Technology stack** | A single language/framework enforced | Each service can pick the best-fit technology |
| **Scalability** | Scales the whole application horizontally (inefficient) | Scales only the bottleneck service selectively |
| **Data management** | A single shared DB | An independent DB per service (eventually consistent) |
| **Fault isolation** | One bug can risk bringing the whole system down | The Circuit Breaker blocks failure propagation |
| **Suitable scenario** | Small teams, early-stage startups, simple domains | Large teams, high-availability needs, fast release cycles |

---

## III. Expected Benefits and Practical Applications of Adopting Architectural Styles and Patterns

| Category | Key Benefits | Practical Applications |
|---|---|---|
| **Maintainability** | Separating layers and components minimizes the scope of change impact and improves code readability | Write per-layer unit tests after applying the Layered pattern, detect dependency violations with SonarQube |
| **Scalability** | Adopting MSA allows selective scale-out of only the services with surging traffic | Configure per-service autoscaling with Kubernetes HPA, control traffic by introducing an API Gateway |
| **Team productivity** | Clear service boundaries give teams independent development and deployment cycles | Structure teams around domains (leveraging Conway's Law), set up per-service CI/CD pipelines |
| **Fault resilience** | The Circuit Breaker and Saga patterns block failure propagation in a distributed environment | Adopt the Resilience4j/Hystrix libraries, verify failure scenarios with Chaos Engineering |
