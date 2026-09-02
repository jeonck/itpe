# Search Functionality Activation and Exposure Troubleshooting Guide

This document records the resolution of issues where the search functionality was not displayed correctly or was missing from specific pages during the construction of the `itpe-KM` knowledge base.

## 1. Problem Symptoms
1.  **Search bar missing from navigation bar**: Despite setting `params.search.enable: true` in `hugo.yaml`, the search bar did not appear in the top menu.
2.  **Search bar missing from Docs page sidebar**: When navigating to the documentation (Docs) page, the search bar was not visible in the left sidebar, reducing accessibility.

## 2. Root Cause Analysis
1.  **Hextra theme's menu-based search design**: The Hextra theme does not simply enable a parameter; it requires a menu item in `menu.main` with a `type: search` attribute to render the search bar in the navigation bar.
2.  **Sidebar default responsive settings**: In the theme's default layout, the sidebar search bar was set to appear only on mobile screens (`hx:md:hidden`), so it was not exposed on desktop Docs pages.

## 3. Solution

### 3.1. Navigation Bar Search Bar Activation (`hugo.yaml`)
Added search type explicitly to the main menu configuration.

```yaml
menu:
  main:
    - name: Docs
      url: /docs/
      weight: 10
    - name: Search
      weight: 20
      params:
        type: search # This setting activates the search bar
```

### 3.2. Docs Sidebar Search Bar Always Visible (`layouts/partials/sidebar.html`)
Copied the theme's default sidebar layout to the project root to override it. Modified to make the search bar visible in the sidebar on all pages except the home page.

**Modifications:**
- Removed the `hx:md:hidden` class so it appears on desktop as well.
- Added the `not $context.IsHome` condition to hide the search bar from the home page sidebar.

```html
{{- if and (site.Params.search.enable | default true) (not $context.IsHome) -}}
  <!-- Search bar -->
  <div class="hx:px-4 hx:pt-4">
    {{ partial "search.html" (dict "location" "sidebar") }}
  </div>
{{- end -}}
```

## 4. Final Verification
- **Top navigation bar**: Search bar and keyboard shortcut (CTRL K) guide appear on the right.
- **Documentation sidebar**: Search bar is always visible at the top of the left course menu.
- **Functionality**: Real-time search of document titles and contents is available through the FlexSearch engine.

## 5. Maintenance Notes
To adjust the search engine's performance or indexing scope, modify the `params.search.flexsearch` section in `hugo.yaml`.
