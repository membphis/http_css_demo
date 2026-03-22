# Hierarchical README Design

**Date:** 2026-03-23
**Project:** HTTP & CSS Demo — AISIX
**Type:** Documentation Architecture

---

## Overview

Design a hierarchical documentation structure consisting of three markdown documents to provide clear, accessible developer documentation for the static HTML + CSS demo project.

**Problem:** The project lacks a README.md, making it difficult for newcomers to understand the project structure, and for contributors to know how to extend it effectively.

**Solution:** Create three complementary documentation files with clear navigation and cross-references, serving different audiences and use cases.

---

## Document Structure

### Files to Create

1. **README.md** (root, ~80-100 lines)
   - Purpose: Quick onboarding for anyone checking out the repo
   - Audience: First-time visitors, potential contributors
   - Focus: What this is, how to try it, where to learn more

2. **docs/architecture.md** (~200-250 lines)
   - Purpose: Complete technical reference for developers
   - Audience: Contributors, anyone working on the codebase
   - Focus: CSS architecture, conventions, design tokens, patterns

3. **docs/contributing.md** (~150-180 lines)
   - Purpose: How to contribute effectively
   - Audience: People wanting to add features or fix bugs
   - Focus: Adding pages, components, workflow, best practices

### Navigation Flow

```
README.md
  └─→ Links to architecture.md (deep dive)
  └─→ Links to contributing.md (how to contribute)

architecture.md
  └─→ References AGENTS.md (detailed conventions)

contributing.md
  └─→ References architecture.md (when explaining patterns)
```

---

## Content Specifications

### README.md

#### Sections:

1. **Overview** — Brief description, tech stack, project status
2. **Quick Start** — Open index.html, optional local server commands
3. **Project Structure** — Directory tree, css/ and pages/ explanation
4. **Documentation** — Links to architecture.md, contributing.md, AGENTS.md
5. **Key Features** — Responsive design, BEM naming, design tokens, interactive components
6. **Browser Support** — Modern browsers
7. **License** — MIT

#### Tone: Welcoming and accessible, emphasize immediate value

#### Outline:

```markdown
# HTTP & CSS Demo — AISIX

## Overview
- Static HTML + CSS demo landing page
- Pure HTML + CSS, no build tools
- Active: AISIX landing page implemented

## Quick Start
- Open index.html directly in browser
- Optional: python3 -m http.server 8000
- Immediate preview experience

## Project Structure
- Directory tree
- Brief explanation of css/ and pages/ folders

## Documentation
- [Architecture & Conventions](docs/architecture.md)
- [Contributing Guide](docs/contributing.md)
- [AGENTS.md](AGENTS.md) — Detailed Architecture Specs

## Key Features
- Responsive design (768px breakpoint)
- BEM naming convention
- Design tokens system
- Interactive components (CSS-only)

## Browser Support
- Modern browsers

## License
- MIT
```

---

### docs/architecture.md

#### Sections:

1. **CSS Architecture**
   - File load order (mandatory)
   - Design tokens system (all custom properties)
   - Token reference table (colors, spacing, typography, etc.)

2. **Naming Conventions**
   - HTML conventions (semantic tags, indentation)
   - CSS conventions (BEM, property order)
   - File naming

3. **Component Patterns**
   - Container pattern
   - Card pattern
   - Button variants
   - Focus rings
   - Hover states

4. **Responsive Design**
   - Desktop-first approach
   - 768px breakpoint
   - Grid patterns

5. **Design Principles**
   - YAGNI, no inline styles, no !important
   - Token-first development
   - Reference code snippets

#### Tone: Technical but approachable, reference actual project code

#### Outline:

```markdown
# Architecture & Conventions

## CSS Architecture

### File Load Order (Mandatory)
1. reset.css — always first
2. variables.css — always second
3. main.css — always third
4. Page-specific CSS — always last

Root pages: href="css/*.css"
Pages in pages/: href="../css/*.css"

### Design Tokens System
All design values live in css/variables.css on :root.
Never hardcode hex colors, pixel font sizes, or magic-number spacing.

### Design Tokens Reference

| Prefix         | Purpose                    | Example                    |
|----------------|----------------------------|----------------------------|
| --color-*      | Colors                     | var(--color-primary)      |
| --font-size-*  | Typography scale (xs–4xl)  | var(--font-size-lg)       |
| --font-weight*| Weight (normal–bold)       | var(--font-weight-bold)   |
| --space-*      | Spacing (1–16)             | var(--space-4)            |
| --radius-*     | Border radius (sm–full)    | var(--radius-md)          |
| --shadow-*     | Box shadows (sm–lg)        | var(--shadow-sm)          |
| --transition-* | Durations (fast, base)     | var(--transition-fast)    |
| --max-width    | Content max width          |                            |
| --header-height| Sticky header height       |                            |

## Naming Conventions

### HTML Conventions
- 2-space indentation, double quotes on all attributes
- lang="en" on <html>, charset + viewport meta tags required
- Semantic elements: <header>, <nav>, <main>, <section>, <footer>
- Subpage title format: "Page Name - HTTP &amp; CSS Demo"

### CSS Conventions — BEM
- Blocks: lowercase, hyphen-separated (site-header, demo-section)
- Elements: double underscore (card__title)
- Modifiers: double hyphen (btn--outline)
- Max one element level deep (no .block__el__sub)
- Multi-word names use hyphens, not camelCase

### Property Order
Layout → Box Model → Typography → Visual → Misc

## Component Patterns

### Centered Container
```css
.container {
  max-width: var(--max-width);
  margin: 0 auto;
  padding: 0 var(--space-6);
}
```

### Card with Hover Lift
```css
.card {
  box-shadow: var(--shadow-sm);
  transition: box-shadow var(--transition-base), transform var(--transition-base);
}
.card:hover {
  box-shadow: var(--shadow-md);
  transform: translateY(-2px);
}
```

### Focus Ring
```css
.input:focus {
  outline: none;
  border-color: var(--color-primary);
  box-shadow: 0 0 0 3px rgba(37, 99, 235, 0.15);
}
```

## Responsive Design

### Breakpoint
- Single breakpoint: 768px
- Desktop-first: @media (max-width: 768px) overrides
- Responsive blocks at the bottom of each CSS file
- Prefer auto-fit / minmax() grids for intrinsic responsiveness

## Design Principles

### Do NOT
- Use inline styles
- Use !important
- Use id selectors for styling
- Hardcode colors, font sizes, or spacing
- Add JavaScript unless explicitly required
- Introduce build tools without discussion

## Related Documentation

- [Contributing Guide](contributing.md) — How to apply these patterns when adding features
- [AGENTS.md](../AGENTS.md) — Complete architecture specifications
```

---

### docs/contributing.md

#### Sections:

1. **Prerequisites**
   - What you need (text editor, browser)
   - No package manager or build tools

2. **Development Workflow**
   - Making changes
   - Previewing locally
   - Linting (optional tools)

3. **Adding a New Page**
   - Step-by-step instructions
   - Copy head/footer from existing
   - Update nav links

4. **Adding a New Component**
   - Define in appropriate CSS file
   - Use design tokens
   - Add hover/focus states

5. **Common Patterns**
   - Centered content
   - Cards with hover effects
   - Code blocks
   - Responsive grids

6. **Code Quality**
   - Follow BEM naming
   - No hardcoded values
   - Use semantic HTML

#### Tone: Encouraging and instructional, step-by-step flow

#### Outline:

```markdown
# Contributing Guide

## Prerequisites

First, familiarize yourself with the architecture:
- [Architecture & Conventions](architecture.md) — CSS patterns and design tokens
- [AGENTS.md](../AGENTS.md) — Detailed specifications

What you need:
- A text editor (VS Code, Sublime Text, etc.)
- A modern web browser (Chrome, Firefox, Safari, Edge)
- No package manager, build tools, or server required

## Development Workflow

### Making Changes
1. Edit HTML or CSS files directly
2. Save your changes
3. Refresh the browser to see updates

### Previewing Locally
- **Direct open:** Double-click index.html or right-click → "Open with browser"
- **Local server (optional):**
  ```bash
  python3 -m http.server 8000
  # Then visit http://localhost:8000
  ```

### Linting (Optional)
Not required, but if you want to use linters:
```bash
npx htmlhint "**/*.html"
npx stylelint "css/**/*.css"
```

## Adding a New Page

### Step-by-Step

1. Create the page file
   ```bash
   # Create pages/yourpage.html
   ```

2. Copy the head from an existing page
   - Use `pages/` pages if you need the correct `../css/` paths
   - Include all CSS files in order: reset → variables → main → yourpage.css

3. Copy header and footer
   - Copy `<header>` and `<footer>` verbatim from existing pages
   - Mark the active nav link with `nav-link--active`

4. Create page-specific CSS
   - Create `css/yourpage.css`
   - Link it after `main.css` in the head

5. Update navigation
   - Add link to `site-header__nav` in `main.css` or your page CSS
   - Add link to `site-footer__nav` in `main.css`

## Adding a New Component

### Step-by-Step

1. Define the base block class
   - Choose the appropriate CSS file (main.css for global, page-specific for single page)
   - Define the block class with BEM naming

2. Use design tokens
   - Never hardcode colors, spacing, or font sizes
   - Reference tokens from the [Design Tokens table](architecture.md#design-tokens-reference)
   - Add new tokens to `variables.css` if needed

3. Add hover and focus states
   - Use transition tokens for smooth animations
   - Example: `.btn:hover:not(:disabled)` pattern

4. Disabled states
   - Use pattern: `opacity: 0.5; cursor: not-allowed;`

5. Test responsively
   - Test at desktop (768px+) and mobile (768px and below)
   - Add `@media (max-width: 768px)` overrides if needed

## Common Patterns

### Centered Content
Use the container class from main.css:
```html
<div class="container">
  <h1>Section Title</h1>
  <p>Content goes here</p>
</div>
```

### Cards with Hover Effects
```html
<div class="feature-card">
  <h3 class="feature-card__title">Title</h3>
  <p class="feature-card__desc">Description</p>
</div>
```

### Code Blocks
Use syntax highlighting classes:
```html
<pre><code><span class="tok-keyword">import</span> <span class="tok-name">openai</span></code></pre>
```

### Responsive Grids
```css
.grid {
  display: grid;
  grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
  gap: var(--space-6);
}
```

## Code Quality

### Naming
- Use BEM naming: `.block`, `.block__element`, `.block--modifier`
- Use kebab-case for multi-word names

### No Hardcoded Values
- Always use `var(--token)` for colors, spacing, fonts
- Add new tokens to `variables.css` if needed

### Semantic HTML
- Use proper semantic elements: <header>, <nav>, <main>, <section>, <footer>
- Include proper meta tags and aria labels where needed

### Clean CSS
- One declaration per line
- Blank line between rule blocks
- Section dividers in long files: /* --- Section Name --- */

## Quick Reference

When adding components, reference:
- [Design Tokens in architecture.md](architecture.md#design-tokens-reference)
- [Component Patterns in architecture.md](architecture.md#component-patterns)
- [Responsive Design in architecture.md](architecture.md#responsive-design)
```

---

## Navigation & Cross-References

### README.md Links:
```markdown
## Documentation
- [Architecture & Conventions](docs/architecture.md) — Deep dive into CSS architecture, design tokens, and patterns
- [Contributing Guide](docs/contributing.md) — How to add pages, components, and contribute effectively
- [AGENTS.md](AGENTS.md) — Detailed architecture specifications and development guidelines
```

### docs/architecture.md Links:
```markdown
## Related Documentation
- [Contributing Guide](contributing.md) — How to apply these patterns when adding features
- [AGENTS.md](../AGENTS.md) — Complete architecture specifications

## Next Steps
- Read the [Contributing Guide](contributing.md) to start building
```

### docs/contributing.md Links:
```markdown
## Prerequisites
First, familiarize yourself with the architecture:
- [Architecture & Conventions](architecture.md) — CSS patterns and design tokens
- [AGENTS.md](../AGENTS.md) — Detailed specifications

## Quick Reference
When adding components, reference:
- [Design Tokens in architecture.md](architecture.md#design-tokens-reference)
- [Component Patterns in architecture.md](architecture.md#component-patterns)
```

---

## Tone & Style Guidelines

### For All Documents:
- Clear, direct language (no unnecessary jargon)
- Practical, action-oriented
- Examples alongside explanations
- Code snippets with context

### Specific Tones:

**README.md:**
- Welcoming and accessible
- "You can..." rather than "Users should..."
- Emphasize immediate value
- Include emoji sparingly (only if helpful)

**docs/architecture.md:**
- Technical but approachable
- "Here's how it works" approach
- Reference code from the actual project
- Include "Do NOT" anti-patterns from AGENTS.md

**docs/contributing.md:**
- Encouraging and instructional
- Step-by-step flow
- Include success criteria ("You'll know it's working when...")
- Troubleshooting tips

### Code Examples:
- Always show complete, runnable examples
- Use actual code from the project where possible
- Highlight key tokens/patterns in explanations
- Keep examples minimal but complete

### Formatting Consistency:
- Code blocks with language specifiers
- Tables for token references
- Numbered lists for step-by-step
- Bulleted lists for options/examples
- Section headers (H2/H3) for scannability

---

## Success Criteria

The documentation structure is successful when:

1. **README.md** provides a complete 2-3 minute overview for anyone visiting the repo
2. **docs/architecture.md** serves as a comprehensive technical reference for contributors
3. **docs/contributing.md** enables developers to add pages and components without confusion
4. Navigation between documents is intuitive and consistent
5. Code examples are accurate, complete, and copy-pasteable
6. Cross-references help users find related information quickly

---

## Implementation Notes

### Files to Create:
- `README.md` (root)
- `docs/architecture.md`
- `docs/contributing.md`

### References:
- AGENTS.md for architecture details and conventions
- Existing CSS files for code examples
- index.html for project structure and features

### No Dependencies Required:
- Pure markdown files
- No build tools or generators
- Compatible with GitHub markdown rendering

---

## Future Considerations

If the project grows significantly, consider:
- Splitting architecture.md into smaller topic-specific docs
- Adding a docs/ index page for better navigation
- Creating visual diagrams for architecture overview
- Adding troubleshooting or FAQ section
- Versioning documentation if breaking changes are introduced

However, for the current scope, the three-file hierarchical structure is appropriate and sufficient.
