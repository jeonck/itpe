---
title: Security Risk Management Process
description: A systematic security risk management framework covering risk identification, quantitative/qualitative analysis, evaluation, and response (avoidance, transfer, mitigation, acceptance)
type: docs
weight: 1
---

## 1. The Security Risk Management Cycle of Identification, Analysis, Evaluation, and Response — Overview of Security Risk Management

```mermaid
%%{init: { 'theme': 'base', 'themeVariables': { 'edgeLabelBackground': '#fff' }}}%%
flowchart LR
    A["Rising security threats<br/>risk of asset loss"] --"Systematic risk<br/>identification, analysis, evaluation"--> B["Risk management process<br/>4-stage cycle applied"] --"Residual risk<br/>minimized and accepted"--> C["Improved security posture<br/>business continuity secured"]
    style A fill:#FFEBEE,stroke:#D32F2F,color:#000
    style B fill:#E3F2FD,stroke:#1976D2,color:#000
    style C fill:#E8F5E9,stroke:#388E3C,color:#000
```

**Definition**: An information security management framework that comprehensively analyzes threats, vulnerabilities, and asset value to identify, evaluate, and respond to risk.
- Quantifies risk with the formula Risk = Threat × Vulnerability × Asset Value.
- Applies quantitative (ALE-based) and qualitative (risk matrix) analysis techniques together.
- Builds a continuous improvement system by combining with the ISO/IEC 27001 PDCA cycle.

**Characteristics**:
- **Proactive Response**: Identifies risk before a breach occurs and selects cost-effective controls.
- **Quantifiable**: The formula ALE = SLE × ARO allows calculating return on investment (ROI).
- **Flexible Response Strategy**: Uses 4 strategies — avoidance, transfer, mitigation, acceptance — for the optimal response to each situation.

---

## 2. Core Structure of Security Risk Management

### A. The 4-Stage Risk Management Process

```mermaid
%%{init: { 'theme': 'base', 'themeVariables': { 'edgeLabelBackground': '#fff' }}}%%
flowchart LR
    S1["Risk identification<br/>asset inventory<br/>threat scenarios"] --> S2["Risk analysis<br/>quantitative, qualitative<br/>ALE / matrix"]
    S2 --> S3["Risk evaluation<br/>Risk Appetite<br/>compare to tolerance level"]
    S3 --> S4["Risk response<br/>avoidance, transfer<br/>mitigation, acceptance"]
    S4 -->|"Monitoring,<br/>reassessment"| S1
    style S1 fill:#E3F2FD,stroke:#1976D2,color:#000
    style S2 fill:#F3E5F5,stroke:#7B1FA2,color:#000
    style S3 fill:#FFF3E0,stroke:#F57C00,color:#000
    style S4 fill:#E8F5E9,stroke:#388E3C,color:#000
```

| Response Strategy | Definition | Example | Applicable Condition |
|---|---|---|---|
| **Avoidance** | Stops the activity that causes the risk entirely | Decommission the risky system, discontinue the service | When risk far exceeds the tolerance level |
| **Transfer** | Shifts the financial responsibility for the risk to a third party | Purchase cyber insurance, outsourcing contract | When frequency is low but impact is large |
| **Mitigation** | Applies security controls to reduce the risk level | Implement firewalls, encryption, access control | When cost-effective |
| **Acceptance** | Recognizes the residual risk and accepts it as is | Document risk acceptance, obtain management approval | When risk is within the tolerance level or the cost of response is excessive |

---

### B. ISO/IEC 27001 Information Security Management System

```mermaid
%%{init: { 'theme': 'base', 'themeVariables': { 'edgeLabelBackground': '#fff' }}}%%
flowchart LR
    P["Plan<br/>define ISMS scope<br/>risk treatment plan"] --> D["Do<br/>apply controls<br/>execute 14 domains"]
    D --> C["Check<br/>internal audit<br/>measure performance"]
    C --> A["Act<br/>correct nonconformities<br/>continuous improvement"]
    A -->|"Next cycle"| P
    style P fill:#E3F2FD,stroke:#1976D2,color:#000
    style D fill:#E8F5E9,stroke:#388E3C,color:#000
    style C fill:#FFF3E0,stroke:#F57C00,color:#000
    style A fill:#FFEBEE,stroke:#D32F2F,color:#000
```

| Control Domain | Key Controls | Purpose |
|---|---|---|
| **Information Security Policy** | Document the policy, obtain management approval and review | Establish security direction across the organization |
| **Human Resource Security** | Pre-employment screening, security training, termination procedures | Prevent insider threats and raise security awareness |
| **Access Control** | Least privilege, account management, privileged account control | Block information leaks from unauthorized access |
| **Encryption** | Establish encryption policy and key management procedures | Guarantee confidentiality and integrity of data at rest and in transit |
| **Business Continuity (BCP/DR)** | Define RTO/RPO, establish and drill the disaster recovery plan | Quickly restore core operations when an incident occurs |

---

## 3. Expected Benefits and Practical Applications of Adopting Security Risk Management

| Category | Key Benefit | Practical Application |
|---|---|---|
| **Strategic** | Raises management's risk awareness and supports decision-making | Prioritize security investment using ALE, build a board reporting system |
| **Operational** | Prevents security incidents and minimizes damage in a breach | Maintain a risk register, apply a quarterly risk reassessment process |
| **Technical** | Earning ISO 27001 certification builds customer and partner trust | Build a PDCA-based ISMS, institutionalize internal audits and management review |
| **Regulatory Response** | Meets legal obligations under the Personal Information Protection Act and the Information Security Act | Document a risk treatment plan (RTP), prepare submission evidence for regulators |
