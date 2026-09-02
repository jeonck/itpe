---
title: Firewall, IDS, WAF, and VPN
description: Packet-filtering and NGFW firewalls, IDS/IPS false positives/negatives, WAF, and the IPsec/SSL VPN network security device stack
type: docs
weight: 1
---

## 1. The Core Network Security Device Stack for Perimeter Security: Overview of Firewall, IDS, WAF, and VPN

```mermaid
%%{init: { 'theme': 'base', 'themeVariables': { 'edgeLabelBackground': '#fff' }}}%%
flowchart LR
    A["Unprotected network<br/>External intrusion, malicious traffic"] --"Deploy firewall, IDS,<br/>WAF, VPN"--> B["Layered perimeter security<br/>Detect, block, encrypt"] --"Visibility secured,<br/>safe connections"--> C["Security continuity<br/>Trust-based access control"]
    style A fill:#FFEBEE,stroke:#D32F2F,color:#000
    style B fill:#E3F2FD,stroke:#1976D2,color:#000
    style C fill:#E8F5E9,stroke:#388E3C,color:#000
```

**Definition**: A security device stack that layers firewall, IDS/IPS, WAF, and VPN at the network perimeter to detect and block external threats while guaranteeing secure communication.
- The firewall provides the first line of perimeter control, allowing or blocking traffic; the WAF is L7 defense dedicated to web applications
- IDS detects and alerts, while IPS sits inline and blocks in real time
- VPN provides secure remote access and site-to-site connections over public networks through an encrypted tunnel

**Characteristics**:
- **Defense in depth**: layering firewall, IPS, and WAF keeps additional defense lines standing even if a single device is bypassed
- **Visibility**: IDS/IPS logs, WAF events, and VPN connection records support threat analysis and forensics
- **Secure remote access**: IPsec and SSL VPN guarantee confidentiality and integrity when accessing the internal network from outside

---

## 2. Core Structure of Firewall, IDS, WAF, and VPN

### A. Firewall Evolution and IDS/IPS

```mermaid
%%{init: { 'theme': 'base', 'themeVariables': { 'edgeLabelBackground': '#fff' }}}%%
flowchart LR
    PF["Packet filtering<br/>Based on L3/L4 headers"]
    SF["Stateful inspection<br/>Tracks session state"]
    PX["Application gateway<br/>L7 proxy analysis"]
    NG["NGFW next-gen firewall<br/>IPS + app awareness + SSL inspection"]

    PF --> SF
    SF --> PX
    PX --> NG

    style PF fill:#F3E5F5,stroke:#7B1FA2,color:#000
    style SF fill:#FFF3E0,stroke:#F57C00,color:#000
    style PX fill:#E3F2FD,stroke:#1976D2,color:#000
    style NG fill:#1E3A5F,stroke:#1E3A5F,color:#fff
```

| Firewall type | OSI layer | Advantages | Limitations |
|---|---|---|---|
| **Packet filtering** | L3/L4 | Fast processing, simple to implement | Cannot analyze the application layer |
| **Stateful** | L3/L4 | Tracks sessions, supports dynamic port control | Memory burden from the session table |
| **Application gateway** | L7 | Precise content-level analysis | Processing delay, performance bottleneck |
| **NGFW** | L3 through L7 | Integrates IPS, app awareness, and user authentication | High cost, configuration complexity |

---

### B. WAF and VPN

```mermaid
%%{init: { 'theme': 'base', 'themeVariables': { 'edgeLabelBackground': '#fff' }}}%%
flowchart TD
    INT["Internal network<br/>Servers, databases"]
    IPSEC["IPsec VPN tunnel<br/>L3 encryption via AH, ESP"]
    NET["Internet<br/>Public network"]
    SSL["SSL VPN gateway<br/>L4-L7 browser access"]
    REM["Remote user<br/>Home, offsite access"]

    INT --> IPSEC
    IPSEC --> NET
    NET --> SSL
    SSL --> REM

    style INT fill:#1E3A5F,stroke:#1E3A5F,color:#fff
    style IPSEC fill:#E3F2FD,stroke:#1976D2,color:#000
    style NET fill:#FFEBEE,stroke:#D32F2F,color:#000
    style SSL fill:#FFF3E0,stroke:#F57C00,color:#000
    style REM fill:#E8F5E9,stroke:#388E3C,color:#000
```

| Comparison | IPsec VPN | SSL VPN |
|---|---|---|
| **Operating layer** | L3 (network layer) | L4 through L7 (transport to application) |
| **Key protocols** | AH (authentication), ESP (encryption + authentication), IKE | TLS/DTLS |
| **Client** | A dedicated VPN client is required | Browser or a lightweight agent |
| **Security level** | Encrypts the entire IP packet, strong integrity | Selective encryption at the application layer |
| **Best fit** | Site-to-site connections (S2S), enterprise infrastructure | Individual access for remote workers, BYOD |

---

## 3. Expected Benefits and Practical Applications of Adopting Firewall, IDS, WAF, and VPN

| Category | Key benefits | Use and practical application |
|---|---|---|
| **Perimeter security** | NGFW-based layered defense strengthens blocking of external intrusion and malicious traffic | Deploy NGFW in the DMZ, operate fine-grained inbound/outbound policies |
| **Web security** | WAF defense against the OWASP Top 10 blocks web attacks such as SQLi, XSS, and CSRF | Integrate cloud WAF (AWS WAF, CloudFlare), update signatures on a regular schedule |
| **Intrusion detection** | IDS/IPS anomaly detection identifies and blocks known and unknown threats early | Analyze IPS logs integrated with SIEM, establish a tuning process that minimizes false positives |
| **Remote access** | IPsec/SSL VPN guarantees internal-network-level secure access when working from home or traveling | Build a roadmap to replace VPN with ZTNA, apply conditional access policies |
