---
title: RAG, Fine-Tuning, and Prompt Engineering
description: RAG (hallucination mitigation, vector search), PEFT/LoRA fine-tuning, Few-Shot, CoT, ReAct prompting techniques
type: docs
weight: 3
---

## 1. Overview of RAG and Fine-Tuning, Which Resolve Hallucination in Real Time Through Vector Search

```mermaid
%%{init: { 'theme': 'base', 'themeVariables': { 'edgeLabelBackground': '#fff' }}}%%
flowchart LR
    A["LLM hallucination problem<br/>Knowledge cutoff, wrong answers"] --"Vector search,<br/>context injection"--> B["RAG, fine-tuning adopted<br/>Improved accuracy, adaptability"] --"Reliable<br/>response generation"--> C["Domain-specific AI<br/>Trusted in practice"]
    style A fill:#FFEBEE,stroke:#D32F2F,color:#000
    style B fill:#E3F2FD,stroke:#1976D2,color:#000
    style C fill:#E8F5E9,stroke:#388E3C,color:#000
```

**Definition**: An LLM enhancement technique that suppresses hallucination and generates domain-fit responses through external knowledge-base retrieval (RAG) or parameter updates (fine-tuning).
- LLMs hallucinate frequently on recent or specialized knowledge outside the pretraining data's scope
- RAG injects real-time context through vector-DB search without retraining, improving response reliability
- Fine-tuning adapts the model to a specific task or style with lightweight techniques such as PEFT and LoRA

**Characteristics**:
- **Knowledge freshness**: RAG can reflect the latest information just by updating the search index, without retraining
- **Parameter efficiency**: LoRA trains under 1% of total parameters, cutting GPU memory and time sharply
- **Prompt design**: Few-Shot, CoT, and ReAct techniques improve reasoning quality immediately, without modifying the model

---

## 2. Core Structure of RAG, Fine-Tuning, and Prompt Engineering

### A. RAG Architecture: Vector Search, Context Injection, LLM Generation Flow

```mermaid
%%{init: { 'theme': 'base', 'themeVariables': { 'edgeLabelBackground': '#fff' }}}%%
flowchart LR
    Q["User query<br/>Query"] --"Embed"--> VDB["Vector DB search<br/>Top-K similar chunks"]
    VDB --"Inject relevant<br/>context"--> PROMPT["Assemble prompt<br/>Query + context"]
    PROMPT --"Generation request"--> LLM["LLM generates response<br/>Grounded answer"]
    LLM --"Response"--> ANS["Final answer<br/>With sources"]
    style Q fill:#FFEBEE,stroke:#D32F2F,color:#000
    style VDB fill:#F3E5F5,stroke:#7B1FA2,color:#000
    style PROMPT fill:#E3F2FD,stroke:#1976D2,color:#000
    style LLM fill:#1E3A5F,stroke:#1E3A5F,color:#fff
    style ANS fill:#E8F5E9,stroke:#388E3C,color:#000
```

| Category | RAG | Fine-Tuning |
|---|---|---|
| **Knowledge freshness** | Reflected immediately by updating the search index | Requires retraining, periodic updates |
| **Cost** | Search infrastructure cost (low to medium) | GPU training cost (medium to high) |
| **Response accuracy** | Depends on search quality, easy to trace sources | High accuracy for the specific task |
| **Update method** | Real-time refresh by adding or removing documents | Requires a model retraining and deployment cycle |

---

### B. Fine-Tuning Techniques and Three Prompt Engineering Techniques

```mermaid
%%{init: { 'theme': 'base', 'themeVariables': { 'edgeLabelBackground': '#fff' }}}%%
flowchart TD
    FT["Fine-tuning technique classification"] --> FULL["Full Fine-Tuning"]
    FT --> PEFT["PEFT<br/>Parameter Efficient FT"]
    PEFT --> LORA["LoRA<br/>Low-rank matrix decomposition"]
    PEFT --> ADAPTER["Adapter layer<br/>Inserted between layers"]
    PEFT --> PREFIX["Prefix Tuning<br/>Trains prompt tokens"]
    style FT fill:#1E3A5F,stroke:#1E3A5F,color:#fff
    style FULL fill:#FFEBEE,stroke:#D32F2F,color:#000
    style PEFT fill:#E3F2FD,stroke:#1976D2,color:#000
    style LORA fill:#F3E5F5,stroke:#7B1FA2,color:#000
    style ADAPTER fill:#F3E5F5,stroke:#7B1FA2,color:#000
    style PREFIX fill:#F3E5F5,stroke:#7B1FA2,color:#000
```

| Technique | Method | Characteristics | Applicable Situations |
|---|---|---|---|
| **Few-Shot** | Includes 2 to 5 examples in the input | No extra training needed, applies immediately | Classification, translation, format-standardization tasks |
| **CoT (Chain of Thought)** | Prompts "let's think step by step" | Makes the intermediate reasoning process explicit | Math, logic, multi-step reasoning problems |
| **ReAct** | Repeats reason and act | Can combine with tool calls and search | Agent tasks, complex query answering |
| **LoRA** | Approximates weights with low-rank matrices | Trains 0.1-1% of parameters, cuts GPU cost | Domain specialization, style transfer |

---

## 3. Expected Benefits and Practical Applications of Adopting RAG, Fine-Tuning, and Prompt Engineering

| Category | Key Benefits | Use and Practical Application |
|---|---|---|
| **Improved reliability** | Reduces hallucination rate, enables information verification through source-grounded responses | Applies chunk-level source tagging in the RAG pipeline, displays a response confidence score |
| **Domain adaptation** | Secures response quality specialized to internal company knowledge, terms, and format | Uses LoRA fine-tuning to learn internal document style and terminology, minimizing cost |
| **Operational efficiency** | Refreshes knowledge without retraining, shortens the deployment cycle | Auto-indexes a vector DB (Pinecone, Weaviate) to reflect new documents in real time |
| **Reasoning quality** | Applying CoT and ReAct improves accuracy on complex multi-step problems | Builds a prompt-template library, standardizes LangChain and LlamaIndex chain design |
