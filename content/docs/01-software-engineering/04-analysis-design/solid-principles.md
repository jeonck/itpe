---
title: SOLID Object-Oriented Design Principles
description: Definitions, violation examples, and application methods for the 5 principles of maintainable object-oriented system design
type: docs
weight: 33
---

## I. Overview of SOLID, the 5 Principles for Object-Oriented Design That Withstands Change

```mermaid
%%{init: { 'theme': 'base', 'themeVariables': { 'edgeLabelBackground': '#fff' }}}%%
flowchart LR
    A["Change-fragile design<br/>Tight coupling, low cohesion<br/>Cascading errors on modification"] --"SOLID 5 principles<br/>applied systematically"--> B["Flexible object-oriented<br/>design structure<br/>Abstraction, role separation"] --"Design quality<br/>improved"--> C["Minimized change cost<br/>Easy to extend<br/>Testable code"]

    style A fill:#FFEBEE,stroke:#D32F2F,color:#000
    style B fill:#E3F2FD,stroke:#1976D2,color:#000
    style C fill:#E8F5E9,stroke:#388E3C,color:#000
```

**Definition**:  
Five core object-oriented design principles defined by Robert C. Martin as design guidance for achieving maintainability, extensibility, and testability  
- A design standard named from the first letters of SRP, OCP, LSP, ISP, and DIP  
- Applied to design decisions at the class, module, and component level; the theoretical foundation for applying GoF patterns  
- Compliance is measured with code review and static analysis tools, and used to steer refactoring direction  

**Characteristics**:  
( **Minimizes change** ) Each principle narrows the blast radius of change, cutting modification cost and regression defects  
( **Abstraction-based** ) Interface- and abstract-class-centered design lets implementations be swapped and extended freely  
( **Mutual reinforcement** ) The 5 principles are not independent — the other principles work together to realize OCP  

---

## II. Core Structure of the SOLID Principles

### A. Purpose of SOLID and S, O, L in Detail (SRP, OCP, LSP)

```mermaid
%%{init: { 'theme': 'base', 'themeVariables': { 'edgeLabelBackground': '#fff' }}}%%
flowchart TD
    ROOT["SOLID 5 Principles<br/>Object-oriented design criteria"]

    ROOT --> SRP["SRP<br/>Single Responsibility<br/>Principle"]
    ROOT --> OCP["OCP<br/>Open-Closed<br/>Principle"]
    ROOT --> LSP["LSP<br/>Liskov Substitution<br/>Principle"]
    ROOT --> ISP["ISP<br/>Interface Segregation<br/>Principle"]
    ROOT --> DIP["DIP<br/>Dependency Inversion<br/>Principle"]

    style ROOT fill:#1E3A5F,stroke:#1E3A5F,color:#fff
    style SRP fill:#E3F2FD,stroke:#1976D2,color:#000
    style OCP fill:#F3E5F5,stroke:#7B1FA2,color:#000
    style LSP fill:#FFF3E0,stroke:#F57C00,color:#000
    style ISP fill:#E8F5E9,stroke:#388E3C,color:#000
    style DIP fill:#FFEBEE,stroke:#D32F2F,color:#000
```

| Principle | Core definition | Violation example | How to apply |
|---|---|---|---|
| **SRP** | A class should have only one reason to change | A `User` class handles authentication, storage, and email sending all at once | Split by role: `UserAuth` / `UserRepository` / `EmailService` |
| **OCP** | New behavior should be addable without modifying existing code | Adding a shape type forces an if-else branch edit in `AreaCalculator` | A `Shape` interface plus polymorphism: new shapes leave existing code untouched |
| **LSP** | A subtype must be fully substitutable for its supertype | A `Square` that extends `Rectangle` also changes height on `setWidth`, breaking the contract | Prefer interface segregation and composition over inheritance; guarantee the supertype's contract (pre-/post-conditions) |

---

### B. I, D Principles in Detail and SOLID Applied Together (ISP, DIP)

```mermaid
%%{init: { 'theme': 'base', 'themeVariables': { 'edgeLabelBackground': '#fff' }}}%%
flowchart TD
    subgraph BEFORE["Before DIP: direct dependency"]
        HL1["High-level module<br/>OrderService"]
        LL1["Low-level module<br/>MySQLRepository"]
        HL1 --"Direct dependency<br/>coupled to implementation"--> LL1
    end

    subgraph AFTER["After DIP: through abstraction"]
        HL2["High-level module<br/>OrderService"]
        AB["Abstraction<br/>OrderRepository interface"]
        LL2A["Low-level module<br/>MySQLRepository"]
        LL2B["Low-level module<br/>MongoRepository"]
        HL2 --"Depends only<br/>on the interface"--> AB
        AB --"implements"--> LL2A
        AB --"implements"--> LL2B
    end

    style HL1 fill:#FFEBEE,stroke:#D32F2F,color:#000
    style LL1 fill:#FFEBEE,stroke:#D32F2F,color:#000
    style HL2 fill:#E8F5E9,stroke:#388E3C,color:#000
    style AB fill:#1E3A5F,stroke:#1E3A5F,color:#fff
    style LL2A fill:#E3F2FD,stroke:#1976D2,color:#000
    style LL2B fill:#E3F2FD,stroke:#1976D2,color:#000
```

| Principle | Core definition | Violation example | How to apply |
|---|---|---|---|
| **ISP** | Don't force clients to depend on interface methods they don't use | A `Printer` interface declares print/fax/scan together → a `SimplePrinter` that doesn't need fax is forced to implement fax anyway | Split into role interfaces: `Printable` / `Faxable` / `Scanable` |
| **DIP** | Both high-level and low-level modules should depend on abstractions, never directly on implementations | A `Service` class creates and references `new MySQLRepository()` directly | Inject dependencies via a DI container (Spring IoC), reference by interface |

**SOLID 5 principles, side by side**

| Principle | Core keyword | Violation symptom | Resolution pattern |
|---|---|---|---|
| **SRP** | Single reason to change | God Class, thousands of lines in one class | Role separation, Facade pattern |
| **OCP** | Open for extension, closed for modification | Every new feature edits an existing if-else | Strategy / Template Method pattern, polymorphism |
| **LSP** | Subtype substitutability | Supertype guarantees break when a subclass is used | Composition over inheritance, explicit interface contracts |
| **ISP** | Depend only on the interfaces you need | Empty method implementations, `UnsupportedOperationException` | Interface segregation, role interface separation |
| **DIP** | Depend on abstractions | Direct `new Implementation()` creation, hard to test | DI (dependency injection), IoC container, Factory pattern |

---

## III. Expected Benefits and Practical Applications of Adopting SOLID

| Category | Key benefits | Use and practical application |
|---|---|---|
| **Design flexibility** | Minimizes edits to existing code when accommodating change requests; adds new features purely by extension | Design to OCP, then implement new features only by adding new classes, reducing the regression-test burden on existing code |
| **Testability** | DIP enables mock injection, achieving unit-test isolation | Mock low-level modules with Spring `@MockBean`/Mockito; SRP compliance clarifies what each test targets |
| **Collaboration efficiency** | SRP and ISP compliance keep class responsibilities clear, improving teammates' comprehension and review speed | Include SOLID-violation items in the code-review checklist; auto-detect with static analysis tools (Checkstyle, PMD) |
| **Exam prep** | Definitions, violation examples, and resolutions for the 5 principles are a core topic in ITPE Sessions 1 and 2 | Memorize violation-code-to-fixed-code conversion examples for each principle; map the connections to GoF patterns |
