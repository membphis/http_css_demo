# AGENTS.md — http_css_demo

## Project Status

**Active** — NexusGateway landing page implemented. This document defines
the architecture and conventions for ongoing development.

## Target Stack

Static HTML + CSS only. No build tools, no bundler, no JavaScript.
Open `.html` files directly in a browser to preview.

## Target Structure

```
http_css_demo/
├── AGENTS.md
├── index.html              # NexusGateway landing page
├── pages/                  # Subpages go here
│   └── *.html
└── css/
    ├── reset.css           # Browser reset (box-sizing, list, anchor, media)
    ├── variables.css       # Design tokens (all CSS custom properties)
    ├── main.css            # Global styles (nav, buttons, footer, responsive)
    ├── landing.css         # Landing page specific styles
    └── <page>.css          # One per subpage (layout.css, components.css, etc.)
```

## Build / Lint / Test Commands

No build step, package manager, or test framework.

```bash
# Preview
xdg-open index.html            # Linux
open index.html                 # macOS

# Local server (optional)
python3 -m http.server 8000
npx serve .

# Lint (optional, not pre-configured)
npx htmlhint "**/*.html"
npx stylelint "css/**/*.css"
```

Validation is visual — open the page and inspect.

## Bootstrap Checklist

When creating the initial project, build files in this order:

1. `css/reset.css` — box-sizing, list-style, anchor, form-font-inherit resets
2. `css/variables.css` — all design tokens as `:root` custom properties
3. `css/main.css` — body, header/nav, content container, buttons, footer, responsive
4. `index.html` — home page linking reset → variables → main
5. Page-specific CSS + HTML as needed

## CSS Architecture

### File Load Order (mandatory in every HTML `<head>`)

1. `reset.css` — always first
2. `variables.css` — always second
3. `main.css` — always third
4. Page-specific CSS — always last

Root pages: `href="css/*.css"`. Pages in `pages/`: `href="../css/*.css"`.

### Design Tokens

All design values live in `css/variables.css` on `:root`.
Never hardcode hex colors, pixel font sizes, or magic-number spacing elsewhere.

| Prefix             | Purpose                  | Example                   |
|--------------------|--------------------------|---------------------------|
| `--color-*`        | Colors                   | `var(--color-primary)`    |
| `--font-size-*`    | Typography scale (xs–4xl)| `var(--font-size-lg)`     |
| `--font-weight-*`  | Weight (normal–bold)     | `var(--font-weight-bold)` |
| `--space-*`        | Spacing (1–16)           | `var(--space-4)`          |
| `--radius-*`       | Border radius (sm–full)  | `var(--radius-md)`        |
| `--shadow-*`       | Box shadows (sm–lg)      | `var(--shadow-sm)`        |
| `--transition-*`   | Durations (fast, base)   | `var(--transition-fast)`  |
| `--max-width`      | Content max width        |                           |
| `--header-height`  | Sticky header height     |                           |

Need a new value? Add the token to `variables.css` first, then reference it.

## Naming Conventions

### CSS Classes — BEM

```
.block              →  .card, .nav-bar, .site-header
.block__element     →  .card__title, .form__input
.block--modifier    →  .btn--primary, .alert--error
```

- Blocks: lowercase, hyphen-separated (`site-header`, `demo-section`)
- Elements: double underscore (`card__title`)
- Modifiers: double hyphen (`btn--outline`)
- Max one element level deep (no `.block__el__sub`)
- Multi-word names use hyphens, not camelCase

### HTML

- 2-space indentation, double quotes on all attributes
- `lang="en"` on `<html>`, `charset` + `viewport` meta tags required
- Semantic elements: `<header>`, `<nav>`, `<main>`, `<section>`, `<footer>`
- Subpage title format: `"Page Name - HTTP &amp; CSS Demo"`

### CSS

- 2-space indentation, one declaration per line
- Opening brace on same line as selector
- Blank line between rule blocks
- Section dividers in long files: `/* --- Section Name --- */`
- Property order: layout → box model → typography → visual → misc

## Responsive Design

- Single breakpoint: `768px`
- Desktop-first: `@media (max-width: 768px)` overrides
- Responsive blocks at the bottom of each CSS file
- Prefer `auto-fit` / `minmax()` grids for intrinsic responsiveness

## Adding a New Page

1. Create `pages/yourpage.html`
2. Copy `<head>` from an existing subpage (correct `../css/` paths)
3. Copy `<header>` and `<footer>` verbatim (shared nav/footer)
4. Mark active nav link with `nav-link--active`
5. Create `css/yourpage.css`, link it after `main.css`

## Adding a New Component

1. Define the base block class in the appropriate CSS file
2. Use tokens from `variables.css` — no hardcoded values
3. Add `:hover` / `:focus` states with transition tokens
4. Disabled: `opacity: 0.5; cursor: not-allowed`
5. Interactive hover: `:hover:not(:disabled)` pattern

## Reference Patterns

```css
/* Centered container */
.container {
  max-width: var(--max-width);
  margin: 0 auto;
  padding: 0 var(--space-6);
}

/* Card with hover lift */
.card {
  box-shadow: var(--shadow-sm);
  transition: box-shadow var(--transition-base), transform var(--transition-base);
}
.card:hover {
  box-shadow: var(--shadow-md);
  transform: translateY(-2px);
}

/* Focus ring */
.input:focus {
  outline: none;
  border-color: var(--color-primary);
  box-shadow: 0 0 0 3px rgba(37, 99, 235, 0.15);
}
```

## Do NOT

- Use inline styles
- Use `!important`
- Use `id` selectors for styling
- Hardcode colors, font sizes, or spacing — always use `var(--token)`
- Add JavaScript unless the task explicitly requires it
- Introduce build tools (Sass, PostCSS, bundlers) without discussion
- Modify `reset.css` unless fixing a cross-browser rendering bug
