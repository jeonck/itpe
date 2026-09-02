---
title: Generative AI and Large Language Models (LLM)
description: LLM pretraining and RLHF principles, multimodal (integrated text, image, audio, video processing) AI architecture
type: docs
weight: 2
---

## 1. Overview of Generative AI and LLMs, Which Align Models with Human Feedback and Integrate Perception Through Multimodality

```mermaid
%%{init: { 'theme': 'base', 'themeVariables': { 'edgeLabelBackground': '#fff' }}}%%
flowchart LR
    A["General-purpose text prediction<br/>Lacks alignment, safety"] --"RLHF, instruction tuning<br/>Learn human intent"--> B["Large language model<br/>Understands context, generates"] --"Multimodal integration<br/>Cross-Attention"--> C["Text, image, audio<br/>Integrated intelligent service"]
    style A fill:#FFEBEE,stroke:#D32F2F,color:#000
    style B fill:#E3F2FD,stroke:#1976D2,color:#000
    style C fill:#E8F5E9,stroke:#388E3C,color:#000
```

**Definition**: A generative AI system that pretrains a transformer with hundreds of billions of parameters on a large corpus, aligns it to human intent with RLHF, and integrates modalities beyond text through Cross-Attention.
- Decoder-only (or encoder-decoder) transformers such as GPT, LLaMA, and Gemini predict the probability of the next token
- RLHF uses a reward model and the PPO (proximal policy optimization) algorithm to suppress harmful output and improve helpfulness
- Multimodal models fuse image, audio, and video encoders into the text space, letting a single model handle mixed input

**Characteristics**:
- **Scaling laws**: Performance improves predictably as parameters, data, and compute grow, producing emergent capabilities
- **In-context learning**: Few-shot prompting performs a new task immediately, without updating parameters
- **Modal fusion**: Aligns heterogeneous modalities into a shared representation space using encoder projection and Cross-Attention

---

## 2. Core Structure of Generative AI and LLMs

### A. LLM Training Pipeline: Pretraining, Instruction Tuning, RLHF

```mermaid
%%{init: { 'theme': 'base', 'themeVariables': { 'edgeLabelBackground': '#fff' }}}%%
flowchart LR
    PT["Stage 1<br/>Pretraining<br/>Pre-training"] --> IT["Stage 2<br/>Instruction Tuning"] --> RM["Stage 3<br/>Reward model<br/>Reward Model training"] --> RL["Stage 4<br/>RLHF<br/>PPO policy optimization"] --> ALIGN["Aligned LLM<br/>Safe, helpful, harmless"]

    style PT fill:#E3F2FD,stroke:#1976D2,color:#000
    style IT fill:#F3E5F5,stroke:#7B1FA2,color:#000
    style RM fill:#FFF3E0,stroke:#F57C00,color:#000
    style RL fill:#FFEBEE,stroke:#D32F2F,color:#000
    style ALIGN fill:#E8F5E9,stroke:#388E3C,color:#000
```

| Stage | Purpose | Method | Output |
|---|---|---|---|
| **Pretraining** | Acquire the statistical patterns of language and world knowledge | Autoregressive training (next-token prediction) on trillions of tokens from the internet, books, and more | Base model (Base LLM) |
| **Instruction tuning** | Learn to respond in the format of user instructions | SFT (supervised fine-tuning) on high-quality instruction-response pairs | Instruction-tuned model (Instruct LLM) |
| **Reward model training** | Quantify human preference criteria | People rank multiple responses to the same prompt, then the model trains on the rankings | Reward score function (Reward Model) |
| **RLHF (PPO)** | Optimize response quality using the reward signal | Maximizes reward with the PPO algorithm, prevents over-optimization with KL divergence | Aligned LLM |

---

### B. Multimodal AI Architecture vs. Single-Modal LLM

```mermaid
%%{init: { 'theme': 'base', 'themeVariables': { 'edgeLabelBackground': '#fff' }}}%%
flowchart TD
    TEXT["Text input<br/>Tokenizer"] --> TXT_ENC["Text encoder<br/>Transformer"]
    IMG["Image input<br/>Patch splitting"] --> IMG_ENC["Vision encoder<br/>ViT / CNN"]
    AUDIO["Audio input<br/>Mel spectrogram"] --> AUD_ENC["Audio encoder<br/>Whisper family"]
    VIDEO["Video input<br/>Frame sampling"] --> VID_ENC["Video encoder<br/>Spatiotemporal transformer"]

    TXT_ENC --> PROJ["Modality projection<br/>Align to shared embedding space"]
    IMG_ENC --> PROJ
    AUD_ENC --> PROJ
    VID_ENC --> PROJ

    PROJ --> FUSION["Cross-Attention<br/>Modality fusion layer"]
    FUSION --> DECODER["LLM decoder<br/>Integrated reasoning, generation"]
    DECODER --> OUTPUT["Text, image, audio<br/>Multimodal output"]

    style TEXT fill:#E3F2FD,stroke:#1976D2,color:#000
    style IMG fill:#F3E5F5,stroke:#7B1FA2,color:#000
    style AUDIO fill:#FFF3E0,stroke:#F57C00,color:#000
    style VIDEO fill:#FFEBEE,stroke:#D32F2F,color:#000
    style TXT_ENC fill:#E3F2FD,stroke:#1976D2,color:#000
    style IMG_ENC fill:#F3E5F5,stroke:#7B1FA2,color:#000
    style AUD_ENC fill:#FFF3E0,stroke:#F57C00,color:#000
    style VID_ENC fill:#FFEBEE,stroke:#D32F2F,color:#000
    style PROJ fill:#E0F2F1,stroke:#00796B,color:#000
    style FUSION fill:#1E3A5F,stroke:#1E3A5F,color:#fff
    style DECODER fill:#1E3A5F,stroke:#1E3A5F,color:#fff
    style OUTPUT fill:#E8F5E9,stroke:#388E3C,color:#000
```

| Comparison Point | Single-Modal LLM | Multimodal AI |
|---|---|---|
| **Input** | Handles text only (token sequence) | Handles mixed text, image, audio, video |
| **Encoder structure** | Single path for text embedding | Dedicated encoder per modality plus a projection layer |
| **Fusion method** | Not applicable | Cross-Attention or concatenation of encoder outputs |
| **Positional information** | 1D positional encoding | Adds 2D patch position (image), time-axis position (audio, video) |
| **Representative models** | GPT-4 (text), LLaMA | GPT-4o, Gemini 1.5, Claude 3 (image + text) |
| **Key limitation** | Cannot directly understand visual or auditory information | Modality-alignment training data and compute cost increase |

---

## 3. Expected Benefits and Practical Applications of Adopting Generative AI and LLMs

| Category | Key Benefits | Use and Practical Application |
|---|---|---|
| **Work automation** | Automating document writing, summarization, and code generation sharply lifts knowledge-work productivity | In-house RAG-based Q&A systems, automated code review, draft report generation |
| **Multimodal services** | Integrated text, image, and audio processing enables mixed-input UX | Image-based search and description, voice conversational AI agents, automatic video summarization |
| **Safety, alignment** | Applying RLHF minimizes harmful and biased output for trustworthy AI services | Customizing reward models, red-team testing, building output-filtering pipelines |
| **Domain specialization** | Instruction-tuning fine-tuning improves precision in specialized fields such as law, medicine, and finance | Domain-corpus SFT, RAG vector-DB integration, building compliance-verification pipelines for output |
