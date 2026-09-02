# LaTeX Rendering Troubleshooting Guide

This document records the causes and resolution of LaTeX formula rendering errors that occurred during the construction of the `itpe-KM` knowledge base.

## 1. Problem Symptoms
- LaTeX syntax (`$ ... $`, `$$ ... $$`) written in the `content/docs/test.md` file is not converted to formulas but exposed as plain text.
- KaTeX script in the Hextra theme is not activated.

## 2. Root Cause Analysis
1. **Hugo Goldmark Configuration**: Hugo's default Markdown renderer, Goldmark, ignores math delimiters (`$`) by default for security and standards compliance. An explicit `passthrough` configuration to enable this was required.
2. **Theme Parameter Mismatch**: Instead of `params.latex` used in initial configuration, the internal `params.math` structure used by the Hextra theme needed to be applied.

## 3. Solution (`hugo.yaml` modification)

### 3.1. Goldmark Passthrough Configuration
Modified the `markup` section to interpret math delimiters in Markdown files as follows.

```yaml
markup:
  goldmark:
    renderer:
      unsafe: true # Allow HTML tags (if necessary)
    extensions:
      passthrough:
        delimiters:
          block: [['\[', '\]'], ['$$', '$$']] # Block formula delimiters
          inline: [['\(', '\)'], ['$', '$']]  # Inline formula delimiters
        enable: true
```

### 3.2. Math Parameter Activation
Updated parameters so the theme can load the KaTeX engine.

```yaml
params:
  math:
    enable: true
```

## 4. LaTeX Writing Rules (Supported Delimiters)
You can write formulas in four ways according to the current configuration.

- **Inline formulas**: `$E = mc^2$` or `\( E = mc^2 \)`
- **Block formulas**:
  ```latex
  $$
  x = \frac{-b \pm \sqrt{b^2 - 4ac}}{2a}
  $$
  ```
  or
  ```latex
  \[
  \int_{a}^{b} f(x) dx
  \]
  ```

## 5. Verification Method
After applying the modifications, verify that the formulas render beautifully on the `/docs/test/` page deployed to GitHub Pages. If rendering fails, check the Console tab of browser developer tools (F12) for any KaTeX-related loading errors.
