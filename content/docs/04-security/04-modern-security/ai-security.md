---
title: AI and Security
description: SOAR and adaptive security AI, evasion, poisoning, extraction, and inversion adversarial attacks, and LLM prompt injection defense
type: docs
weight: 3
---

## 1. Strengthening Security with AI While Defending the AI Model Itself — Overview of AI and Security

```mermaid
%%{init: { 'theme': 'base', 'themeVariables': { 'edgeLabelBackground': '#fff' }}}%%
flowchart LR
    A["Rapid rise in security threats<br/>limits of detection and response"] --"AI/ML automation<br/>SOAR playbooks"--> B["Intelligent threat detection<br/>automated response"] --"Protect AI models<br/>defend against adversarial attacks"--> C["Strengthened security capability<br/>AI trustworthiness secured"]
    style A fill:#FFEBEE,stroke:#D32F2F,color:#000
    style B fill:#E3F2FD,stroke:#1976D2,color:#000
    style C fill:#E8F5E9,stroke:#388E3C,color:#000
```

**Definition**: A two-way security framework that uses AI/ML for security detection and automated response (defensive AI) while also protecting the AI model itself from adversarial attacks.
- SOAR and UEBA automatically classify and respond to large volumes of security events, maximizing SOC operational efficiency.
- Adversarial attacks (evasion, poisoning, extraction, inversion) manipulate an AI model's judgment or steal its training data.
- As LLMs spread, security threats unique to generative AI, such as prompt injection and RAG poisoning, are emerging.

**Characteristics**:
- **Automated Response**: SOAR playbook-based automation of repetitive responses shortens mean time to detect and respond (MTTD/MTTR).
- **Behavioral Analysis**: UEBA uses ML to detect abnormal user and device behavior patterns, catching zero-day and insider threats early.
- **AI Trustworthiness**: Adversarial defense techniques (input validation, differential privacy, model watermarking) guarantee AI model integrity.

---

## 2. Core Structure of AI and Security

### A. AI-Driven Security (Defensive Perspective)

```mermaid
%%{init: { 'theme': 'base', 'themeVariables': { 'edgeLabelBackground': '#fff' }}}%%
flowchart LR
    EVT["Security events<br/>logs, alerts"] --"Collect, correlate<br/>analyze"--> SIEM["SIEM<br/>event detection,<br/>alert generation"]
    SIEM --"Forward alert"--> SOAR["SOAR<br/>Playbook<br/>automatic execution"]
    SOAR --"Auto block"--> ACT["Response action<br/>isolate, block, notify"]
    ACT --"Learn from results"--> SIEM
    style EVT fill:#FFEBEE,stroke:#D32F2F,color:#000
    style SIEM fill:#E3F2FD,stroke:#1976D2,color:#000
    style SOAR fill:#1E3A5F,stroke:#1E3A5F,color:#fff
    style ACT fill:#E8F5E9,stroke:#388E3C,color:#000
```

| Category | SIEM | SOAR |
|---|---|---|
| **Function** | Log collection, correlation analysis, alert generation | Alert classification, playbook-based automated response |
| **Automation** | Rule-based alerting, manual response | Automates repetitive tasks: ticketing, isolation, blocking |
| **Response Method** | Manual handling after analyst judgment | Automatic handling within seconds via playbook execution |
| **Use** | Threat intelligence integration, audit logs | SOC operational efficiency, shortened MTTD/MTTR |

---

### B. Attacks on AI Models and LLM Security

```mermaid
%%{init: { 'theme': 'base', 'themeVariables': { 'edgeLabelBackground': '#fff' }}}%%
flowchart TD
    ROOT["AI Model Attacks"]
    TRAIN["Training-Stage Attacks"]
    INFER["Inference-Stage Attacks"]
    ROOT --> TRAIN
    ROOT --> INFER
    TRAIN --> P["Poisoning Attack<br/>training data contamination"]
    TRAIN --> INV["Model Inversion<br/>infers training data from output"]
    INFER --> E["Evasion Attack<br/>adds noise to induce misclassification"]
    INFER --> EX["Extraction Attack<br/>clones model via repeated queries"]
    INFER --> PI["Prompt Injection<br/>bypasses LLM instructions"]
    style ROOT fill:#1E3A5F,stroke:#1E3A5F,color:#fff
    style TRAIN fill:#FFEBEE,stroke:#D32F2F,color:#000
    style INFER fill:#FFEBEE,stroke:#D32F2F,color:#000
    style P fill:#FFF3E0,stroke:#F57C00,color:#000
    style INV fill:#FFF3E0,stroke:#F57C00,color:#000
    style E fill:#F3E5F5,stroke:#7B1FA2,color:#000
    style EX fill:#F3E5F5,stroke:#7B1FA2,color:#000
    style PI fill:#E3F2FD,stroke:#1976D2,color:#000
```

| Attack Type | Timing | Target | Goal | Defense Method |
|---|---|---|---|---|
| **Evasion** | Inference stage | Input data | Induce misclassification with subtle noise | Input validation, adversarial training |
| **Poisoning** | Training stage | Training dataset | Insert model bias or a backdoor | Data integrity verification, cleansing |
| **Extraction** | Inference stage | Model API | Clone the model via repeated queries | Query throttling, output noise addition |
| **Inversion** | Inference stage | Model output | Infer training data from output | Differential privacy, output restriction |

---

## 3. Expected Benefits and Practical Applications of AI and Security

| Category | Key Benefit | Practical Application |
|---|---|---|
| **Advanced Detection** | ML-based anomaly detection catches zero-day and unknown threats early | Adopt UEBA, apply ML analysis to network traffic, integrate NDR solutions |
| **Response Automation** | SOAR playbooks cut MTTD/MTTR from tens of minutes to seconds | Automate repetitive SOC tasks, integrate SIEM-SOAR ticketing |
| **AI Model Security** | Adversarial defense secures the trustworthiness and integrity of AI-based security systems | Apply adversarial training, differential privacy, model watermarking |
| **LLM Governance** | Countering prompt injection and RAG poisoning keeps generative AI services running safely | Apply input filtering and output validation, review against the OWASP LLM Top 10 |
