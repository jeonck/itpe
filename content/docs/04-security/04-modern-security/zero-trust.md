---
title: Zero Trust
description: The Never Trust, Always Verify principle, the SDP implementation model, and the 5 core guidelines for users, devices, networks, data, and applications
type: docs
weight: 1
---

## 1. Perimeterless Security That Never Trusts and Always Verifies — Overview of Zero Trust

```mermaid
%%{init: { 'theme': 'base', 'themeVariables': { 'edgeLabelBackground': '#fff' }}}%%
flowchart LR
    A["Limits of perimeter security<br/>insider threats, remote work"] --"Never Trust<br/>Always Verify"--> B["Zero Trust applied<br/>verify all traffic"] --"Least privilege<br/>continuous authentication"--> C["Secure access guaranteed<br/>data and resources protected"]
    style A fill:#FFEBEE,stroke:#D32F2F,color:#000
    style B fill:#E3F2FD,stroke:#1976D2,color:#000
    style C fill:#E8F5E9,stroke:#388E3C,color:#000
```

**Definition**: A perimeterless security model that continuously verifies every access attempt, internal or external, under the "Never Trust, Always Verify" principle, blocking insider threats and lateral movement.
- John Kindervag (Forrester) proposed the concept in 2010; it spread domestically through the Ministry of Science and ICT's 5 core guidelines.
- In cloud and remote-work environments, it fundamentally resolves the flawed assumption of internal trust in VPN-based perimeter security.
- Applies fine-grained controls across 5 areas: users, devices, networks, data, and applications.

**Characteristics**:
- **Explicit Verification**: Authenticates and authorizes identity, device state, and context on every request, regardless of location or network.
- **Least Privilege**: Grants only the minimum resources needed for the task, on a time-limited basis, blocking privilege abuse.
- **Assume Breach**: Assumes the internal network is already compromised, encrypting and logging all traffic.

---

## 2. Core Structure of Zero Trust

### A. Zero Trust Concepts and 3 Core Principles

```mermaid
%%{init: { 'theme': 'base', 'themeVariables': { 'edgeLabelBackground': '#fff' }}}%%
flowchart LR
    subgraph OLD["Traditional Perimeter Security"]
        O1["Internet<br/>external zone"] --"Passes firewall"--> O2["Internal network<br/>trusted zone"] --> O3["Resource access<br/>unconditionally allowed"]
    end
    subgraph ZT["Zero Trust"]
        Z1["Users, devices<br/>anywhere"] --"ID, context<br/>authentication"--> Z2["Policy engine<br/>access decision"] --"Least privilege<br/>session allowed"--> Z3["Protected resource<br/>micro-segment"]
    end
    style O1 fill:#FFEBEE,stroke:#D32F2F,color:#000
    style O2 fill:#FFEBEE,stroke:#D32F2F,color:#000
    style O3 fill:#FFEBEE,stroke:#D32F2F,color:#000
    style Z1 fill:#E3F2FD,stroke:#1976D2,color:#000
    style Z2 fill:#1E3A5F,stroke:#1E3A5F,color:#fff
    style Z3 fill:#E8F5E9,stroke:#388E3C,color:#000
```

| Category | Traditional Perimeter Security (VPN) | Zero Trust |
|---|---|---|
| **Trust Model** | Automatic trust for the internal network | Both internal and external verified |
| **Access Basis** | Network location (IP) | Identity, device, context |
| **Insider Threat** | Hard to detect, allows lateral movement | Blocked via micro-segmentation |
| **Cloud Suitability** | Limited by an unclear perimeter | Optimal for cloud-native environments |

---

### B. SDP (Software Defined Perimeter) Implementation Model

```mermaid
%%{init: { 'theme': 'base', 'themeVariables': { 'edgeLabelBackground': '#fff' }}}%%
flowchart TD
    C["Client<br/>sends SPA"] --"Authentication request"--> CTRL["Controller<br/>policy management, access decision"]
    CTRL --"Deploy gateway policy"--> GW["Gateway<br/>protects resources at the front"]
    CTRL --"Access grant token"--> C
    C --"Authorized traffic only"--> GW
    GW --> R["Protected resource<br/>app, DB, service"]
    style C fill:#E3F2FD,stroke:#1976D2,color:#000
    style CTRL fill:#1E3A5F,stroke:#1E3A5F,color:#fff
    style GW fill:#F3E5F5,stroke:#7B1FA2,color:#000
    style R fill:#E8F5E9,stroke:#388E3C,color:#000
```

| Component | Role | Function | Characteristics |
|---|---|---|---|
| **Controller** | Manages authentication policy | Verifies users and devices, makes access decisions | Centralizes policy, separates PEP and PDP |
| **Gateway** | Protects resources at the front | Passes only authorized traffic, keeps ports hidden | Blocks port scanning before SPA receipt |
| **Client** | User endpoint agent | Sends SPA, requests authentication from the controller | Replaces VPN with a ZTNA app |

---

## 3. Expected Benefits and Practical Applications of Adopting Zero Trust

| Category | Key Benefit | Practical Application |
|---|---|---|
| **Strengthened Security** | Blocks insider threats and lateral movement, minimizes the spread of a breach | Apply micro-segmentation, encrypt and log all traffic |
| **Access Control** | The least-privilege principle prevents excessive privilege abuse | IAM-integrated RBAC/ABAC policy, JIT (Just-In-Time) privilege grants |
| **Cloud Readiness** | Applies consistent security policy in a perimeterless environment | Replace VPN with ZTNA, integrate CASB and CSPM for cloud access control |
| **Regulatory Compliance** | Logging every access attempt secures audit and compliance evidence | Phased adoption across the 5 areas of the Ministry of Science and ICT's Zero Trust guidelines |
