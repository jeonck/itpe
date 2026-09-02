---
title: User Authentication Technology
description: The 4 authentication factors (knowledge, possession, inherence, behavior), MFA, FIDO, Passkey, integrated authentication via SSO, OAuth 2.0, OIDC, and SAML
type: docs
weight: 5
---

## 1. Strengthening Identity Verification with Multi-Factor, Biometric, and Integrated Authentication: Overview of User Authentication Technology

```mermaid
%%{init: { 'theme': 'base', 'themeVariables': { 'edgeLabelBackground': '#fff' }}}%%
flowchart LR
    A["Single password<br/>Vulnerable to phishing, credential theft"] --"MFA, FIDO2,<br/>integrated authentication"--> B["Multi-factor authentication<br/>SSO, OAuth, OIDC, SAML"] --"Stronger identity,<br/>better usability"--> C["Zero Trust based<br/>secure integrated access"]
    style A fill:#FFEBEE,stroke:#D32F2F,color:#000
    style B fill:#E3F2FD,stroke:#1976D2,color:#000
    style C fill:#E8F5E9,stroke:#388E3C,color:#000
```

**Definition**: An authentication technology framework that verifies a user's identity using one or a combination of 4 factors: knowledge, possession, inherence, and behavior.
- MFA combines 2 or more authentication factors so security holds even if a single factor is stolen
- FIDO2/WebAuthn and Passkey provide passwordless authentication that blocks phishing attacks at the source
- OAuth 2.0, OIDC, and SAML standardize identity federation and authorization delegation across multi-service environments

**Characteristics**:
- **Multi-factor combination**: combining knowledge, possession, and biometric factors protects the account even if a single factor is compromised
- **Password elimination**: FIDO2 and Passkey authenticate via an on-device private key, making phishing and replay attacks impossible
- **Federated authentication**: SSO, OIDC, and SAML let a single authentication grant access to multiple services, improving user experience

---

## 2. Core Structure of User Authentication Technology

### A. The 4 Authentication Factors, MFA, FIDO2/Passkey

```mermaid
%%{init: { 'theme': 'base', 'themeVariables': { 'edgeLabelBackground': '#fff' }}}%%
flowchart LR
    SRV["Server<br/>Sends challenge"]
    DEV["Authenticator device<br/>Signs with private key"]
    VRF["Server verification<br/>Confirms signature with public key"]
    OK["Authentication succeeds<br/>Session issued"]

    SRV --> DEV
    DEV --> VRF
    VRF --> OK

    style SRV fill:#E3F2FD,stroke:#1976D2,color:#000
    style DEV fill:#1E3A5F,stroke:#1E3A5F,color:#fff
    style VRF fill:#FFF3E0,stroke:#F57C00,color:#000
    style OK fill:#E8F5E9,stroke:#388E3C,color:#000
```

| Authentication factor | Example | Advantages | Limitations |
|---|---|---|---|
| **Knowledge (Know)** | Password, PIN, security question | Simple to implement, minimal cost | Vulnerable to phishing, brute force |
| **Possession (Have)** | OTP, smart card, security token | Requires physical theft, stronger security | Inaccessible if lost or stolen |
| **Inherence (Are)** | Fingerprint, iris, face, vein recognition | Hard to replicate, good usability | Biometric data cannot be changed, privacy concerns |
| **Behavior (Do)** | Signature pattern, gait, typing rhythm | Enables continuous authentication | Sensitive to environmental change, accuracy varies |

---

### B. Integrated Authentication (SSO, OAuth 2.0, OIDC, SAML)

```mermaid
%%{init: { 'theme': 'base', 'themeVariables': { 'edgeLabelBackground': '#fff' }}}%%
flowchart LR
    USER["User<br/>Requests authorization"]
    AS["Authorization server<br/>Issues authorization code"]
    CB["Client<br/>Exchanges code for token"]
    RS["Resource server<br/>Validates access token"]
    DATA["Protected resource<br/>Returns response"]

    USER --> AS
    AS --> CB
    CB --> RS
    RS --> DATA

    style USER fill:#FFF3E0,stroke:#F57C00,color:#000
    style AS fill:#1E3A5F,stroke:#1E3A5F,color:#fff
    style CB fill:#E3F2FD,stroke:#1976D2,color:#000
    style RS fill:#F3E5F5,stroke:#7B1FA2,color:#000
    style DATA fill:#E8F5E9,stroke:#388E3C,color:#000
```

| Protocol | Purpose | Format | Usage environment | Key characteristics |
|---|---|---|---|---|
| **SSO** | Single authentication, multiple services | Session/token based | Enterprise internal portal | Central authentication, better UX |
| **OAuth 2.0** | Authorization delegation, resource access | Access token (Bearer) | Social login, API | No identity authentication, delegation only |
| **OIDC** | Identity authentication + authorization delegation | JWT (ID token) | Web/mobile services | Layer on top of OAuth 2.0, standard claims |
| **SAML 2.0** | Enterprise federated authentication (SSO) | XML assertion | Enterprise, education, public sector | IdP/SP federation, strong legacy compatibility |

---

## 3. Expected Benefits and Practical Applications of Adopting User Authentication Technology

| Category | Key benefits | Use and practical application |
|---|---|---|
| **Security** | MFA and FIDO2 sharply reduce credential-based attacks | Mandate MFA for admin accounts, move to passwordless with Passkey |
| **Usability** | SSO and OIDC allow smooth access to multiple services after a single login | Build SSO integrated with Azure AD/Okta, improve employee experience |
| **Standardization** | OAuth 2.0, OIDC, and SAML unify authentication across heterogeneous systems | Run a unified IdP across in-house SaaS and on-premises systems, standardize API security |
| **Regulatory compliance** | Meets authentication requirements under electronic financial supervision regulations and personal data protection law | Mandate 2FA for financial services, apply FIDO authentication for public-sector integration |
