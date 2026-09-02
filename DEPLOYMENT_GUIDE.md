# Hugo Hextra Theme Configuration and GitHub Pages Deployment Guide

This document records the configuration settings applied during the construction of the `itpe` knowledge base and deployment-related troubleshooting.

## 1. Project Overview
- **Framework**: Hugo (Extended version)
- **Theme**: [Hextra](https://github.com/imfing/hextra)
- **Purpose**: Information Systems Professional Engineer knowledge base construction
- **Key Features**: Mermaid diagram, LaTeX equation, FlexSearch search support

## 2. Theme Configuration (`hugo.yaml`)
The following settings were applied to enable Hextra theme features:

```yaml
theme: hextra

params:
  search:
    enable: true
    type: flexsearch
  latex:
    enable: true
  mermaid:
    enable: true
```

- **Mermaid/LaTeX**: The `goldmark` renderer may require `unsafe: true` configuration, and Hextra conveniently supports this through its own parameters.
- **Search**: FlexSearch enables fast client-side search without a separate server.

## 3. GitHub Pages Deployment Resolution Process

### Problem Encountered
Initial GitHub Actions workflow configuration failed with the error `This run likely failed because of a workflow file issue`, preventing deployment.

### Solution
Applied a validated workflow template to resolve. Key points are as follows:

1. **Permissions Configuration**: Explicitly specify `contents: read`, `pages: write`, `id-token: write` permissions.
2. **Setup Pages**: Use `actions/configure-pages@v5` to dynamically obtain `base_url`.
3. **Build Command**: Use the `--baseURL` option to ensure GitHub Pages subdirectory paths are properly recognized.
4. **Deploy Stage**: Use `actions/deploy-pages@v4` to deploy the built `public` folder.

### Final Workflow (`.github/workflows/deploy.yaml`)
```yaml
name: Deploy Hugo to GitHub Pages

on:
  push:
    branches:
      - main
  workflow_dispatch:

permissions:
  contents: read
  pages: write
  id-token: write

concurrency:
  group: "pages"
  cancel-in-progress: false

jobs:
  build:
    runs-on: ubuntu-latest
    steps:
      - name: Checkout
        uses: actions/checkout@v4
        with:
          submodules: true
          fetch-depth: 0

      - name: Setup Hugo
        uses: peaceiris/actions-hugo@v3
        with:
          hugo-version: 'latest'
          extended: true

      - name: Setup Pages
        id: pages
        uses: actions/configure-pages@v5

      - name: Build
        run: hugo --minify --baseURL "${{ steps.pages.outputs.base_url }}/"

      - name: Upload artifact
        uses: actions/upload-pages-artifact@v3
        with:
          path: ./public

  deploy:
    environment:
      name: github-pages
      url: ${{ steps.deployment.outputs.page_url }}
    runs-on: ubuntu-latest
    needs: build
    steps:
      - name: Deploy to GitHub Pages
        id: deployment
        uses: actions/deploy-pages@v4
```

## 4. Local Development Guide
Use the following command to verify changes locally:

```bash
# Clone including theme submodule
git clone --recursive https://github.com/jeonck/itpe.git

# Run local server
hugo server -D
```
