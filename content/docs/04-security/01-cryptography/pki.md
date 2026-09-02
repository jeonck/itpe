---
title: Public Key Infrastructure (PKI)
description: The X.509 PKI trust framework built from CA, RA, certificate issuance, CRL, and OCSP, and certificate life cycle management
type: docs
weight: 4
---

## 1. Certificate Management Infrastructure for Public Key Trust: Overview of PKI

```mermaid
%%{init: { 'theme': 'base', 'themeVariables': { 'edgeLabelBackground': '#fff' }}}%%
flowchart LR
    A["No public key trust<br/>Tampering, impersonation threats"] --"CA issues certificates,<br/>builds trust framework"--> B["PKI applied<br/>X.509 certificate management"] --"Identity verification,<br/>secure communication"--> C["Confidentiality, integrity,<br/>non-repudiation achieved"]
    style A fill:#FFEBEE,stroke:#D32F2F,color:#000
    style B fill:#E3F2FD,stroke:#1976D2,color:#000
    style C fill:#E8F5E9,stroke:#388E3C,color:#000
```

**Definition**: A trust infrastructure built on public key cryptography that issues, manages, and revokes digital certificates to provide secure identity assurance.
- Made up of 4 elements: CA, RA, users, and repository, and uses X.509 standard certificates
- Manages the entire certificate life cycle through validity periods, CRL, and OCSP
- The foundational technology behind TLS/SSL, digital signatures, e-government, and many other authentication services

**Characteristics**:
- **Trust hierarchy**: a hierarchical chain of trust running from Root CA to Intermediate CA to end-entity certificate
- **Asymmetric verification**: signing with a private key and verifying with a public key guarantees non-repudiation and integrity together
- **Life cycle management**: CRL and OCSP track certificate status in real time, from issuance through renewal to revocation

---

## 2. Core Structure of PKI

### A. PKI Components and Trust Model

```mermaid
%%{init: { 'theme': 'base', 'themeVariables': { 'edgeLabelBackground': '#fff' }}}%%
flowchart TD
    ROOT["Root CA<br/>Top-level CA (self-signed)"]
    ICA["Intermediate CA<br/>Intermediate certificate authority"]
    EE["End-entity certificate<br/>Server, user, code signing"]
    RA["RA registration authority<br/>Identity check, accepts CSR"]
    REPO["Repository<br/>Distributes certificates, CRL"]

    ROOT --> ICA
    ICA --> EE
    RA --> ICA
    ICA --> REPO

    style ROOT fill:#1E3A5F,stroke:#1E3A5F,color:#fff
    style ICA fill:#E3F2FD,stroke:#1976D2,color:#000
    style EE fill:#E8F5E9,stroke:#388E3C,color:#000
    style RA fill:#FFF3E0,stroke:#F57C00,color:#000
    style REPO fill:#F3E5F5,stroke:#7B1FA2,color:#000
```

| Component | Role | Key function |
|---|---|---|
| **CA (Certificate Authority)** | Signs and issues certificates | Generates X.509 certificates, publishes CRL, manages policy |
| **RA (Registration Authority)** | Verifies applicant identity on the CA's behalf | Reviews CSR, forwards issuance requests to the CA |
| **User (entity)** | Holds and uses a certificate | Generates key pair, submits CSR, uses the certificate |
| **Repository** | Server that distributes certificates and CRL | Publishes CRL/certificates over LDAP or HTTP |

---

### B. Certificate Issuance and Revocation Process

```mermaid
%%{init: { 'theme': 'base', 'themeVariables': { 'edgeLabelBackground': '#fff' }}}%%
flowchart LR
    U["User<br/>Generates key pair, writes CSR"]
    RA2["RA<br/>Verifies identity, accepts CSR"]
    CA2["CA<br/>Validates and signs"]
    CERT["Certificate<br/>X.509 issuance complete"]
    CRL2["CRL/OCSP<br/>Manages revocation status"]

    U --> RA2
    RA2 --> CA2
    CA2 --> CERT
    CERT --> U
    CA2 --> CRL2

    style U fill:#FFF3E0,stroke:#F57C00,color:#000
    style RA2 fill:#E3F2FD,stroke:#1976D2,color:#000
    style CA2 fill:#1E3A5F,stroke:#1E3A5F,color:#fff
    style CERT fill:#E8F5E9,stroke:#388E3C,color:#000
    style CRL2 fill:#FFEBEE,stroke:#D32F2F,color:#000
```

| Revocation method | Timeliness | Traffic load | Key drawback |
|---|---|---|---|
| **CRL** | Low (periodic distribution) | Medium (file download) | Stale data, file grows large |
| **OCSP** | High (on-request lookup) | High (concentrated on CA server) | Depends on CA availability, exposes privacy |
| **OCSP Stapling** | High (server provides cached response) | Low (server attaches the response) | Timeliness can degrade when the cache expires |

---

## 3. Expected Benefits and Practical Applications of Adopting PKI

| Category | Key benefits | Use and practical application |
|---|---|---|
| **Security** | Public-key-based identity verification blocks tampering and impersonation at the source | Issue TLS certificates, apply S/MIME email signing and encryption |
| **Trustworthiness** | The CA hierarchy establishes a verifiable chain of trust | Build a private CA in-house, operate code-signing certificates |
| **Operational efficiency** | CRL and OCSP Stapling automate revocation status management | Automate certificate expiry monitoring, auto-renew via the ACME protocol |
| **Regulatory compliance** | Meets legal requirements such as the Digital Signature Act and personal data protection law | Link to e-government accredited certification, apply public key infrastructure in finance |
