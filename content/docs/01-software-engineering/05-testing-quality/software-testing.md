---
title: Software Testing
description: Systematic verification techniques that catch defects early and assure quality
type: docs
weight: 40
---

## I. Overview of Software Testing, Assuring Quality by Catching Defects Early

```mermaid
%%{init: { 'theme': 'base', 'themeVariables': { 'edgeLabelBackground': '#fff' }}}%%
flowchart LR
    A["Risk of hidden defects<br/>Production outages, cost blowout"] --"Systematic<br/>verification"--> B["Software testing<br/>Verification on 7 principles"] --"Quality confidence<br/>secured"--> C["A reliable product<br/>meeting user needs"]
    style A fill:#FFEBEE,stroke:#D32F2F,color:#000
    style B fill:#E3F2FD,stroke:#1976D2,color:#000
    style C fill:#E8F5E9,stroke:#388E3C,color:#000
```

**Definition**:  
A verification activity using specification-based, structure-based, and experience-based techniques to catch defects early and assure software quality  
- Testing proves the presence of defects; it can never fully prove their absence  
- A comprehensive quality activity that covers both verification and validation  
- The V-model defines a corresponding test stage for each development stage  

**Characteristics**:  
( **Defect clustering** ) Applies the pesticide paradox: defects concentrate in a small number of modules  
( **Context dependency** ) Test technique and intensity vary by domain, risk level, and standard  
( **Absence-of-errors fallacy** ) Zero defects does not guarantee that user needs are met  

---

## II. Core Structure of Software Testing

### A. Black-Box vs. White-Box Testing Techniques

```mermaid
%%{init: { 'theme': 'base', 'themeVariables': { 'edgeLabelBackground': '#fff' }}}%%
flowchart TD
    ROOT["Software Testing Techniques"]
    ROOT --> BB["Black-box testing<br/>Specification-based"]
    ROOT --> WB["White-box testing<br/>Structure-based"]

    BB --> EP["Equivalence Partitioning"]
    BB --> BVA["Boundary Value Analysis"]
    BB --> CEG["Cause-Effect Graph"]
    BB --> ST["State transition testing<br/>State Transition"]

    WB --> SC["Statement Coverage"]
    WB --> DC["Decision Coverage"]
    WB --> CC["Condition Coverage"]
    WB --> MC["MC/DC coverage<br/>DO-178C required"]
    WB --> PC["Path Coverage"]

    style ROOT fill:#1E3A5F,stroke:#1E3A5F,color:#fff
    style BB fill:#E3F2FD,stroke:#1976D2,color:#000
    style WB fill:#F3E5F5,stroke:#7B1FA2,color:#000
    style EP fill:#E3F2FD,stroke:#1976D2,color:#000
    style BVA fill:#E3F2FD,stroke:#1976D2,color:#000
    style CEG fill:#E3F2FD,stroke:#1976D2,color:#000
    style ST fill:#E3F2FD,stroke:#1976D2,color:#000
    style SC fill:#F3E5F5,stroke:#7B1FA2,color:#000
    style DC fill:#F3E5F5,stroke:#7B1FA2,color:#000
    style CC fill:#F3E5F5,stroke:#7B1FA2,color:#000
    style MC fill:#FFF3E0,stroke:#F57C00,color:#000
    style PC fill:#FFEBEE,stroke:#D32F2F,color:#000
```

| Coverage type | Measurement basis | Intensity level | Applicable standard/context |
|---|---|---|---|
| Statement coverage | Statements executed / total statements | Level 1 (lowest) | General commercial software |
| Decision (Branch) coverage | Whether both true/false branches execute | Level 2 | DO-178C Level D, IEC 62304 |
| Condition coverage | Whether each condition executes true/false | Level 3 | Systems requiring security and reliability |
| MC/DC coverage | Each condition independently affects the decision | Level 4 (high) | DO-178C Level A/B, aviation, rail |
| Multiple condition coverage | Whether every condition combination executes | Level 5 | Nuclear, medical devices (extreme risk) |
| Path coverage | Every possible execution path | Level 6 (highest) | Theoretical completeness (impractical) |

---

### B. V-Model Test Stages and Static Testing

```mermaid
%%{init: { 'theme': 'base', 'themeVariables': { 'edgeLabelBackground': '#fff' }}}%%
flowchart LR
    UT["Unit Test<br/>Module/function level"] --> IT["Integration Test<br/>Bottom-up/top-down/big bang/backbone"]
    IT --> ST["System Test<br/>Functionality, performance, security, usability"]
    ST --> AT["Acceptance Test<br/>Alpha/beta"]

    style UT fill:#E3F2FD,stroke:#1976D2,color:#000
    style IT fill:#F3E5F5,stroke:#7B1FA2,color:#000
    style ST fill:#FFF3E0,stroke:#F57C00,color:#000
    style AT fill:#E8F5E9,stroke:#388E3C,color:#000
```

| Technique | Formality | How it proceeds | Key participants | Deliverables | Cost |
|---|---|---|---|---|---|
| **Inspection** | Very high | Formal review with role-based checklists | Author, reviewers (multiple), moderator, scribe | Defect list, inspection report | High |
| **Walkthrough** | Medium | Author directly explains and demonstrates | Author, peer reviewers (2-5) | Issue list, improvement notes | Medium |
| **Review** | Low | Informal exchange of opinions and feedback | Author, 1-2 peers | Review comments (unstructured) | Low |
| **Static analysis** | Automated | Tool-based automatic code analysis | Developer, QA engineer | Static analysis report | Very low |
| **Unit test** | High | Automatically run via an xUnit framework | Developer | Test result report | Medium |
| **Regression test** | High | Automated re-verification of existing functions after a change | QA, CI/CD pipeline | Regression test report | Medium |

---

## III. Expected Benefits and Practical Applications of Adopting Software Testing

| Category | Key benefits | Use and practical application |
|---|---|---|
| **Quality assurance** | Catches defects at an early stage, minimizing fix cost | Build a staged test plan based on the V-model; run unit, integration, and system tests in sequence |
| **Risk management** | MC/DC and boundary value analysis prevent defects in high-risk functions | Apply risk-based testing; concentrate coverage on core modules |
| **Automation efficiency** | Regression test automation cuts repeated-verification cost and integrates with CI/CD | Adopt automation tools such as xUnit, Selenium, and JMeter; insert test gates into the build pipeline |
| **Compliance** | Establishes evidence of compliance with safety standards such as DO-178C and IEC 62304 | Generate coverage measurement reports; keep formal review records based on the inspection checklist |
