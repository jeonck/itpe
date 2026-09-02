---
title: SSL/TLS and IPsec Security Protocols
description: The TLS 1.3 handshake process, IPsec AH/ESP protocols, and network-layer security in tunnel/transport mode
type: docs
weight: 2
---

## 1. Securing Communication Paths with Transport- and Network-Layer Encryption: Overview of SSL/TLS and IPsec

```mermaid
%%{init: { 'theme': 'base', 'themeVariables': { 'edgeLabelBackground': '#fff' }}}%%
flowchart LR
    A["Plaintext communication<br/>Eavesdropping, tampering threats"] --"Apply encryption,<br/>authentication per layer"--> B["SSL/TLS, IPsec<br/>Confidentiality, integrity, authentication"] --"Secure<br/>communication channel"--> C["End-to-end security<br/>Service trustworthiness achieved"]
    style A fill:#FFEBEE,stroke:#D32F2F,color:#000
    style B fill:#E3F2FD,stroke:#1976D2,color:#000
    style C fill:#E8F5E9,stroke:#388E3C,color:#000
```

**Definition**: A network security protocol stack that provides encryption, integrity, and authentication at the transport layer (TLS) and network layer (IPsec) to secure the communication path.
- TLS runs on top of TCP and protects application protocols such as HTTPS, SMTP, and IMAP
- IPsec protects at the IP packet level and is used for VPN, remote access, and site-to-site connections
- TLS 1.3 largely removes prior versions' weaknesses through a 1-RTT handshake and perfect forward secrecy (PFS)

**Characteristics**:
- **Layered security**: dual protection at L4 (TLS) and L3 (IPsec) defends both the application and infrastructure layers at once
- **Forward secrecy**: ECDHE-based ephemeral key exchange protects past traffic even if a session key is exposed
- **Interoperability**: built on international standards (RFC), enabling secure communication across heterogeneous vendors, devices, and platforms

---

## 2. Core Structure of SSL/TLS and IPsec

### A. The SSL/TLS Handshake and TLS 1.3 Improvements

```mermaid
%%{init: { 'theme': 'base', 'themeVariables': { 'edgeLabelBackground': '#fff' }}}%%
flowchart LR
    C1["Client Hello<br/>Supported cipher suites, random value"] --> S1["Server Hello<br/>Certificate, key exchange"]
    S1 --> C2["Key exchange complete<br/>Sends Finished"]
    C2 --> S2["Receives Finished<br/>Session established"]
    S2 --> APP["Application<br/>Data transfer"]
    style C1 fill:#E3F2FD,stroke:#1976D2,color:#000
    style S1 fill:#F3E5F5,stroke:#7B1FA2,color:#000
    style C2 fill:#E3F2FD,stroke:#1976D2,color:#000
    style S2 fill:#F3E5F5,stroke:#7B1FA2,color:#000
    style APP fill:#E8F5E9,stroke:#388E3C,color:#000
```

| Category | TLS 1.2 | TLS 1.3 | Notes |
|---|---|---|---|
| **RTT count** | 2-RTT | 1-RTT | 50% less latency |
| **Key exchange** | Choice of RSA, DHE, ECDHE | ECDHE required | PFS mandatory |
| **Forward secrecy** | Optional | Always guaranteed | Session key independence |
| **Supported algorithms** | Allows RC4, DES, 3DES, MD5, SHA-1 | Weak algorithms fully removed | Smaller attack surface |
| **0-RTT resumption** | Not supported | Session resumption supported | Faster repeat connections |

---

### B. IPsec Structure and Operating Modes

```mermaid
%%{init: { 'theme': 'base', 'themeVariables': { 'edgeLabelBackground': '#fff' }}}%%
flowchart TD
    IKE["IKE<br/>SA negotiation, key exchange"] --> AH["AH<br/>Authentication Header<br/>Integrity + authentication"]
    IKE --> ESP["ESP<br/>Encapsulating Security Payload<br/>Encryption + integrity + authentication"]
    AH --> TM["Transport mode<br/>Keeps the IP header<br/>Protects only the payload"]
    AH --> TUN["Tunnel mode<br/>Encapsulates the entire packet<br/>Adds a new IP header"]
    ESP --> TM
    ESP --> TUN
    style IKE fill:#1E3A5F,stroke:#1E3A5F,color:#fff
    style AH fill:#E3F2FD,stroke:#1976D2,color:#000
    style ESP fill:#F3E5F5,stroke:#7B1FA2,color:#000
    style TM fill:#FFF3E0,stroke:#F57C00,color:#000
    style TUN fill:#E8F5E9,stroke:#388E3C,color:#000
```

| Category | AH | ESP | Notes |
|---|---|---|---|
| **Encryption** | Not provided | Provides AES, 3DES | ESP is generally preferred |
| **Integrity/authentication** | Provided via HMAC | Provided via HMAC | Differ in whether the IP header is covered |
| **Header position** | Inserted after the IP header | After the IP header, before the payload | Protocol numbers 51/50 |
| **Best use** | Internal traffic that needs integrity only | Traffic that needs confidentiality and integrity | VPN standardizes on ESP tunnel mode |

---

## 3. Expected Benefits and Practical Applications of Adopting SSL/TLS and IPsec

| Category | Key benefits | Use and practical application |
|---|---|---|
| **Transport security** | TLS 1.3 blocks HTTPS eavesdropping and tampering at the source | Force web services onto TLS 1.3, apply HSTS/HPKP headers |
| **VPN infrastructure** | IPsec ESP tunnel mode builds a dedicated encrypted link for site-to-site connections | IPsec VPN between headquarters and branches, client VPN for remote workers |
| **Stronger authentication** | Mutual certificate verification blocks phishing and MITM attacks in advance | mTLS-based API gateway authentication, Zero Trust client authentication |
| **Regulatory compliance** | Requiring TLS 1.2 or later meets PCI-DSS and personal data protection law | Audit TLS versions in financial/healthcare systems, disable weak cipher suites |
