---
title: ITSM and ITIL v4
description: ITSM components (People, Process, Technology, Partner), the ITIL v4 SVS, the Service Value Chain (SVC), 34 management practices, SLA and SLM
type: docs
weight: 2
---

## 1. Overview of ITIL v4, the Framework That Redefines Service as Co-Created Value Rather Than a Product

```mermaid
%%{init: { 'theme': 'base', 'themeVariables': { 'edgeLabelBackground': '#fff' }}}%%
flowchart LR
    A["Technology-driven IT operations<br/>Unstable service quality,<br/>accumulating customer complaints"] --"Service Value System,<br/>SVS-based integrated management"--> B["ITIL v4 ITSM applied<br/>34 management practices"] --"Meet SLA targets,<br/>continual service improvement"--> C["Business value delivered<br/>Customer satisfaction maximized"]
    style A fill:#FFEBEE,stroke:#D32F2F,color:#000
    style B fill:#E3F2FD,stroke:#1976D2,color:#000
    style C fill:#E8F5E9,stroke:#388E3C,color:#000
```

**Definition**: A service management framework that systematically plans, designs, transitions, operates, and improves IT services to co-create business value.
- ITSM (IT Service Management) consists of four elements: People, Process, Technology, and Partner
- ITIL v4 integrates the six Service Value Chain (SVC) activities and 34 practices under the Service Value System (SVS)
- Used as an IT service certification framework aligned with the ISO/IEC 20000 international standard

**Characteristics**:
- **Value co-creation**: Adopts service-dominant logic (SDL), where the service provider and consumer create value together
- **Holistic thinking**: Manages organization, information, partners, and value streams as an integrated whole across four dimensions (4 Dimensions)
- **Flexible application**: Centers on practices rather than prescriptive procedures, so organizations can select and apply what fits their context

---

## 2. Core Structure of ITIL v4

### A. Structure of the ITIL v4 Service Value System (SVS)

```mermaid
%%{init: { 'theme': 'base', 'themeVariables': { 'edgeLabelBackground': '#fff' }}}%%
flowchart TD
    SVS["Service Value System SVS<br/>Service Value System"]
    GP["Guiding Principles<br/>7 principles"]
    GOV["Governance<br/>Direct, evaluate, monitor"]
    SVC["Service Value Chain<br/>6 activities"]
    PRAC["Practices<br/>34 management practices"]
    CI["Continual Improvement<br/>CI register operations"]
    SVS --> GP
    SVS --> GOV
    SVS --> SVC
    SVS --> PRAC
    SVS --> CI
    style SVS fill:#1E3A5F,stroke:#1E3A5F,color:#fff
    style GP fill:#E3F2FD,stroke:#1976D2,color:#000
    style GOV fill:#FFEBEE,stroke:#D32F2F,color:#000
    style SVC fill:#E8F5E9,stroke:#388E3C,color:#000
    style PRAC fill:#F3E5F5,stroke:#7B1FA2,color:#000
    style CI fill:#FFF3E0,stroke:#F57C00,color:#000
```

| SVS Component | Definition | Key Content |
|---|---|---|
| **Guiding Principles** | Universal recommendations that apply to every organizational situation | Focus on value, start where you are, progress iteratively with feedback, collaborate and promote visibility, think and work holistically, keep it simple and practical, optimize and automate |
| **Governance** | The system that evaluates, directs, and monitors the organization's direction | Establishes board and executive governance of IT services, applied in conjunction with COBIT |
| **Service Value Chain** | The operating model of six core activities that generate service value | Engage, Plan, Design & Transition, Obtain/Build, Deliver & Support, Improve |
| **Practices** | The set of organizational capabilities and resources for achieving a specific purpose | 14 general management, 17 service management, 3 technical management practices, 34 in total |
| **Continual Improvement** | Continuously improves services and practices at every level | Tracks, prioritizes, and executes improvement opportunities through the CI register |

---

### B. The Six Service Value Chain (SVC) Activities, 34 Practices, and SLA/SLM

```mermaid
%%{init: { 'theme': 'base', 'themeVariables': { 'edgeLabelBackground': '#fff' }}}%%
flowchart LR
    ENG["Engage<br/>Customer, stakeholder<br/>engagement"] --> PLAN["Plan<br/>Strategy, portfolio,<br/>architecture planning"]
    PLAN --> DT["Design &amp; Transition<br/>Service design<br/>and transition"]
    DT --> OB["Obtain / Build<br/>Service components<br/>obtained, built"]
    OB --> DS["Deliver &amp; Support<br/>Service delivery<br/>and support"]
    DS --> IMP["Improve<br/>Continual improvement<br/>CI register"]
    IMP -->|"Improvement feedback"| PLAN
    style ENG fill:#E3F2FD,stroke:#1976D2,color:#000
    style PLAN fill:#F3E5F5,stroke:#7B1FA2,color:#000
    style DT fill:#FFF3E0,stroke:#F57C00,color:#000
    style OB fill:#FFEBEE,stroke:#D32F2F,color:#000
    style DS fill:#E0F2F1,stroke:#00796B,color:#000
    style IMP fill:#E8F5E9,stroke:#388E3C,color:#000
```

| Category | Key Practices | Description |
|---|---|---|
| **General Management (14)** | Knowledge management, measurement and reporting, portfolio management, project management, risk management, strategy management | Management practices, including non-IT areas, applied across the whole organization |
| **Service Management (17)** | Incident management, problem management, change enablement, service desk, SLM, availability management, IT asset management | Core practices specific to IT service delivery, directly tied to SLA fulfillment |
| **Technical Management (3)** | Deployment management, infrastructure and platform management, software development and management | Technology-specific practices, integrated with DevOps and CI/CD pipelines |
| **SLA/SLM** | Service level agreement (SLA), service level management (SLM) | SLA: a document agreeing service targets between provider and customer (specifies availability, response time, recovery time); SLM: the activity of monitoring, reporting on, and improving SLA fulfillment |

---

## 3. Expected Benefits and Practical Applications of ITSM and ITIL v4 Adoption

| Category | Key Benefits | Practical Application |
|---|---|---|
| **Strategic** | Turns IT services into a driver of business value, raising executive awareness | Manage the IT service portfolio on the SVS, build a service value dashboard for CIO reporting |
| **Operational** | Applying incident, problem, and change management practices cuts service downtime | Integrate ITSM tools (ServiceNow, Jira Service Management), track SLA compliance as a KPI |
| **Technical** | Integrating DevOps and Agile with ITIL v4 practices improves deployment speed and stability together | Apply change enablement and deployment management practices to govern the CI/CD pipeline |
| **Customer Satisfaction** | SLM-based visibility into service levels builds trust with internal and external customers | Build a service catalog, operate an SLA structure linked to OLAs (operational level agreements) and UCs (underpinning contracts) |
