---
title: Cloud Security Architecture
description: Shared responsibility model, the Gartner CWPP, CSPM, CASB, and CNAPP framework, and SASE/SSE cloud security solutions
type: docs
weight: 2
---

## 1. Protecting Cloud Assets End to End with Shared Responsibility and CNAPP — Overview of Cloud Security Architecture

```mermaid
%%{init: { 'theme': 'base', 'themeVariables': { 'edgeLabelBackground': '#fff' }}}%%
flowchart LR
    A["Accelerating cloud adoption<br/>misconfiguration, lack of visibility"] --"Shared responsibility model<br/>CNAPP integrated protection"--> B["Workloads, configuration, access<br/>end-to-end control"] --"SASE network convergence<br/>consistent policy"--> C["Cloud asset protection<br/>automated compliance"]
    style A fill:#FFEBEE,stroke:#D32F2F,color:#000
    style B fill:#E3F2FD,stroke:#1976D2,color:#000
    style C fill:#E8F5E9,stroke:#388E3C,color:#000
```

**Definition**: A security framework, built on the shared responsibility model between the CSP and the customer, that protects cloud assets end to end through a CNAPP architecture integrating CWPP, CSPM, and CASB, together with SASE.
- The line dividing security responsibility between the CSP and the customer shifts depending on the cloud service type (IaaS, PaaS, SaaS).
- Gartner is driving the trend of consolidating fragmented cloud security tools into CNAPP.
- In remote-work and multi-cloud environments, SASE converges networking and security delivery in the cloud.

**Characteristics**:
- **Clarified Shared Responsibility**: The customer's responsibility narrows moving from IaaS to PaaS to SaaS, with security roles clearly divided for each model.
- **CNAPP Integration**: Consolidates workload protection (CWPP) and configuration management (CSPM) into a single platform, eliminating security blind spots.
- **SASE Convergence**: Delivers SD-WAN and SSE (CASB, SWG, ZTNA) together from the cloud, applying consistent policy across distributed environments.

---

## 2. Core Structure of Cloud Security Architecture

### A. Shared Responsibility Model and Gartner Cloud Security Solutions

```mermaid
%%{init: { 'theme': 'base', 'themeVariables': { 'edgeLabelBackground': '#fff' }}}%%
flowchart TD
    CNAPP["CNAPP<br/>Cloud Native Application<br/>Protection Platform"]
    CWPP["CWPP<br/>VM, container, serverless<br/>workload protection"]
    CSPM["CSPM<br/>Cloud misconfiguration<br/>detection, auto-remediation"]
    CASB["CASB<br/>SaaS access<br/>visibility, control"]
    CNAPP --> CWPP
    CNAPP --> CSPM
    CNAPP --> CASB
    style CNAPP fill:#1E3A5F,stroke:#1E3A5F,color:#fff
    style CWPP fill:#E3F2FD,stroke:#1976D2,color:#000
    style CSPM fill:#F3E5F5,stroke:#7B1FA2,color:#000
    style CASB fill:#FFF3E0,stroke:#F57C00,color:#000
```

| Solution | Protection Target | Key Function | When Applied |
|---|---|---|---|
| **CWPP** | VM, container, serverless workloads | Vulnerability scanning, runtime protection, malware detection | At workload deployment |
| **CSPM** | Cloud infrastructure configuration | Misconfiguration detection, auto-remediation, compliance audit | Continuous monitoring |
| **CASB** | SaaS application access | Shadow IT detection, DLP, access control | When using SaaS |
| **CNAPP** | The entire cloud-native application | CWPP + CSPM integration, consistent protection from code to runtime | Across development through operations |

---

### B. SASE and SSE Architecture

```mermaid
%%{init: { 'theme': 'base', 'themeVariables': { 'edgeLabelBackground': '#fff' }}}%%
flowchart LR
    U["Users and devices<br/>anywhere"] --"Encrypted tunnel"--> SASE["SASE cloud<br/>SD-WAN + SSE"]
    SASE --"Internet filtering"--> WEB["Internet<br/>SWG protection"]
    SASE --"Policy enforcement"--> SAAS["SaaS apps<br/>CASB control"]
    SASE --"VPN replacement"--> DC["Data center<br/>ZTNA access"]
    style U fill:#E3F2FD,stroke:#1976D2,color:#000
    style SASE fill:#1E3A5F,stroke:#1E3A5F,color:#fff
    style WEB fill:#E8F5E9,stroke:#388E3C,color:#000
    style SAAS fill:#F3E5F5,stroke:#7B1FA2,color:#000
    style DC fill:#FFF3E0,stroke:#F57C00,color:#000
```

| Category | Traditional Network Security | SASE |
|---|---|---|
| **Location** | Data-center-centric appliances | Distributed cloud edge |
| **Policy Management** | Individual per-device configuration | Unified in a single cloud console |
| **Scalability** | Requires hardware expansion | Elastic cloud scale |
| **Remote Work** | VPN bottlenecks, degraded performance | ZTNA guarantees the optimal path |

---

## 3. Expected Benefits and Practical Applications of Adopting Cloud Security Architecture

| Category | Key Benefit | Practical Application |
|---|---|---|
| **Visibility** | Gains full visibility into multi-cloud assets, automatically detects misconfigurations | Adopt CSPM for unified configuration management across AWS, Azure, and GCP |
| **Workload Protection** | Blocks container and serverless runtime threats in real time | CWPP-based Kubernetes runtime security, CI/CD image scanning |
| **Access Control** | Detects and blocks SaaS shadow IT, prevents data leaks | CASB-integrated DLP policy, replacing remote-access VPN with ZTNA |
| **Compliance** | Automatically produces regulatory compliance evidence for the cloud environment, reduces audit burden | Automated CIS Benchmark and ISO 27017 checks based on CNAPP |
