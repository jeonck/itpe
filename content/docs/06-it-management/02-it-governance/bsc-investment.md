---
title: BSC, IT Investment Evaluation, TCO, ITAM
description: The 4 perspectives of IT-BSC, ROI/NPV/IRR/PP financial metrics, total cost of ownership (TCO) analysis, IT asset management (ITAM)
type: docs
weight: 3
---

## 1. Balancing IT Value Invisible to Financial Metrics Alone Across 4 Perspectives, Overview of IT-BSC

```mermaid
%%{init: { 'theme': 'base', 'themeVariables': { 'edgeLabelBackground': '#fff' }}}%%
flowchart LR
    A["Overreliance on short-term financial metrics<br/>Cannot measure IT's intangible value<br/>Asset life cycle unmanaged"] --"Balanced measurement across 4 perspectives<br/>ROI, NPV, TCO, ITAM"--> B["IT-BSC, investment evaluation<br/>Integrated TCO/ITAM system"] --"Makes IT value visible<br/>Optimizes assets"--> C["Achieves strategic goals<br/>Maximizes IT investment efficiency"]
    style A fill:#FFEBEE,stroke:#D32F2F,color:#000
    style B fill:#E3F2FD,stroke:#1976D2,color:#000
    style C fill:#E8F5E9,stroke:#388E3C,color:#000
```

**Definition**: A performance management framework that measures and manages IT strategic goals in a balanced way across 4 perspectives — financial, customer, internal process, and learning and growth.
- A strategic performance management tool that applies Kaplan and Norton's BSC to an IT organization, specialized as IT-BSC
- Combines ROI, NPV, IRR, and PP financial metrics with TCO analysis to evaluate IT investment feasibility from multiple angles
- Manages the full life cycle of hardware, software, and cloud assets with ITAM (IT Asset Management)

**Characteristics**:
- **Balanced performance measurement**: Tracks short-term financial performance and long-term capability indicators simultaneously, giving a complete picture of IT value
- **Causal linkage**: Makes the strategic causal chain visible in the order learning and growth → internal process → customer → financial
- **Investment optimization**: Combines TCO-based total cost analysis with ITAM to identify and eliminate unnecessary IT spending

---

## 2. Core Structure of IT-BSC, Investment Evaluation, TCO, and ITAM

### A. BSC's 4 Perspectives and Their Application in IT-BSC

```mermaid
%%{init: { 'theme': 'base', 'themeVariables': { 'edgeLabelBackground': '#fff' }}}%%
flowchart TD
    subgraph R1["　"]
        direction LR
        FIN["Financial perspective<br/>Financial<br/>IT investment profitability"]
        CUS["Customer perspective<br/>Customer<br/>IT service satisfaction"]
    end
    subgraph R2["　"]
        direction LR
        INT["Internal process perspective<br/>Internal Process<br/>IT operational efficiency"]
        LRN["Learning and growth perspective<br/>Learning &amp; Growth<br/>IT capability, innovation"]
    end
    style R1 fill:none,stroke:none
    style R2 fill:none,stroke:none
    style FIN fill:#E8F5E9,stroke:#388E3C,color:#000
    style CUS fill:#E3F2FD,stroke:#1976D2,color:#000
    style INT fill:#F3E5F5,stroke:#7B1FA2,color:#000
    style LRN fill:#FFF3E0,stroke:#F57C00,color:#000
```

| BSC Perspective | IT-BSC Strategic Goal | Key Performance Indicator (KPI) | Measurement Method |
|---|---|---|---|
| **Financial perspective** | Reduce IT investment cost, improve ROI | IT budget execution rate, ROI, TCO savings, NPV | Financial statements, IT cost analysis |
| **Customer perspective** | Improve IT service quality and user satisfaction | Service availability, SLA compliance rate, user satisfaction | SLA reports, user surveys |
| **Internal process** | Improve IT operational efficiency, strengthen security/compliance | Incident resolution time, change success rate, number of security incidents | ITSM tools, security log analysis |
| **Learning and growth** | Strengthen IT staff capability, establish a culture of technical innovation | IT staff training hours, certification holder rate, number of innovation proposals | HR system, training completion records |

---

### B. IT Investment Feasibility Analysis: ROI, NPV, IRR, PP Metrics and TCO, ITAM

```mermaid
%%{init: { 'theme': 'base', 'themeVariables': { 'edgeLabelBackground': '#fff' }}}%%
flowchart LR
    REQ["IT investment<br/>Request"] --> COST["TCO estimation<br/>Direct, indirect<br/>Total cost"] --> EVAL["Investment metric analysis<br/>ROI, NPV, IRR, PP"]
    EVAL --> DEC{"Meets investment<br/>approval criteria?"}
    DEC -->|"Meets"| EXEC["Investment execution<br/>ITAM registration<br/>Life cycle management"]
    DEC -->|"Fails to meet"| REJ["Reconsider,<br/>propose alternatives"]
    EXEC --> MON["Performance monitoring<br/>IT-BSC KPIs<br/>Track, report"]
    MON -->|"Review for reinvestment"| REQ
    style REQ fill:#E3F2FD,stroke:#1976D2,color:#000
    style COST fill:#F3E5F5,stroke:#7B1FA2,color:#000
    style EVAL fill:#FFF3E0,stroke:#F57C00,color:#000
    style DEC fill:#1E3A5F,stroke:#1E3A5F,color:#fff
    style EXEC fill:#E8F5E9,stroke:#388E3C,color:#000
    style REJ fill:#FFEBEE,stroke:#D32F2F,color:#000
    style MON fill:#E0F2F1,stroke:#00796B,color:#000
```

| Metric | Formula / Composition | Decision Criterion | Usage Scenario |
|---|---|---|---|
| **ROI** (Return on Investment) | (Net profit / investment cost) × 100% | Investment justified if above 0% | Post-project profitability evaluation for IT projects |
| **NPV** (Net Present Value) | Sum of the present value of future cash flows - initial investment | Investment justified if above 0 | Long-term IT infrastructure investment decisions |
| **IRR** (Internal Rate of Return) | The discount rate at which NPV = 0 | Justified if it exceeds the cost of capital | Prioritizing among multiple IT investment options |
| **PP** (Payback Period) | Initial investment / annual net cash flow | Within the target period | IT projects where fast payback matters |
| **TCO** (Total Cost of Ownership) | Acquisition cost + operating cost + disposal cost (full life cycle) | Minimized relative to alternatives | Cloud vs. on-premises comparison analysis |
| **ITAM** (IT Asset Management) | Hardware/software/cloud asset inventory + life cycle management | 100% license compliance | Responding to software audits, asset optimization |

---

## 3. Expected Benefits and Practical Applications of Adopting IT-BSC, Investment Evaluation, TCO, and ITAM

| Category | Key Benefits | Practical Applications |
|---|---|---|
| **Strategic** | Makes the causal link between IT investment and business strategy visible, raising executive awareness of IT value | Build an IT-BSC strategy map, establish a quarterly 4-perspective KPI report to executives |
| **Financial** | ROI/NPV/TCO analysis makes IT investment feasibility objective and prevents budget waste | Mandate NPV/IRR criteria in the new IT project approval process, operate a TCO comparison template |
| **Operational** | Ensuring ITAM-based IT asset inventory completeness eliminates audit risk | Adopt ITAM tools such as ServiceNow or Flexera, automate software license compliance |
| **Continuous improvement** | Tracking learning-and-growth KPIs continuously strengthens IT staff capability and an innovation culture | Establish an IT staff capability development roadmap, link an innovation-proposal points system to the BSC |
