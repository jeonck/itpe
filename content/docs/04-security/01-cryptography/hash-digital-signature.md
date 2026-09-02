---
title: Hash Functions and Digital Signatures
description: Collision resistance in SHA-2/SHA-3 hash functions, HMAC message authentication, and the non-repudiation principle behind digital signatures
type: docs
weight: 3
---

## 1. Guaranteeing Integrity and Non-repudiation with One-way Hashing and Signatures: Overview of Hash Functions and Digital Signatures

```mermaid
%%{init: { 'theme': 'base', 'themeVariables': { 'edgeLabelBackground': '#fff' }}}%%
flowchart LR
    A["Tampering threat<br/>Cannot verify data integrity"] --"One-way hashing,<br/>private key signing"--> B["Hash function, digital signature<br/>SHA-2, ECDSA"] --"Integrity, authentication,<br/>non-repudiation achieved"--> C["Trusted data communication<br/>Legal validity secured"]
    style A fill:#FFEBEE,stroke:#D32F2F,color:#000
    style B fill:#E3F2FD,stroke:#1976D2,color:#000
    style C fill:#E8F5E9,stroke:#388E3C,color:#000
```

**Definition**: A one-way function that converts an input of arbitrary length into a fixed-length digest, a cryptographic technique that guarantees data integrity, authentication, and non-repudiation.
- A hash function has three core properties: it cannot be inverted, the same input always yields the same output, and it resists collisions
- HMAC combines a hash function with a secret key to guarantee integrity and authentication at the same time
- A digital signature encrypts a hash value with a private key, providing legal non-repudiation

**Characteristics**:
- **One-way**: the original text cannot be recovered from the digest, used for password storage and file integrity verification
- **Collision resistance**: finding two inputs that produce the same digest must be computationally infeasible
- **Legal non-repudiation**: under the Digital Signature Act, an accredited digital signature carries the same legal validity as a handwritten signature

---

## 2. Core Structure of Hash Functions and Digital Signatures

### A. Hash Function Structure and MAC/HMAC

```mermaid
%%{init: { 'theme': 'base', 'themeVariables': { 'edgeLabelBackground': '#fff' }}}%%
flowchart LR
    M["Original message<br/>Arbitrary length"] --> P["Padding<br/>Aligned to block size"]
    P --> H["Hash function<br/>SHA-256 compression"]
    H --> D["Digest<br/>256-bit fixed output"]
    K["Secret key<br/>HMAC only"] --> H
    style M fill:#FFEBEE,stroke:#D32F2F,color:#000
    style P fill:#FFF3E0,stroke:#F57C00,color:#000
    style H fill:#1E3A5F,stroke:#1E3A5F,color:#fff
    style D fill:#E8F5E9,stroke:#388E3C,color:#000
    style K fill:#F3E5F5,stroke:#7B1FA2,color:#000
```

| Algorithm | Output length | Security strength | Collision status | Primary use |
|---|---|---|---|---|
| **MD5** | 128 bits | Weak | Collisions found | Legacy, checksum only (not for security use) |
| **SHA-1** | 160 bits | Weak | Collisions found | Older TLS, code signing (being phased out) |
| **SHA-2** | 256/384/512 bits | Strong | None found | TLS 1.3, JWT, digital signatures, file integrity |
| **SHA-3** | 224/256/384/512 bits | Very strong | None found | Next-generation standard, Keccak sponge construction |

---

### B. Digital Signature Generation and Verification Mechanism

```mermaid
%%{init: { 'theme': 'base', 'themeVariables': { 'edgeLabelBackground': '#fff' }}}%%
flowchart LR
    subgraph SG["Signer side"]
        direction LR
        A["Original document"] --> B["SHA-256<br/>Generates hash"]
        B --> C["Private key encryption<br/>Generates signature value"]
        C --> D["Attach signature<br/>Send"]
    end
    subgraph VG["Verifier side"]
        direction LR
        E["Received document"] --> F["SHA-256<br/>Recomputes hash"]
        D --> G["Public key decryption<br/>Extracts signature value"]
        G --> H{"Compare<br/>hash match"}
        F --> H
        H --> I["Verification succeeds<br/>Integrity, authentication confirmed"]
    end
    style SG fill:#E3F2FD,stroke:#1976D2,color:#000
    style VG fill:#E8F5E9,stroke:#388E3C,color:#000
    style A fill:#FFEBEE,stroke:#D32F2F,color:#000
    style C fill:#1E3A5F,stroke:#1E3A5F,color:#fff
    style G fill:#1E3A5F,stroke:#1E3A5F,color:#fff
    style I fill:#E8F5E9,stroke:#388E3C,color:#000
```

| Security property | How it's guaranteed | Applied mechanism |
|---|---|---|
| **Integrity** | A hash mismatch detects tampering | Recipient recomputes SHA-256 and compares it against the decrypted signature hash |
| **Authentication** | A public key certificate confirms the signer's identity | A CA-issued X.509 certificate proves the identity of the public key owner |
| **Non-repudiation** | Only the private key holder can generate the signature | A TSA (Time Stamp Authority) timestamp reinforces proof of signing time |

---

## 3. Expected Benefits and Practical Applications of Adopting Hash Functions and Digital Signatures

| Category | Key benefits | Use and practical application |
|---|---|---|
| **Data integrity** | SHA-256 hash comparison detects file/message tampering instantly | Software distribution checksum verification, integrity guarantees for blockchain transactions |
| **Stronger authentication** | HMAC guarantees message authentication and integrity together | HMAC-SHA256 for API authentication, TLS MAC, JWT HS256 signing |
| **Legal non-repudiation** | Accredited digital signatures under the Digital Signature Act prevent contract disputes | ECDSA signing for electronic contracts, e-tax invoices, and public electronic documents |
| **Algorithm modernization** | Retiring MD5/SHA-1 in favor of SHA-2/SHA-3 blocks collision attacks | Mandate SHA-256 for TLS certificates, migrate code-signing policy to SHA-2 |
