---
name: hextra-kb-builder
description: Initialize a technical knowledge base with Mermaid, LaTeX, and search features using Hugo Hextra theme. Automatically complete GitHub Pages deployment setup.
---

# Hextra KB Builder

This skill provides a workflow for building a modern technical knowledge base using the Hugo Hextra theme.

## Key Features
- **Hugo Hextra Theme Installation**: Latest theme installation via Git Submodule.
- **Modern Design**: Pretendard font and optimized typography settings.
- **Formulas and Diagrams**: LaTeX (KaTeX) and Mermaid automatic setup.
- **Search Support**: Enable offline search with FlexSearch-based search bar.
- **Custom Layout**: Always display search bar in Docs sidebar except on main page.
- **GitHub Pages Deployment**: Optimized GitHub Actions workflow configuration.

## Workflow

### 1. Project Initialization
Create a new Hugo site and add the Hextra theme.

```bash
hugo new site . --force --format yaml
git init
mkdir -p themes
git submodule add https://github.com/imfing/hextra.git themes/hextra
```

### 2. Configuration and Design Setup
- Write `hugo.yaml` by referring to `assets/hugo.yaml.template`.
- Copy `assets/custom.css.template` content to `assets/css/custom.css` to apply modern fonts and styles.

### 3. Layout Override
Copy `assets/sidebar.html.template` content to `layouts/partials/sidebar.html` for sidebar search configuration.

### 4. Deployment Setup
Write `assets/deploy.yaml.template` content to `.github/workflows/deploy.yaml`.

### 5. Initial Content Generation
Create `content/docs/_index.md` and `content/_index.md` to establish the basic structure.

## Considerations
- Hugo **Extended** version must be installed.
- Change Source to **GitHub Actions** in GitHub Pages settings.
- Use `$ ... $` or `$$ ... $$` when writing LaTeX formulas.
