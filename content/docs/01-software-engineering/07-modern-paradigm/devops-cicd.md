---
title: DevOps and CI/CD
description: A methodology that removes the silo between development and operations, achieving software quality and deployment speed together through a continuous integration/delivery pipeline
type: docs
weight: 60
---

## I. Overview of DevOps and CI/CD, Achieving Both Deployment Speed and Quality by Removing the Dev-Ops Silo

```mermaid
%%{init: { 'theme': 'base', 'themeVariables': { 'edgeLabelBackground': '#fff' }}}%%
flowchart LR
    A["Dev and Ops disconnected<br/>Manual deployment, silos"] --"CALMS culture +<br/>pipeline automation"--> B["CI/CD, continuous<br/>integration, delivery, deployment"] --"Fast feedback<br/>+ stable operations"--> C["High deployment frequency<br/>+ low failure rate"]
    style A fill:#FFEBEE,stroke:#D32F2F,color:#000
    style B fill:#E3F2FD,stroke:#1976D2,color:#000
    style C fill:#E8F5E9,stroke:#388E3C,color:#000
```

**Definition**:  
A cultural and technical methodology that removes the silo between development (Dev) and operations (Ops), achieving software quality and deployment speed together through an automated CI/CD pipeline  
- Built on the CALMS framework (Culture, Automation, Lean, Measurement, Sharing), integrating everything from organizational culture to tooling  
- Automates the entire path from code commit to production deployment, shortening the release cycle to daily or weekly  
- Secures environment consistency with IaC (Infrastructure as Code), solving "works on my machine" at the root  

**Characteristics**:  
( **Automation-first** ) Automates the entire build, test, and deploy path as a pipeline, removing human error and deployment delay  
( **Shortened feedback** ) Test results are visible within minutes of a code commit, catching defects early and minimizing fix cost  
( **Immutable infrastructure** ) Defines environments as code and prevents drift by replacing rather than modifying (Immutable Infrastructure)  

---

## II. Core Structure of DevOps and CI/CD

### A. DevOps Culture (CALMS) and CI/CD Pipeline Structure

```mermaid
%%{init: { 'theme': 'base', 'themeVariables': { 'edgeLabelBackground': '#fff' }}}%%
flowchart LR
    A["Code commit<br/>Git Push"] --> B["Build<br/>Compile, package"]
    B --> C["Automated testing<br/>Unit, Integration"]
    C --> D["Quality analysis<br/>SonarQube, SAST"]
    D --> E["Staging deployment<br/>Automatic approval"]
    E --> F["Production deployment<br/>Manual approval or automatic"]
    F -->|"Monitoring<br/>feedback"| A

    style A fill:#E3F2FD,stroke:#1976D2,color:#000
    style B fill:#E3F2FD,stroke:#1976D2,color:#000
    style C fill:#F3E5F5,stroke:#7B1FA2,color:#000
    style D fill:#F3E5F5,stroke:#7B1FA2,color:#000
    style E fill:#FFF3E0,stroke:#F57C00,color:#000
    style F fill:#E8F5E9,stroke:#388E3C,color:#000
```

| Stage | Automation scope | Core activities | Deployment approval | Key tools |
|---|---|---|---|---|
| **CI (Continuous Integration)** | Code commit through test results | Build, unit test, code-quality analysis, vulnerability scan | Automatic (on pipeline pass) | Jenkins, GitHub Actions, GitLab CI |
| **CD (Continuous Delivery)** | After CI through staging deployment | Integration test, performance test, staging deployment | Manual approval before production | ArgoCD, Spinnaker, Jenkins |
| **CD (Continuous Deployment)** | Fully automatic through to production | Canary/blue-green deployment, auto-rollback, monitoring | Fully automatic (condition-based) | ArgoCD, Flux, Kubernetes |

---

### B. The IaC Concept and the DevOps Tool Ecosystem

```mermaid
%%{init: { 'theme': 'base', 'themeVariables': { 'edgeLabelBackground': '#fff' }}}%%
flowchart TD
    ROOT["IaC<br/>Infrastructure as Code"] --> A["Declarative"]
    ROOT --> B["Imperative"]
    A --> A1["Terraform<br/>Defines the desired end state"]
    A --> A2["CloudFormation<br/>Declares AWS resources"]
    B --> B1["Ansible<br/>Defines execution order, playbooks"]
    B --> B2["Chef / Puppet<br/>Executes recipes, manifests in order"]
    ROOT --> C["Immutable infrastructure<br/>Immutable Infra"]
    C --> C1["Replace instead of modify<br/>Prevents environment drift"]

    style ROOT fill:#1E3A5F,stroke:#1E3A5F,color:#fff
    style A fill:#E3F2FD,stroke:#1976D2,color:#000
    style B fill:#F3E5F5,stroke:#7B1FA2,color:#000
    style A1 fill:#E3F2FD,stroke:#1976D2,color:#000
    style A2 fill:#E3F2FD,stroke:#1976D2,color:#000
    style B1 fill:#F3E5F5,stroke:#7B1FA2,color:#000
    style B2 fill:#F3E5F5,stroke:#7B1FA2,color:#000
    style C fill:#E8F5E9,stroke:#388E3C,color:#000
    style C1 fill:#E8F5E9,stroke:#388E3C,color:#000
```

| Category | Representative tools | Core function |
|---|---|---|
| **Source management** | Git, GitHub, GitLab | Code version control, branch strategy, code review |
| **CI engine** | Jenkins, GitHub Actions, GitLab CI | Auto-runs the build/test pipeline |
| **CD / Deployment** | ArgoCD, Spinnaker, Flux | GitOps-based continuous deployment and rollback |
| **Containers** | Docker, Kubernetes, Helm | Application packaging and orchestration |
| **Monitoring** | Prometheus, Grafana, ELK Stack | Metrics, logs, alerts, dashboards |
| **IaC** | Terraform, Ansible, CloudFormation | Codifying infrastructure, provisioning automation |

---

## III. Expected Benefits and Practical Applications of Adopting DevOps and CI/CD

| Category | Key benefits | Use and practical application |
|---|---|---|
| **Deployment speed** | Shortens the release cycle from monthly/quarterly to daily/weekly, responding fast to market demand | Combine trunk-based development with feature flags for safe, high-frequency deployment |
| **Quality stability** | Automated testing catches regressions early, sharply cutting the production failure rate | Set SAST/DAST and an 80%+ code-coverage gate in the CI pipeline to block defects from entering |
| **Operational efficiency** | IaC automates environment provisioning, removing manual configuration errors and optimizing infrastructure cost | Codify multi-cloud infrastructure with Terraform; track and audit change history through PR review |
| **Organizational culture** | Strengthens Dev-Ops collaboration to remove silos, establishing a shared-responsibility culture during incident response | Combine a blameless post-mortem culture with SRE principles to build a continuous-improvement cycle |
