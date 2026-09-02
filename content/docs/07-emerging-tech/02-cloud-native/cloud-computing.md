---
title: Cloud Computing in Depth
description: IaaS, PaaS, SaaS, XaaS service models, Public, Private, Hybrid, and Multi-Cloud deployment model comparison
type: docs
weight: 1
---

## 1. Overview of Cloud Computing, Where You Rent What You Need and Pay for What You Use

```mermaid
%%{init: { 'theme': 'base', 'themeVariables': { 'edgeLabelBackground': '#fff' }}}%%
flowchart LR
    A["On-premises limits<br/>High upfront cost, long build time"] --"On-demand delivery,<br/>shared responsibility model"--> B["Cloud computing adopted<br/>IaaS, PaaS, SaaS choice"] --"Elastic scaling,<br/>cost optimization"--> C["Digital transformation accelerates<br/>Faster pace of innovation"]
    style A fill:#FFEBEE,stroke:#D32F2F,color:#000
    style B fill:#E3F2FD,stroke:#1976D2,color:#000
    style C fill:#E8F5E9,stroke:#388E3C,color:#000
```

**Definition**: An IT infrastructure paradigm that delivers computing resources (servers, storage, network, software) on demand over the internet and bills based on usage.
- Defines five essential characteristics per NIST SP 800-145: on-demand self-service, broad network access, resource pooling, rapid elasticity, and measured service
- Classified into IaaS, PaaS, and SaaS service models, and Public, Private, Hybrid, and Multi-Cloud deployment models
- The shared responsibility model clearly divides security responsibilities between the CSP and the customer

**Characteristics**:
- **Elasticity**: Automatically scales resources up or down within minutes as demand changes, preventing overinvestment
- **Usage-based billing**: Pays only for the CPU, storage, and network traffic used, converting CapEx to OpEx
- **Global availability**: Achieves high availability (HA) and disaster recovery (DR) through multi-region, multi-availability-zone distribution

---

## 2. Core Structure of Cloud Computing

### A. The Four Cloud Service Models and the Shared Responsibility Model

```mermaid
%%{init: { 'theme': 'base', 'themeVariables': { 'edgeLabelBackground': '#fff' }}}%%
flowchart TD
    XaaS["XaaS: Everything as a Service<br/>The full spectrum of cloud services"]
    XaaS --> SAAS["SaaS<br/>Software as a Service<br/>Gmail, Salesforce, M365"]
    XaaS --> PAAS["PaaS<br/>Platform as a Service<br/>AWS Elastic Beanstalk, Heroku"]
    XaaS --> IAAS["IaaS<br/>Infrastructure as a Service<br/>EC2, Azure VM, GCP Compute"]
    SAAS --> USER1["User responsibility<br/>Data and access management only"]
    PAAS --> USER2["User responsibility<br/>App, data, runtime configuration"]
    IAAS --> USER3["User responsibility<br/>OS, middleware, app, data"]
    style XaaS fill:#1E3A5F,stroke:#1E3A5F,color:#fff
    style SAAS fill:#E8F5E9,stroke:#388E3C,color:#000
    style PAAS fill:#E3F2FD,stroke:#1976D2,color:#000
    style IAAS fill:#F3E5F5,stroke:#7B1FA2,color:#000
    style USER1 fill:#E8F5E9,stroke:#388E3C,color:#000
    style USER2 fill:#E3F2FD,stroke:#1976D2,color:#000
    style USER3 fill:#F3E5F5,stroke:#7B1FA2,color:#000
```

| Service Model | CSP Responsibility | User Responsibility | Representative Services |
|---|---|---|---|
| **IaaS** | Physical servers, network, virtualization | OS, middleware, runtime, app, data | AWS EC2, Azure VM, GCP Compute Engine |
| **PaaS** | Everything in IaaS plus OS, middleware, runtime | Application code, data | AWS Beanstalk, Google App Engine, Heroku |
| **SaaS** | Everything in IaaS plus PaaS plus the application | Data entry, access permission management | Gmail, Salesforce, Microsoft 365 |
| **XaaS** | Delivered per service type | User configuration within the contract scope | DBaaS, FaaS, STaaS, SECaaS, and more |

---

### B. The Four Cloud Deployment Models and Intercloud Technology

```mermaid
%%{init: { 'theme': 'base', 'themeVariables': { 'edgeLabelBackground': '#fff' }}}%%
flowchart LR
    subgraph PUB["Public Cloud"]
        direction TB
        P1["CSP-owned infrastructure<br/>Shared over the internet"]
        P2["Low cost<br/>High scalability"]
    end
    subgraph PRIV["Private Cloud"]
        direction TB
        PR1["Dedicated infrastructure<br/>On-premises, dedicated DC"]
        PR2["High security, control<br/>Compliance-ready"]
    end
    subgraph HYB["Hybrid Cloud"]
        direction TB
        H1["Public plus private<br/>Connected, unified operation"]
        H2["Cloud bursting<br/>Expand to public at peak"]
    end
    subgraph MULTI["Multi-Cloud"]
        direction TB
        M1["Two or more CSPs<br/>Prevents vendor lock-in"]
        M2["Optimal CSP per service<br/>Selective use"]
    end
    style P1 fill:#E3F2FD,stroke:#1976D2,color:#000
    style P2 fill:#E3F2FD,stroke:#1976D2,color:#000
    style PR1 fill:#F3E5F5,stroke:#7B1FA2,color:#000
    style PR2 fill:#F3E5F5,stroke:#7B1FA2,color:#000
    style H1 fill:#FFF3E0,stroke:#F57C00,color:#000
    style H2 fill:#FFF3E0,stroke:#F57C00,color:#000
    style M1 fill:#E8F5E9,stroke:#388E3C,color:#000
    style M2 fill:#E8F5E9,stroke:#388E3C,color:#000
```

| Deployment Model | Cost | Security, Control | Flexibility | Suited Domain |
|---|---|---|---|---|
| **Public** | Low (usage-based) | Low (shared environment) | High (instant scaling) | Startups, development, test environments |
| **Private** | High (dedicated infrastructure) | High (full control) | Low (limited resources) | Regulated industries: finance, healthcare, defense |
| **Hybrid** | Medium (mixed billing) | Medium (policy-based separation) | Medium (bursting available) | Separates sensitive on-premises data from general cloud workloads |
| **Multi** | Secures negotiating leverage | Independent control per CSP | Highest (vendor diversity) | Global enterprise, mission-critical services |

---

## 3. Expected Benefits and Practical Applications of Adopting Cloud Computing

| Category | Key Benefits | Use and Practical Application |
|---|---|---|
| **Cost optimization** | Eliminates CapEx and converts to OpEx, minimizes waste from idle resources | Blends reserved and spot instances, builds a cloud cost management (FinOps) practice |
| **Security, compliance** | Clarifies responsibility scope through the shared responsibility model, leverages CSP security certifications | IAM least-privilege policies, data encryption (at rest, in transit), CSPM tools detect misconfigurations |
| **Availability, resilience** | Multi-AZ, multi-region deployment secures 99.99%+ SLA availability | Cloud bursting handles traffic peaks automatically, shortens disaster-recovery RTO and RPO targets |
| **Development innovation** | PaaS and serverless remove infrastructure management burden, speed up development | Shifts to container and Kubernetes-based microservices, fully automates CI/CD pipelines |
