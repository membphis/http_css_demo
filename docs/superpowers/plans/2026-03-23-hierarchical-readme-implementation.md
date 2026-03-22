# Hierarchical README Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Create a three-file hierarchical documentation structure (README.md, docs/architecture.md, docs/contributing.md) for the HTTP & CSS Demo project to provide clear, accessible developer documentation.

**Architecture:** Hierarchical documentation with README.md as the entry point, docs/architecture.md for technical reference, and docs/contributing.md for contribution workflows. All markdown files with cross-references and navigation.

**Tech Stack:** Markdown, Git (for version control)

---

## File Structure

### Files to Create:
- Create: `README.md` - Quick start and overview for visitors (~80-100 lines)
- Create: `docs/architecture.md` - Complete technical reference (~200-250 lines)
- Create: `docs/contributing.md` - Contribution guide (~150-180 lines)

### Responsibilities:
- **README.md** - Landing documentation, quick onboarding, navigation hub
- **docs/architecture.md** - CSS architecture, conventions, design tokens, patterns
- **docs/contributing.md** - How to add pages/components, workflow, best practices

---

## Task 1: Create docs/ directory structure

**Files:**
- Create: `docs/` (directory)

- [ ] **Step 1: Create docs directory**

```bash
mkdir -p docs
```

- [ ] **Step 2: Verify directory created**

Run: `ls -la docs`
Expected: docs/ directory exists and is empty

- [ ] **Step 3: No commit needed** (will commit when files are added)

---

## Task 2: Create README.md

**Files:**
- Create: `README.md`
- Reference: `docs/superpowers/specs/2026-03-23-hierarchical-readme-design.md`
- Reference: `index.html`
- Reference: `AGENTS.md`

- [ ] **Step 1: Create README.md with header and title**

```markdown
# HTTP & CSS Demo — NexusGateway

> Static HTML + CSS demonstration landing page with clean architecture and modern design.
```

- [ ] **Step 2: Add Overview section**

```markdown
## Overview

This project demonstrates a production-ready static HTML + CSS landing page for NexusGateway, an open-source AI Gateway. Built with pure HTML and CSS — no build tools, no bundler, no JavaScript.

**Tech Stack:**
- Static HTML5
- Modern CSS (custom properties, grid, flexbox)
- No build tools or package managers

**Project Status:**
- Active — NexusGateway landing page implemented

Open `.html` files directly in a browser to preview.
```

- [ ] **Step 3: Add Quick Start section**

```markdown
## Quick Start

**Option 1: Direct Open**

Just open the HTML file in your browser:

```bash
# Linux
xdg-open index.html

# macOS
open index.html

# Windows
start index.html
```

**Option 2: Local Server (Optional)**

If you prefer a local server:

```bash
# Python 3
python3 -m http.server 8000

# Node.js (requires serve)
npx serve .

# Then visit http://localhost:8000
```

Refresh your browser after making changes to see updates instantly.
```

- [ ] **Step 4: Add Project Structure section**

```markdown
## Project Structure

```
http_css_demo/
├── README.md              # This file
├── AGENTS.md              # Architecture and development guidelines
├── index.html             # NexusGateway landing page
├── css/
│   ├── reset.css           # Browser reset (box-sizing, list, anchor, media)
│   ├── variables.css       # Design tokens (all CSS custom properties)
│   ├── main.css            # Global styles (nav, buttons, footer, responsive)
│   └── landing.css         # Landing page specific styles
└── docs/
    ├── architecture.md     # CSS architecture and conventions (detailed)
    └── contributing.md     # Contribution guide and workflows
```
```

- [ ] **Step 5: Add Documentation section**

```markdown
## Documentation

- **[Architecture & Conventions](docs/architecture.md)** — Deep dive into CSS architecture, design tokens, naming conventions, and component patterns
- **[Contributing Guide](docs/contributing.md)** — How to add pages, components, and contribute effectively
- **[AGENTS.md](AGENTS.md)** — Detailed architecture specifications and development guidelines
```

- [ ] **Step 6: Add Key Features section**

```markdown
## Key Features

- **Pure HTML + CSS** — No JavaScript, no build tools, no dependencies
- **Responsive Design** — Desktop-first with single breakpoint at 768px
- **BEM Naming Convention** — Clear, maintainable CSS class names
- **Design Tokens System** — Consistent styling via CSS custom properties
- **Interactive Components** — CSS-only interactivity (hover states, tabs)
- **Modern Visual Design** — Dark theme with gradients, glows, and glass effects
```

- [ ] **Step 7: Add Browser Support and License sections**

```markdown
## Browser Support

Works in all modern browsers with CSS custom properties support:
- Chrome/Edge 88+
- Firefox 85+
- Safari 14+

## License

MIT License — see [LICENSE](LICENSE) for details
```

- [ ] **Step 8: Validate README.md**

```bash
# Check file exists and has content
wc -l README.md

# Verify it's valid markdown
head -20 README.md
```

Expected: File has 80-100 lines, valid markdown syntax

- [ ] **Step 9: Commit README.md**

```bash
git add README.md
git commit -m "docs: add README.md with project overview and quick start"
```

---

## Task 3: Create docs/architecture.md

**Files:**
- Create: `docs/architecture.md`
- Reference: `docs/superpowers/specs/2026-03-23-hierarchical-readme-design.md`
- Reference: `AGENTS.md`
- Reference: `css/variables.css`
- Reference: `css/main.css`

- [ ] **Step 1: Create docs/architecture.md with header**

```markdown
# Architecture & Conventions

> Complete technical reference for the HTTP & CSS Demo project.

This document covers CSS architecture, naming conventions, design tokens, component patterns, and responsive design guidelines.
```

- [ ] **Step 2: Add CSS Architecture section**

```markdown
## CSS Architecture

### File Load Order (Mandatory)

Every HTML file must load CSS files in this exact order:

1. **`css/reset.css`** — always first
   - Browser resets: box-sizing, list-style, anchor tags, form fonts

2. **`css/variables.css`** — always second
   - All design tokens as CSS custom properties
   - Never hardcode colors, spacing, or font sizes elsewhere

3. **`css/main.css`** — always third
   - Global styles: body, header, nav, footer, buttons, responsive
   - Reusable components and layout patterns

4. **Page-specific CSS** — always last
   - e.g., `css/landing.css` for landing page styles
   - Add after `main.css` in the `<head>`

### Path Conventions

- Root pages (like `index.html`): `href="css/*.css"`
- Subpages in `pages/`: `href="../css/*.css"`

### Design Tokens System

All design values live in `css/variables.css` on `:root`. Never hardcode hex colors, pixel font sizes, or magic-number spacing elsewhere.

When you need a new design value:
1. Add the token to `css/variables.css` first
2. Reference it with `var(--your-token)` in your styles

**Example:**
```css
/* In variables.css */
:root {
  --color-accent: #f97316;
}

/* In component CSS */
.button {
  background: var(--color-accent);
}
```
```

- [ ] **Step 3: Add Design Tokens Reference table**

```markdown
### Design Tokens Reference

All tokens are defined in `css/variables.css`.

| Prefix          | Purpose                             | Example                    |
|-----------------|-------------------------------------|----------------------------|
| `--color-*`     | Colors                              | `var(--color-primary)`     |
| `--font-size-*` | Typography scale (xs, sm, base, lg, xl, 2xl, 3xl, 4xl) | `var(--font-size-lg)`  |
| `--font-weight-*`| Weight (normal, medium, semibold, bold, extrabold) | `var(--font-weight-bold)` |
| `--space-*`     | Spacing (1, 2, 3, 4, 5, 6, 8, 10, 12, 16) | `var(--space-4)`       |
| `--radius-*`     | Border radius (sm, md, lg, xl, full) | `var(--radius-md)`       |
| `--shadow-*`    | Box shadows (sm, md, lg)             | `var(--shadow-sm)`        |
| `--transition-*`| Durations (fast, base)               | `var(--transition-fast)`  |
| `--max-width`   | Content max width                    | `var(--max-width)`        |
| `--header-height`| Sticky header height               | `var(--header-height)`    |

**Token Values (from `css/variables.css`):**

```css
/* Colors */
--color-bg: #0f172a;
--color-surface: #1e293b;
--color-surface-2: #020617;
--color-border: #334155;
--color-primary: #f97316;
--color-text: #f8fafc;

/* Typography */
--font-ui: -apple-system, BlinkMacSystemFont, 'Segoe UI', sans-serif;
--font-code: 'JetBrains Mono', 'Fira Code', 'Cascadia Code', monospace;

/* Layout */
--max-width: 1100px;
--header-height: 64px;
```
```

- [ ] **Step 4: Add Naming Conventions section**

```markdown
## Naming Conventions

### HTML Conventions

**Indentation:**
- 2-space indentation
- Double quotes on all attributes

**Required Elements:**
- `lang="en"` on `<html>`
- `charset` and `viewport` meta tags

**Semantic HTML:**
Use semantic elements for structure:
```html
<header>      <!-- Site header and navigation -->
<nav>         <!-- Navigation links -->
<main>        <!-- Main content area -->
<section>     <!-- Content sections -->
<footer>      <!-- Site footer -->
```

**Subpage Title Format:**
```html
<title>Page Name - HTTP & CSS Demo</title>
```

### CSS Conventions — BEM

We use BEM (Block Element Modifier) naming for all CSS classes.

**Syntax:**
```
.block              → .card, .nav-bar, .site-header
.block__element     → .card__title, .form__input
.block--modifier    → .btn--primary, .alert--error
```

**Rules:**
- **Blocks:** lowercase, hyphen-separated (`site-header`, `demo-section`)
- **Elements:** double underscore (`card__title`)
- **Modifiers:** double hyphen (`btn--outline`)
- **Max depth:** One element level deep (no `.block__el__sub`)
- **Multi-word:** Use hyphens, not camelCase (`nav-link`, not `navLink`)

**Examples:**
```css
/* Block */
.feature-card { ... }

/* Element */
.feature-card__title { ... }
.feature-card__desc { ... }

/* Modifier */
.feature-card--highlighted { ... }
```

### Property Order

When writing CSS, order properties as:
1. **Layout** — display, position, grid, flex
2. **Box Model** — margin, border, padding, width, height
3. **Typography** — font, line-height, text-align
4. **Visual** — color, background, box-shadow
5. **Misc** — cursor, pointer-events, transition

**Example:**
```css
.card {
  /* Layout */
  display: grid;
  grid-template-columns: 1fr;

  /* Box Model */
  margin: var(--space-4);
  padding: var(--space-6);
  border-radius: var(--radius-lg);

  /* Typography */
  font-size: var(--font-size-base);

  /* Visual */
  background: var(--color-surface);
  border: 1px solid var(--color-border);

  /* Misc */
  transition: transform var(--transition-base);
}
```
```

- [ ] **Step 5: Add Component Patterns section**

```markdown
## Component Patterns

### Centered Container

Use the container class from `main.css` for centered content:

```css
.container {
  max-width: var(--max-width);
  margin: 0 auto;
  padding: 0 var(--space-6);
}
```

**HTML:**
```html
<div class="container">
  <h1>Section Title</h1>
  <p>Content goes here</p>
</div>
```

### Card with Hover Lift

Create interactive cards with hover effects:

```css
.card {
  box-shadow: var(--shadow-sm);
  transition: box-shadow var(--transition-base),
              transform var(--transition-base);
}

.card:hover {
  box-shadow: var(--shadow-md);
  transform: translateY(-2px);
}
```

**Focus Ring Pattern**

For interactive elements, add focus rings:

```css
.input:focus {
  outline: none;
  border-color: var(--color-primary);
  box-shadow: 0 0 0 3px rgba(37, 99, 235, 0.15);
}
```

### Button Variants

Use button modifiers for different styles:

```css
.btn {
  /* Base button styles */
  padding: var(--space-3) var(--space-6);
  border-radius: var(--radius-md);
  font-weight: var(--font-weight-semibold);
  cursor: pointer;
  transition: background var(--transition-fast),
              border-color var(--transition-fast);
}

.btn--primary {
  background: var(--color-primary);
  color: white;
}

.btn--outline {
  background: transparent;
  border: 2px solid var(--color-border);
  color: var(--color-text-muted);
}
```

**Hover State Pattern**

Use `:hover:not(:disabled)` for interactive elements:

```css
.btn:hover:not(:disabled) {
  transform: translateY(-1px);
}

.btn:disabled {
  opacity: 0.5;
  cursor: not-allowed;
}
```
```

- [ ] **Step 6: Add Responsive Design section**

```markdown
## Responsive Design

### Breakpoint

Single breakpoint at **768px** (tablet/mobile).

**Desktop-first approach:** Write styles for desktop, add mobile overrides:

```css
/* Desktop styles (default) */
.nav {
  display: flex;
  gap: var(--space-6);
}

/* Mobile override */
@media (max-width: 768px) {
  .nav {
    flex-direction: column;
  }
}
```

### Grid Patterns

Prefer intrinsic responsiveness with `auto-fit` and `minmax()`:

```css
.grid {
  display: grid;
  grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
  gap: var(--space-6);
}
```

This automatically adjusts columns based on available space.

### Responsive Location

Place responsive blocks at the bottom of each CSS file, marked with comments:

```css
/* --- Component Styles --- */

.card { ... }

/* --- Responsive --- */
@media (max-width: 768px) {
  .card {
    padding: var(--space-4);
  }
}
```
```

- [ ] **Step 7: Add Design Principles section**

```markdown
## Design Principles

### Do NOT

❌ Use inline styles
❌ Use `!important`
❌ Use `id` selectors for styling
❌ Hardcode colors, font sizes, or spacing — always use `var(--token)`
❌ Add JavaScript unless explicitly required
❌ Introduce build tools (Sass, PostCSS, bundlers) without discussion

### Token-First Development

Always reference design tokens from `variables.css`:

```css
/* ✅ Good */
.button {
  padding: var(--space-4);
  color: var(--color-text);
}

/* ❌ Bad */
.button {
  padding: 1rem;
  color: #f8fafc;
}
```

### Semantic HTML

Use semantic elements for structure and accessibility:

```html
<!-- ✅ Good -->
<header>
  <nav>
    <a href="/" class="nav-link">Home</a>
  </nav>
</header>

<!-- ❌ Bad -->
<div class="header">
  <div class="navigation">
    <a href="/" class="link">Home</a>
  </div>
</div>
```

### YAGNI (You Aren't Gonna Need It)

Build only what's needed now. Avoid:
- Unused CSS classes
- Over-engineered patterns
- Premature optimization
```

- [ ] **Step 8: Add Related Documentation section**

```markdown
## Related Documentation

- **[Contributing Guide](contributing.md)** — How to apply these patterns when adding features
- **[AGENTS.md](../AGENTS.md)** — Complete architecture specifications and development guidelines
- **[README.md](../README.md)** — Project overview and quick start

## Next Steps

- Read the [Contributing Guide](contributing.md) to start adding pages and components
- Review [AGENTS.md](../AGENTS.md) for detailed architecture specifications
- Explore `css/variables.css` to see all available design tokens
```

- [ ] **Step 9: Validate docs/architecture.md**

```bash
# Check file exists and has content
wc -l docs/architecture.md

# Verify it's valid markdown
head -30 docs/architecture.md

# Check for broken links (optional)
# npx markdown-link-check docs/architecture.md
```

Expected: File has 200-250 lines, valid markdown syntax

- [ ] **Step 10: Commit docs/architecture.md**

```bash
git add docs/architecture.md
git commit -m "docs: add architecture.md with CSS architecture and conventions"
```

---

## Task 4: Create docs/contributing.md

**Files:**
- Create: `docs/contributing.md`
- Reference: `docs/superpowers/specs/2026-03-23-hierarchical-readme-design.md`
- Reference: `AGENTS.md`
- Reference: `docs/architecture.md`

- [ ] **Step 1: Create docs/contributing.md with header**

```markdown
# Contributing Guide

> How to contribute to the HTTP & CSS Demo project.

This guide covers the development workflow, adding new pages and components, and best practices for maintaining code quality.
```

- [ ] **Step 2: Add Prerequisites section**

```markdown
## Prerequisites

### First, Familiarize Yourself

Before contributing, review these documents:

- **[Architecture & Conventions](architecture.md)** — CSS patterns and design tokens
- **[AGENTS.md](../AGENTS.md)** — Detailed architecture specifications

### What You Need

You don't need a complex development environment:

✅ **Required:**
- A text editor (VS Code, Sublime Text, Notepad++, etc.)
- A modern web browser (Chrome, Firefox, Safari, Edge)

❌ **Not Required:**
- Node.js or npm
- Build tools or bundlers
- Package managers
- Virtual environments

This is a pure HTML + CSS project — no compilation, no dependencies.
```

- [ ] **Step 3: Add Development Workflow section**

```markdown
## Development Workflow

### Making Changes

1. Edit HTML or CSS files directly in your text editor
2. Save your changes
3. Refresh your browser to see updates

That's it! No build step, no npm install, no server restart.

### Previewing Locally

**Option 1: Direct Open (Recommended)**

```bash
# Linux
xdg-open index.html

# macOS
open index.html

# Windows
start index.html
```

**Option 2: Local Server (Optional)**

If you prefer a local server:

```bash
# Python 3
python3 -m http.server 8000

# Then visit http://localhost:8000
```

Refresh your browser after saving changes.

### Linting (Optional)

Not required, but if you want to use linters:

```bash
# HTML linting
npx htmlhint "**/*.html"

# CSS linting
npx stylelint "css/**/*.css"
```

These are helpful tools but not enforced.
```

- [ ] **Step 4: Add Adding a New Page section**

```markdown
## Adding a New Page

### Step-by-Step Guide

**1. Create the page file**

```bash
# Create pages/yourpage.html
touch pages/yourpage.html
```

**2. Copy the `<head>` from an existing page**

Copy from `pages/` subpages (not root pages) to get the correct `../css/` paths:

```html
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Your Page - HTTP & CSS Demo</title>
  <meta name="description" content="Page description">
  <link rel="stylesheet" href="../css/reset.css">
  <link rel="stylesheet" href="../css/variables.css">
  <link rel="stylesheet" href="../css/main.css">
  <link rel="stylesheet" href="../css/yourpage.css">
</head>
```

**3. Copy `<header>` and `<footer>` verbatim**

Copy the entire `<header>` and `<footer>` from existing pages:

```html
<body>
  <header class="site-header">
    <div class="container site-header__inner">
      <a href="../" class="site-header__logo">
        <div class="site-header__logo-icon">⬡</div>
        NexusGateway
      </a>
      <nav class="site-header__nav">
        <a href="#features" class="nav-link">Features</a>
        <a href="../" class="nav-link">Home</a>
      </nav>
    </div>
  </header>

  <main>
    <!-- Your content here -->
  </main>

  <footer class="site-footer">
    <!-- Footer content (copy from existing) -->
  </footer>
</body>
</html>
```

**4. Mark the active nav link**

Add `nav-link--active` to the current page's link:

```html
<a href="#features" class="nav-link nav-link--active">Features</a>
```

**5. Create page-specific CSS**

Create `css/yourpage.css` and add your page styles:

```css
/* css/yourpage.css */

.your-section {
  padding: var(--space-12) var(--space-6);
}
```

**6. Update navigation (if needed)**

Add links to your new page in `css/main.css`:

```css
.site-header__nav {
  /* Update nav links here */
}

.site-footer__nav {
  /* Update footer links here */
}
```
```

- [ ] **Step 5: Add Adding a New Component section**

```markdown
## Adding a New Component

### Step-by-Step Guide

**1. Define the base block class**

Choose the appropriate CSS file:
- `css/main.css` for global components (buttons, cards, inputs)
- Page-specific CSS (e.g., `css/landing.css`) for single-page components

```css
/* Define block with BEM naming */
.component {
  /* Base styles */
}

.component__element {
  /* Element styles */
}

.component--modifier {
  /* Modifier styles */
}
```

**2. Use design tokens only**

Never hardcode values:

```css
/* ✅ Good */
.component {
  padding: var(--space-6);
  background: var(--color-surface);
  border-radius: var(--radius-lg);
}

/* ❌ Bad */
.component {
  padding: 1.5rem;
  background: #1e293b;
  border-radius: 0.5rem;
}
```

Need a new token? Add it to `css/variables.css` first:

```css
/* In variables.css */
:root {
  --your-new-token: value;
}
```

**3. Add hover and focus states**

Use transition tokens for smooth animations:

```css
.component {
  transition: transform var(--transition-base),
              box-shadow var(--transition-base);
}

.component:hover {
  transform: translateY(-2px);
  box-shadow: var(--shadow-md);
}
```

Use `:hover:not(:disabled)` pattern for interactive elements:

```css
.component:hover:not(:disabled) {
  /* Hover styles only when not disabled */
}
```

**4. Add disabled states (if interactive)**

```css
.component:disabled {
  opacity: 0.5;
  cursor: not-allowed;
}
```

**5. Test responsively**

Test at desktop (768px+) and mobile (768px and below):

```css
/* Desktop styles (default) */
.component {
  display: grid;
  grid-template-columns: repeat(3, 1fr);
}

/* Mobile override */
@media (max-width: 768px) {
  .component {
    grid-template-columns: 1fr;
  }
}
```

**6. Use semantic HTML**

```html
<!-- ✅ Good -->
<section class="features-section">
  <h2 class="features-section__title">Features</h2>
  <div class="features-section__grid">...</div>
</section>

<!-- ❌ Bad -->
<div class="features">
  <div class="title">Features</div>
  <div class="grid">...</div>
</div>
```
```

- [ ] **Step 6: Add Common Patterns section**

```markdown
## Common Patterns

### Centered Content

Use the container class from `main.css`:

```html
<div class="container">
  <h1>Section Title</h1>
  <p>Content goes here</p>
</div>
```

### Cards with Hover Effects

```css
.card {
  box-shadow: var(--shadow-sm);
  transition: box-shadow var(--transition-base),
              transform var(--transition-base);
}

.card:hover {
  box-shadow: var(--shadow-md);
  transform: translateY(-2px);
}
```

```html
<div class="card">
  <h3 class="card__title">Title</h3>
  <p class="card__desc">Description text</p>
</div>
```

### Code Blocks

Use syntax highlighting classes:

```html
<pre><code><span class="tok-keyword">import</span> <span class="tok-name">openai</span></code></pre>
```

Available token classes:
- `.tok-keyword` — Keywords (import, return, if)
- `.tok-string` — Strings
- `.tok-name` — Variable/function names
- `.tok-func` — Function calls
- `.tok-comment` — Comments
- `.tok-param` — Parameters
- `.tok-punct` — Punctuation

### Responsive Grids

```css
.grid {
  display: grid;
  grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
  gap: var(--space-6);
}
```

This automatically adjusts columns based on available space.

### Section Headers

```html
<div class="section-header">
  <span class="section-header__label">Features</span>
  <h2 class="section-header__title">Section Title</h2>
  <p class="section-header__subtitle">Subtitle text</p>
</div>
```
```

- [ ] **Step 7: Add Code Quality section**

```markdown
## Code Quality

### Naming

Use BEM naming consistently:

```css
/* ✅ Good */
.feature-card { ... }
.feature-card__title { ... }
.feature-card--highlighted { ... }

/* ❌ Bad */
.featureCard { ... }
.featureCardTitle { ... }
.feature_card__highlighted { ... }
```

Use kebab-case for multi-word names:

```css
/* ✅ Good */
.site-header__nav-link { ... }

/* ❌ Bad */
.siteHeader__navLink { ... }
.site-header__navLink { ... }
```

### No Hardcoded Values

Always use design tokens:

```css
/* ✅ Good */
.button {
  padding: var(--space-4);
  color: var(--color-text);
  background: var(--color-primary);
}

/* ❌ Bad */
.button {
  padding: 1rem;
  color: #f8fafc;
  background: #f97316;
}
```

### Semantic HTML

Use proper semantic elements:

```html
<!-- ✅ Good -->
<header>
  <nav>
    <a href="/" class="nav-link">Home</a>
  </nav>
</header>

<main>
  <section>
    <h2>Section Title</h2>
  </section>
</main>

<footer>
  <p>© 2026 Project</p>
</footer>

<!-- ❌ Bad -->
<div class="header">
  <div class="nav">
    <a href="/" class="link">Home</a>
  </div>
</div>

<div class="main">
  <div class="section">
    <div class="title">Section Title</div>
  </div>
</div>

<div class="footer">
  <p>© 2026 Project</p>
</div>
```

### Clean CSS

```css
/* ✅ Good - one declaration per line */
.card {
  padding: var(--space-6);
  background: var(--color-surface);
  border-radius: var(--radius-lg);
}

/* ✅ Good - blank line between rule blocks */
.card {
  padding: var(--space-6);
}

.card__title {
  font-size: var(--font-size-base);
}

/* ✅ Good - section dividers in long files */
/* --- Header Styles --- */

.site-header { ... }

/* --- Button Styles --- */

.btn { ... }

/* ❌ Bad - multiple declarations per line */
.card { padding: var(--space-6); background: var(--color-surface); }

/* ❌ Bad - no blank lines */
.card { padding: var(--space-6); }
.card__title { font-size: var(--font-size-base); }
```
```

- [ ] **Step 8: Add Quick Reference section**

```markdown
## Quick Reference

### When Adding Components, Reference:

- **[Design Tokens](architecture.md#design-tokens-reference)** — All available tokens in one table
- **[Component Patterns](architecture.md#component-patterns)** — Reusable component patterns with code examples
- **[Responsive Design](architecture.md#responsive-design)** — How to make components responsive
- **[Naming Conventions](architecture.md#naming-conventions)** — BEM syntax and examples

### Common File Locations:

| What You're Adding | File Location |
|-------------------|---------------|
| Global component | `css/main.css` |
| Page-specific styles | `css/<page>.css` |
| New page | `pages/<page>.html` |
| New design token | `css/variables.css` |

### Quick Commands:

```bash
# Create new page
touch pages/yourpage.html

# Create new CSS file
touch css/yourpage.css

# Preview in browser
open index.html  # macOS
xdg-open index.html  # Linux

# Optional linting
npx htmlhint "**/*.html"
npx stylelint "css/**/*.css"
```
```

- [ ] **Step 9: Add License section**

```markdown
## License

MIT License — see [LICENSE](../LICENSE) for details

## Thanks for Contributing! 🎉

Your contributions help make this project better. If you have questions or need help, please reach out.
```

- [ ] **Step 10: Validate docs/contributing.md**

```bash
# Check file exists and has content
wc -l docs/contributing.md

# Verify it's valid markdown
head -30 docs/contributing.md

# Check for broken links (optional)
# npx markdown-link-check docs/contributing.md
```

Expected: File has 150-180 lines, valid markdown syntax

- [ ] **Step 11: Commit docs/contributing.md**

```bash
git add docs/contributing.md
git commit -m "docs: add contributing.md with contribution guide and workflows"
```

---

## Task 5: Final validation and verification

**Files:**
- Verify: `README.md`
- Verify: `docs/architecture.md`
- Verify: `docs/contributing.md`

- [ ] **Step 1: Verify all files exist**

```bash
ls -la README.md docs/architecture.md docs/contributing.md
```

Expected: All three files exist and are readable

- [ ] **Step 2: Check line counts are in range**

```bash
echo "README.md:" && wc -l README.md
echo "architecture.md:" && wc -l docs/architecture.md
echo "contributing.md:" && wc -l docs/contributing.md
```

Expected:
- README.md: 80-100 lines
- architecture.md: 200-250 lines
- contributing.md: 150-180 lines

- [ ] **Step 3: Verify cross-references are correct**

```bash
# Check for links to non-existent files
grep -r "\.md" README.md docs/architecture.md docs/contributing.md | grep -v "## " | head -20
```

Expected: All markdown links reference existing files

- [ ] **Step 4: Test in browser (optional but recommended)**

```bash
# Open in GitHub or a markdown viewer
# If using GitHub:
# 1. git push to your fork
# 2. Open the repo in browser
# 3. Verify all three docs render correctly
```

Expected: All three documents render properly, links work

- [ ] **Step 5: Final commit (if any adjustments needed)**

```bash
# If any minor adjustments were made
git add -A
git commit -m "docs: final adjustments to hierarchical README structure"
```

---

## Success Criteria

The implementation is successful when:

1. ✅ All three documentation files exist and are properly formatted
2. ✅ README.md provides a complete 2-3 minute overview
3. ✅ docs/architecture.md serves as a comprehensive technical reference
4. ✅ docs/contributing.md enables developers to contribute without confusion
5. ✅ All cross-references and links work correctly
6. ✅ Line counts are within specified ranges
7. ✅ Code examples are accurate, complete, and copy-pasteable
8. ✅ The structure is clear and easy to navigate

---

## References

- **Spec:** `docs/superpowers/specs/2026-03-23-hierarchical-readme-design.md`
- **AGENTS.md:** `AGENTS.md` — Detailed architecture specifications
- **Project Files:** `index.html`, `css/variables.css`, `css/main.css`, `css/landing.css`
