---
title: Asymmetric Cryptography
description: The mathematical principles behind RSA, Diffie-Hellman, and ECC, and the structure of hybrid symmetric+asymmetric cryptosystems
type: docs
weight: 2
---

## 1. Overview of Asymmetric Cryptography — Solving the Key Distribution Problem with Public/Private Key Pairs

```mermaid
%%{init: { 'theme': 'base', 'themeVariables': { 'edgeLabelBackground': '#fff' }}}%%
flowchart LR
    A["Key distribution problem<br/>Can't deliver a secret key safely"] --"Generate a mathematically<br/>linked public/private pair"--> B["Asymmetric cryptography<br/>RSA, ECC, DH"] --"Guarantees confidentiality,<br/>authentication, non-repudiation"--> C["Trusted communication established<br/>Built on PKI/TLS"]
    style A fill:#FFEBEE,stroke:#D32F2F,color:#000
    style B fill:#E3F2FD,stroke:#1976D2,color:#000
    style C fill:#E8F5E9,stroke:#388E3C,color:#000
```

**Definition**: An encryption scheme that uses a mathematically linked public/private key pair to solve the key distribution problem and guarantee confidentiality, authentication, and non-repudiation.
- An asymmetric structure: the public key is shared with anyone, while only the owner holds the private key
- Built on hard mathematical problems: RSA (integer factorization), DH (discrete logarithm), ECC (elliptic-curve discrete logarithm)
- Slower than symmetric encryption, so it is mainly used for key exchange, digital signatures, and authentication rather than encrypting bulk data

**Characteristics**:
- **Solves key distribution**: Sharing the public key in advance lets a secure communication session be established without a separate secret channel
- **Multi-purpose security properties**: Encryption (public key → private key) and signing (private key → public key) run in opposite directions, together supporting both confidentiality and non-repudiation
- **Mathematical security**: Relies on the computational complexity of factorization and discrete-logarithm problems; migration to PQC is underway to address the quantum-computing threat

---

## 2. Core Structure of Asymmetric Cryptography

### A. Principles and Comparison of the RSA, DH, and ECC Algorithms

```mermaid
%%{init: { 'theme': 'base', 'themeVariables': { 'edgeLabelBackground': '#fff' }}}%%
flowchart LR
    S["Sender<br/>Obtains public key (e,n)"] --"Plaintext M<br/>C = M^e mod n"--> E["Ciphertext C<br/>Public-key encryption"] --"C^d mod n<br/>Private-key (d,n) decryption"--> R["Original text recovered<br/>Using the recipient's private key"]
    style S fill:#FFEBEE,stroke:#D32F2F,color:#000
    style E fill:#1E3A5F,stroke:#1E3A5F,color:#fff
    style R fill:#E8F5E9,stroke:#388E3C,color:#000
```

| Algorithm | Mathematical Basis | Main Use | Recommended Key Length | Performance |
|---|---|---|---|---|
| **RSA** | Difficulty of integer factorization | Encryption, digital signatures, key exchange | 2048 / 4096 bits | Slow, general-purpose standard |
| **DH / ECDH** | Discrete logarithm problem | Key exchange only (not encryption) | DH 2048 bits, ECDH 256 bits | Medium, used for TLS session-key exchange |
| **ECC / ECDSA** | Elliptic-curve discrete logarithm | Digital signatures, key exchange | 256 bits (equivalent to RSA 3072 bits) | Fast, well suited to mobile/IoT |

---

### B. The Structure of a Hybrid Cryptosystem

```mermaid
%%{init: { 'theme': 'base', 'themeVariables': { 'edgeLabelBackground': '#fff' }}}%%
flowchart TD
    A["Generate session key<br/>Random AES-256 symmetric key"] --> B["Encrypt the session key<br/>With the recipient's public key (RSA/ECDH)"]
    A --> C["Encrypt the data<br/>AES-encrypt with the session key"]
    B --> D["Encrypted session key<br/>Sent"]
    C --> E["Encrypted data<br/>Sent"]
    D --> F["Decrypt the session key<br/>With the recipient's private key"]
    F --> G["Decrypt the data<br/>AES-decrypt with the recovered session key"]
    E --> G
    style A fill:#E3F2FD,stroke:#1976D2,color:#000
    style B fill:#F3E5F5,stroke:#7B1FA2,color:#000
    style C fill:#F3E5F5,stroke:#7B1FA2,color:#000
    style D fill:#FFF3E0,stroke:#F57C00,color:#000
    style E fill:#FFF3E0,stroke:#F57C00,color:#000
    style F fill:#1E3A5F,stroke:#1E3A5F,color:#fff
    style G fill:#E8F5E9,stroke:#388E3C,color:#000
```

| Comparison | Symmetric Cryptography | Asymmetric Cryptography |
|---|---|---|
| **Number of keys** | Needs a separate secret key for every communicating pair | One public/private key pair supports communication with many parties |
| **Speed** | Very fast (AES: several Gbps) | Slow (RSA: on the order of a few Kbps) |
| **Key distribution** | Needs a separate secure channel to deliver the key | Solves key distribution by publishing the public key |
| **Use** | Encrypting bulk data | Key exchange, digital signatures, certificates |
| **Representative examples** | AES, SEED, ARIA, LEA | RSA, ECC, DH, ECDSA |

---

## 3. Expected Benefits and Practical Applications of Adopting Asymmetric Cryptography

| Category | Key Benefits | Practical Applications |
|---|---|---|
| **Key management** | Establishes a secure communication session just by distributing the public key, eliminating key-delivery risk | Build a PKI-based public key infrastructure, secure forward secrecy with TLS 1.3 ECDHE |
| **Authentication and signing** | Proves identity and secures legally valid non-repudiation through private-key signing | ECDSA signing for e-contracts and e-invoices, code-signing certificates |
| **Hybrid optimization** | Exchanges a session key with RSA/ECDH, then handles data with AES, balancing performance and security | Apply a hybrid structure across HTTPS, SSH, and VPN alike; use JWT RS256 for API authentication |
| **Preparing for the future** | Migrating to ECC shortens key length relative to RSA, laying the groundwork for a PQC transition | Evaluate NIST PQC standards (CRYSTALS-Kyber) in parallel, protect keys with an HSM |
