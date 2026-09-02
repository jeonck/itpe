---
title: Web Application Vulnerabilities (OWASP)
description: How SQL Injection, XSS, and CSRF attacks work under the OWASP Top 10, how to detect them, and defenses such as Prepared Statement and CSRF Token
type: docs
weight: 1
---

## 1. Common Web Application Vulnerabilities and Defenses: Overview of OWASP

```mermaid
%%{init: { 'theme': 'base', 'themeVariables': { 'edgeLabelBackground': '#fff' }}}%%
flowchart LR
    A["No input validation<br/>No trust boundary"] --"Attacker malicious input<br/>Query, script injection"--> B["OWASP Top 10<br/>Vulnerability exploited"] --"Apply Prepared Statement,<br/>CSRF Token, CSP"--> C["Secure web service<br/>Data, session protected"]
    style A fill:#FFEBEE,stroke:#D32F2F,color:#000
    style B fill:#E3F2FD,stroke:#1976D2,color:#000
    style C fill:#E8F5E9,stroke:#388E3C,color:#000
```

**Definition**: An OWASP-based vulnerability management framework that categorizes web application flaws in input handling, authentication, and access control, and lays out both how each attack works and how to defend against it.
- OWASP (Open Web Application Security Project) updates its Top 10 vulnerability list every 3 to 4 years, and it is used as an international standard
- SQL Injection, XSS, and CSRF are the 3 core vulnerabilities, high in both frequency and impact, and mandatory exam topics
- Defense rests on 4 pillars: input validation, output encoding, session management, and token-based verification

**Characteristics**:
- **Risk-based classification**: the Top 10 is selected by combining CVSS scores with actual exploitation frequency, so it can be used directly to set security priorities
- **Dual attack/defense perspective**: each vulnerability is presented symmetrically, covering both how the attack works and what defends against it
- **Integrated across the development lifecycle**: provides a layered defense that can be applied at the coding standard, framework configuration, and server configuration levels

---

## 2. Core Structure of OWASP Web Vulnerabilities

### A. OWASP Top 10 (2021) and SQL Injection

```mermaid
%%{init: { 'theme': 'base', 'themeVariables': { 'edgeLabelBackground': '#fff' }}}%%
flowchart LR
    U["Attacker<br/>Malicious input"] --> Q["SQL query manipulated<br/>Input inserted directly"]
    Q --> D1["Error-based<br/>Exposes DB structure"]
    Q --> D2["Union-based<br/>Extracts data"]
    Q --> D3["Blind<br/>Boolean/Time"]
    D1 --> R["DB access<br/>Data stolen, altered, deleted"]
    D2 --> R
    D3 --> R
    style U fill:#FFEBEE,stroke:#D32F2F,color:#000
    style Q fill:#FFF3E0,stroke:#F57C00,color:#000
    style D1 fill:#F3E5F5,stroke:#7B1FA2,color:#000
    style D2 fill:#F3E5F5,stroke:#7B1FA2,color:#000
    style D3 fill:#F3E5F5,stroke:#7B1FA2,color:#000
    style R fill:#E3F2FD,stroke:#1976D2,color:#000
```

| Type | Mechanism | Detection method | Countermeasure |
|---|---|---|---|
| **Error-based** | Deliberately triggers a syntax error to extract structure from DB error messages | Monitor abnormal error responses, error messages | Hide error messages, use Prepared Statement |
| **Union-based** | Uses UNION SELECT to merge another table's data into the result | Detect a mismatched column count, extra data | Whitelist input validation, use an ORM |
| **Blind** | Infers data from true/false response differences or response delay | Detect repeated request patterns, abnormal response time | Parameter binding, least-privilege DB account |

**Key items in the OWASP Top 10 (2021)**

| Rank | Item | Main vulnerability types |
|---|---|---|
| A01 | Broken Access Control | Horizontal/vertical privilege escalation, IDOR |
| A02 | Cryptographic Failures | Plaintext transmission, weak encryption algorithms |
| A03 | Injection | SQL, OS, LDAP injection |
| A05 | Security Misconfiguration | Default accounts, unnecessary features enabled |
| A07 | Identification & Authentication Failures | Session fixation, brute force |
| A10 | SSRF | Server-side request forgery |

---

### B. XSS and CSRF

```mermaid
%%{init: { 'theme': 'base', 'themeVariables': { 'edgeLabelBackground': '#fff' }}}%%
flowchart TD
    ATK["Attacker<br/>Writes malicious script"] --> DB["Server DB<br/>Script stored"]
    DB --> SRV["Web server<br/>Script included in response"]
    SRV --> VIC["Victim's browser<br/>Script executes"]
    VIC --> STEAL["Cookie, session stolen<br/>Account takeover"]
    style ATK fill:#FFEBEE,stroke:#D32F2F,color:#000
    style DB fill:#FFF3E0,stroke:#F57C00,color:#000
    style SRV fill:#F3E5F5,stroke:#7B1FA2,color:#000
    style VIC fill:#E3F2FD,stroke:#1976D2,color:#000
    style STEAL fill:#1E3A5F,stroke:#1E3A5F,color:#fff
```

| XSS type | Where stored | When it runs | Severity | Defense |
|---|---|---|---|---|
| **Stored XSS** | Persisted in the DB | When the victim visits the page | Highest | HTML encoding, input validation, CSP |
| **Reflected XSS** | URL parameter | Immediately on clicking a malicious link | Medium | Output encoding, escape user input |
| **DOM-based XSS** | DOM manipulation (server not involved) | When client-side script runs | Medium | Use textContent instead of innerHTML |

| Category | XSS | CSRF |
|---|---|---|
| **Attack goal** | Run a script in the victim's browser | Execute an unintended request using the victim's session |
| **Resource exploited** | The victim's browser DOM | The victim's authenticated session/cookie |
| **Core defense** | Output encoding, CSP | CSRF Token, SameSite cookie (Strict/Lax), Referer validation |

---

## 3. Expected Benefits and Practical Applications of Defending Against OWASP Web Vulnerabilities

| Category | Key benefits | Use and practical application |
|---|---|---|
| **Security** | Blocking SQL Injection, XSS, and CSRF removes the risk of data leaks and session theft | Adopt Prepared Statement everywhere, standardize an HTML encoding library, apply a common CSRF Token filter |
| **Regulatory compliance** | Addressing the OWASP Top 10 meets the technical safeguard requirements of personal data protection law and ISMS-P | Run an OWASP-based vulnerability assessment at least once a year, feed results back into development guidelines |
| **Development quality** | Removing security flaws early in coding cuts the cost of patching in production | Fold OWASP items into the code review checklist, integrate SAST tools into the CI/CD pipeline |
| **Response capability** | Detection rules built on an understanding of attack mechanics improve WAF/IDS detection accuracy | Keep WAF SQL Injection/XSS signatures current, verify defense effectiveness with penetration testing |
