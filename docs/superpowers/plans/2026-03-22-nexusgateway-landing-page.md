# AISIX AI Gateway 落地页实现计划

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** 创建 AISIX AI Gateway 开源 AI Gateway 的官方落地页，包含 Hero、Features、Code Snippet、GitHub CTA 四个核心区块。

**Architecture:** 纯静态 HTML + CSS，单页 `index.html`，样式拆分为 4 个 CSS 文件按顺序加载（reset → variables → main → landing）。无 JavaScript，Tab 切换通过隐藏 radio input + CSS `:checked` 兄弟选择器实现。

**Tech Stack:** HTML5、CSS3（自定义属性、Grid、Flexbox、CSS 选择器技巧），无构建工具，无框架。

---

## 文件结构

| 文件 | 职责 |
|---|---|
| `css/reset.css` | 浏览器样式重置（box-sizing、list-style、anchor、表单字体继承） |
| `css/variables.css` | 全部设计 token（颜色、字号、间距、圆角、阴影、过渡） |
| `css/main.css` | 全局样式（body、header/nav、.container、.btn、footer、响应式） |
| `css/landing.css` | 页面专属样式（hero、features、code-demo、cta-github 各区块） |
| `index.html` | 页面结构与内容，按顺序引入以上 4 个 CSS 文件 |

---

## Task 1: css/reset.css

**Files:**
- Create: `css/reset.css`

- [ ] **Step 1: 创建 reset.css**

```css
/* css/reset.css */
*,
*::before,
*::after {
  box-sizing: border-box;
  margin: 0;
  padding: 0;
}

ul,
ol {
  list-style: none;
}

a {
  color: inherit;
  text-decoration: none;
}

img,
svg {
  display: block;
  max-width: 100%;
}

button,
input,
select,
textarea {
  font: inherit;
}

html {
  scroll-behavior: smooth;
}
```

- [ ] **Step 2: 验证文件存在**

```bash
ls -la css/reset.css
```

期望输出：文件存在，大小 > 0。

- [ ] **Step 3: 提交**

```bash
git add css/reset.css
git commit -m "feat: add CSS reset"
```

---

## Task 2: css/variables.css

**Files:**
- Create: `css/variables.css`

- [ ] **Step 1: 创建 variables.css**

```css
/* css/variables.css */
:root {
  /* --- Colors --- */
  --color-bg: #0f172a;
  --color-surface: #1e293b;
  --color-surface-2: #020617;
  --color-border: #334155;
  --color-border-accent: rgba(249, 115, 22, 0.25);

  --color-primary: #f97316;
  --color-primary-hover: #ea580c;
  --color-primary-2: #ef4444;

  --color-text: #f8fafc;
  --color-text-muted: #94a3b8;
  --color-text-faint: #475569;

  --color-accent-blue: #60a5fa;
  --color-accent-green: #34d399;
  --color-accent-purple: #a78bfa;

  /* --- Typography --- */
  --font-ui: -apple-system, BlinkMacSystemFont, 'Segoe UI', sans-serif;
  --font-code: 'JetBrains Mono', 'Fira Code', 'Cascadia Code', monospace;

  --font-size-xs: 0.75rem;
  --font-size-sm: 0.875rem;
  --font-size-base: 1rem;
  --font-size-lg: 1.125rem;
  --font-size-xl: 1.25rem;
  --font-size-2xl: 1.5rem;
  --font-size-3xl: 1.875rem;
  --font-size-4xl: 2.25rem;

  --font-weight-normal: 400;
  --font-weight-medium: 500;
  --font-weight-semibold: 600;
  --font-weight-bold: 700;
  --font-weight-extrabold: 800;

  /* --- Spacing --- */
  --space-1: 0.25rem;
  --space-2: 0.5rem;
  --space-3: 0.75rem;
  --space-4: 1rem;
  --space-5: 1.25rem;
  --space-6: 1.5rem;
  --space-8: 2rem;
  --space-10: 2.5rem;
  --space-12: 3rem;
  --space-16: 4rem;

  /* --- Border Radius --- */
  --radius-sm: 0.25rem;
  --radius-md: 0.5rem;
  --radius-lg: 0.75rem;
  --radius-xl: 1rem;
  --radius-full: 9999px;

  /* --- Shadows --- */
  --shadow-sm: 0 1px 3px rgba(0, 0, 0, 0.4);
  --shadow-md: 0 4px 12px rgba(0, 0, 0, 0.5);
  --shadow-lg: 0 8px 32px rgba(0, 0, 0, 0.6);

  /* --- Transitions --- */
  --transition-fast: 150ms ease;
  --transition-base: 250ms ease;

  /* --- Layout --- */
  --max-width: 1100px;
  --header-height: 64px;

  /* --- Composite tokens --- */
  --color-header-bg: rgba(15, 23, 42, 0.85);
}
```

- [ ] **Step 2: 验证文件存在**

```bash
ls -la css/variables.css
```

- [ ] **Step 3: 提交**

```bash
git add css/variables.css
git commit -m "feat: add design tokens to variables.css"
```

---

## Task 3: css/main.css

**Files:**
- Create: `css/main.css`

- [ ] **Step 1: 创建 main.css**

```css
/* css/main.css */

/* --- Base --- */
body {
  font-family: var(--font-ui);
  font-size: var(--font-size-base);
  color: var(--color-text);
  background-color: var(--color-bg);
  line-height: 1.6;
}

/* --- Container --- */
.container {
  max-width: var(--max-width);
  margin: 0 auto;
  padding: 0 var(--space-6);
}

/* --- Buttons --- */
.btn {
  display: inline-flex;
  align-items: center;
  gap: var(--space-2);
  padding: var(--space-3) var(--space-6);
  border-radius: var(--radius-md);
  font-size: var(--font-size-sm);
  font-weight: var(--font-weight-semibold);
  cursor: pointer;
  border: 2px solid transparent;
  transition: background-color var(--transition-fast),
              border-color var(--transition-fast),
              transform var(--transition-fast);
}

.btn:hover:not(:disabled) {
  transform: translateY(-1px);
}

.btn:disabled {
  opacity: 0.5;
  cursor: not-allowed;
}

.btn--primary {
  background: linear-gradient(90deg, var(--color-primary), var(--color-primary-2));
  color: #fff;
  border-color: transparent;
}

.btn--primary:hover:not(:disabled) {
  background: linear-gradient(90deg, var(--color-primary-hover), var(--color-primary-2));
}

.btn--outline {
  background: transparent;
  color: var(--color-text-muted);
  border-color: var(--color-border);
}

.btn--outline:hover:not(:disabled) {
  border-color: var(--color-primary);
  color: var(--color-text);
}

/* --- Site Header --- */
.site-header {
  position: sticky;
  top: 0;
  height: var(--header-height);
  z-index: 100;
  background-color: var(--color-header-bg);
  backdrop-filter: blur(12px);
  -webkit-backdrop-filter: blur(12px);
  border-bottom: 1px solid var(--color-border);
}

.site-header__inner {
  display: flex;
  align-items: center;
  justify-content: space-between;
  height: 100%;
}

.site-header__logo {
  display: flex;
  align-items: center;
  gap: var(--space-2);
  font-weight: var(--font-weight-bold);
  font-size: var(--font-size-lg);
  color: var(--color-primary);
}

.site-header__logo-icon {
  width: 28px;
  height: 28px;
  background: linear-gradient(135deg, var(--color-primary), var(--color-primary-2));
  border-radius: var(--radius-md);
  display: flex;
  align-items: center;
  justify-content: center;
  font-size: var(--font-size-sm);
}

.site-header__nav {
  display: flex;
  align-items: center;
  gap: var(--space-8);
}

.nav-link {
  font-size: var(--font-size-sm);
  color: var(--color-text-muted);
  transition: color var(--transition-fast);
}

.nav-link:hover {
  color: var(--color-text);
}

.nav-link--active {
  color: var(--color-text);
}

/* --- Site Footer --- */
.site-footer {
  border-top: 1px solid var(--color-border);
  padding: var(--space-12) 0 var(--space-8);
  margin-top: var(--space-16);
}

.site-footer__inner {
  display: flex;
  align-items: flex-start;
  justify-content: space-between;
  gap: var(--space-8);
  margin-bottom: var(--space-8);
}

.site-footer__brand {
  display: flex;
  align-items: center;
  gap: var(--space-2);
  font-weight: var(--font-weight-bold);
  color: var(--color-primary);
  margin-bottom: var(--space-2);
}

.site-footer__tagline {
  font-size: var(--font-size-sm);
  color: var(--color-text-faint);
}

.site-footer__nav {
  display: flex;
  gap: var(--space-6);
}

.site-footer__nav a {
  font-size: var(--font-size-sm);
  color: var(--color-text-muted);
  transition: color var(--transition-fast);
}

.site-footer__nav a:hover {
  color: var(--color-text);
}

.site-footer__meta {
  font-size: var(--font-size-sm);
  color: var(--color-text-faint);
  text-align: right;
}

.site-footer__copy {
  border-top: 1px solid var(--color-border);
  padding-top: var(--space-6);
  font-size: var(--font-size-xs);
  color: var(--color-text-faint);
  text-align: center;
}

/* --- Responsive --- */
@media (max-width: 768px) {
  .site-header__nav {
    flex-direction: column;
    align-items: flex-start;
    gap: var(--space-3);
    position: absolute;
    top: var(--header-height);
    left: 0;
    right: 0;
    background-color: var(--color-surface);
    border-bottom: 1px solid var(--color-border);
    padding: var(--space-4) var(--space-6);
  }

  .site-footer__inner {
    flex-direction: column;
    gap: var(--space-6);
  }

  .site-footer__meta {
    text-align: left;
  }
}
```

- [ ] **Step 2: 验证文件存在**

```bash
ls -la css/main.css
```

- [ ] **Step 3: 提交**

```bash
git add css/main.css
git commit -m "feat: add global styles — header, footer, buttons, container"
```

---

## Task 4: css/landing.css — Hero 区块

**Files:**
- Create: `css/landing.css`（仅写 Hero 相关样式）

- [ ] **Step 1: 创建 landing.css，写入 Hero 样式**

```css
/* css/landing.css */

/* --- Hero --- */
.hero {
  position: relative;
  min-height: 100vh;
  display: flex;
  align-items: center;
  justify-content: center;
  overflow: hidden;
  text-align: center;
  padding: var(--space-16) var(--space-6);
}

.hero__glow-1 {
  position: absolute;
  top: -80px;
  right: -80px;
  width: 480px;
  height: 480px;
  background: radial-gradient(circle, rgba(249, 115, 22, 0.18) 0%, transparent 70%);
  border-radius: var(--radius-full);
  pointer-events: none;
}

.hero__glow-2 {
  position: absolute;
  bottom: -60px;
  left: -60px;
  width: 360px;
  height: 360px;
  background: radial-gradient(circle, rgba(96, 165, 250, 0.12) 0%, transparent 70%);
  border-radius: var(--radius-full);
  pointer-events: none;
}

.hero__content {
  position: relative;
  z-index: 1;
  max-width: 720px;
  margin: 0 auto;
}

.hero__badge {
  display: inline-block;
  padding: var(--space-1) var(--space-4);
  border: 1px solid var(--color-border-accent);
  background: rgba(249, 115, 22, 0.08);
  color: var(--color-primary);
  border-radius: var(--radius-full);
  font-size: var(--font-size-xs);
  font-family: var(--font-code);
  letter-spacing: 0.1em;
  margin-bottom: var(--space-6);
}

.hero__title {
  font-size: var(--font-size-4xl);
  font-weight: var(--font-weight-extrabold);
  line-height: 1.15;
  margin-bottom: var(--space-4);
  color: var(--color-text);
}

.hero__title-gradient {
  background: linear-gradient(90deg, var(--color-primary), var(--color-primary-2));
  -webkit-background-clip: text;
  -webkit-text-fill-color: transparent;
  background-clip: text;
}

.hero__subtitle {
  font-size: var(--font-size-lg);
  color: var(--color-text-muted);
  margin-bottom: var(--space-8);
  line-height: 1.6;
}

.hero__cta {
  display: flex;
  align-items: center;
  justify-content: center;
  gap: var(--space-4);
  margin-bottom: var(--space-8);
}

.hero__social-proof {
  display: flex;
  align-items: center;
  justify-content: center;
  gap: var(--space-6);
  font-size: var(--font-size-sm);
  color: var(--color-text-faint);
}

/* --- Responsive: Hero --- */
@media (max-width: 768px) {
  .hero__title {
    font-size: var(--font-size-2xl);
  }

  .hero__subtitle {
    font-size: var(--font-size-base);
  }

  .hero__cta {
    flex-direction: column;
    align-items: stretch;
  }

  .hero__social-proof {
    flex-direction: column;
    gap: var(--space-2);
  }
}
```

- [ ] **Step 2: 验证文件存在**

```bash
ls -la css/landing.css
```

- [ ] **Step 3: 提交**

```bash
git add css/landing.css
git commit -m "feat: add hero section styles to landing.css"
```

---

## Task 5: css/landing.css — Features、Code Demo、CTA、Footer 区块样式

**Files:**
- Modify: `css/landing.css`（追加剩余区块样式）

- [ ] **Step 1: 追加 Features 区块样式**

在 `css/landing.css` 末尾追加：

```css
/* --- Features --- */
.features {
  padding: var(--space-16) var(--space-6);
}

.section-header {
  text-align: center;
  margin-bottom: var(--space-12);
}

.section-header__label {
  display: inline-block;
  font-size: var(--font-size-xs);
  font-weight: var(--font-weight-semibold);
  letter-spacing: 0.12em;
  text-transform: uppercase;
  color: var(--color-primary);
  margin-bottom: var(--space-3);
}

.section-header__title {
  font-size: var(--font-size-3xl);
  font-weight: var(--font-weight-bold);
  color: var(--color-text);
  margin-bottom: var(--space-4);
}

.section-header__subtitle {
  font-size: var(--font-size-base);
  color: var(--color-text-muted);
  max-width: 520px;
  margin: 0 auto;
}

.features__grid {
  display: grid;
  grid-template-columns: repeat(3, 1fr);
  gap: var(--space-6);
}

.feature-card {
  position: relative;
  overflow: hidden;
  background: linear-gradient(135deg, var(--color-surface), var(--color-bg));
  border: 1px solid var(--color-border);
  border-radius: var(--radius-lg);
  padding: var(--space-6);
  transition: transform var(--transition-base),
              border-color var(--transition-base),
              box-shadow var(--transition-base);
}

.feature-card:hover {
  transform: translateY(-3px);
  border-color: var(--color-border-accent);
  box-shadow: var(--shadow-md);
}

.feature-card__glow {
  position: absolute;
  top: -20px;
  right: -20px;
  width: 80px;
  height: 80px;
  border-radius: var(--radius-full);
  pointer-events: none;
}

.feature-card__icon {
  font-size: var(--font-size-2xl);
  margin-bottom: var(--space-4);
  display: block;
}

.feature-card__title {
  font-size: var(--font-size-base);
  font-weight: var(--font-weight-semibold);
  color: var(--color-text);
  margin-bottom: var(--space-2);
}

.feature-card__desc {
  font-size: var(--font-size-sm);
  color: var(--color-text-muted);
  line-height: 1.6;
}

/* Feature card glow color modifiers */
.feature-card__glow--orange {
  background: radial-gradient(circle, rgba(249, 115, 22, 0.2), transparent 70%);
}

.feature-card__glow--blue {
  background: radial-gradient(circle, rgba(96, 165, 250, 0.2), transparent 70%);
}

.feature-card__glow--green {
  background: radial-gradient(circle, rgba(52, 211, 153, 0.2), transparent 70%);
}

.feature-card__glow--purple {
  background: radial-gradient(circle, rgba(167, 139, 250, 0.2), transparent 70%);
}

.feature-card__glow--orange-light {
  background: radial-gradient(circle, rgba(249, 115, 22, 0.15), transparent 70%);
}

.feature-card__glow--blue-light {
  background: radial-gradient(circle, rgba(96, 165, 250, 0.15), transparent 70%);
}

@media (max-width: 768px) {
  .features__grid {
    grid-template-columns: 1fr;
  }
}
```

- [ ] **Step 2: 追加 Code Demo 区块样式**

```css
/* --- Code Demo --- */
.code-demo {
  padding: var(--space-16) var(--space-6);
}

.code-window {
  max-width: 720px;
  margin: 0 auto;
  background: var(--color-surface-2);
  border: 1px solid var(--color-border);
  border-radius: var(--radius-lg);
  overflow: hidden;
  box-shadow: var(--shadow-lg);
}

.code-window__chrome {
  display: flex;
  align-items: center;
  gap: var(--space-3);
  background: var(--color-surface);
  padding: var(--space-3) var(--space-4);
  border-bottom: 1px solid var(--color-border);
}

.code-window__dots {
  display: flex;
  gap: var(--space-2);
}

.code-window__dot {
  width: 10px;
  height: 10px;
  border-radius: var(--radius-full);
}

.code-window__dot--red   { background: #ef4444; }
.code-window__dot--yellow { background: #f59e0b; }
.code-window__dot--green  { background: #22c55e; }

/* Tab radio inputs (hidden) */
.code-tab__input {
  display: none;
}

/* Tab labels */
.code-tabs {
  display: flex;
  gap: 0;
  margin-left: auto;
}

.code-tab__label {
  padding: var(--space-1) var(--space-4);
  font-size: var(--font-size-sm);
  font-family: var(--font-code);
  color: var(--color-text-faint);
  cursor: pointer;
  border-radius: var(--radius-sm);
  transition: color var(--transition-fast), background var(--transition-fast);
}

.code-tab__label:hover {
  color: var(--color-text-muted);
}

/* Active tab state via :checked sibling selector */
#tab-python:checked ~ .code-window .code-tab__label[for="tab-python"],
#tab-node:checked   ~ .code-window .code-tab__label[for="tab-node"],
#tab-curl:checked   ~ .code-window .code-tab__label[for="tab-curl"] {
  color: var(--color-primary);
  background: rgba(249, 115, 22, 0.1);
}

/* Code panels: all hidden by default */
.code-panel {
  display: none;
  padding: var(--space-6);
  font-family: var(--font-code);
  font-size: var(--font-size-sm);
  line-height: 1.8;
  overflow-x: auto;
}

/* Show active panel */
#tab-python:checked ~ .code-window #panel-python,
#tab-node:checked   ~ .code-window #panel-node,
#tab-curl:checked   ~ .code-window #panel-curl {
  display: block;
}

/* Syntax color helpers */
.tok-keyword  { color: var(--color-accent-purple); }
.tok-string   { color: var(--color-accent-green); }
.tok-name     { color: var(--color-text); }
.tok-func     { color: var(--color-accent-blue); }
.tok-comment  { color: var(--color-text-faint); }
.tok-param    { color: var(--color-primary); }
.tok-punct    { color: var(--color-text-muted); }

.code-demo__note {
  text-align: center;
  margin-top: var(--space-6);
  font-size: var(--font-size-sm);
  color: var(--color-text-muted);
}

.code-demo__note strong {
  color: var(--color-text);
}

@media (max-width: 768px) {
  .code-window {
    font-size: var(--font-size-xs);
  }

  .code-panel {
    padding: var(--space-4);
    font-size: var(--font-size-xs);
  }
}
```

- [ ] **Step 3: 追加 GitHub CTA 横幅样式**

```css
/* --- GitHub CTA Banner --- */
.cta-github {
  position: relative;
  overflow: hidden;
  margin: var(--space-16) 0 0;
  padding: var(--space-16) var(--space-6);
  background: var(--color-surface);
  border-top: 1px solid var(--color-border);
  border-bottom: 1px solid var(--color-border);
  text-align: center;
}

.cta-github__glow {
  position: absolute;
  top: 50%;
  left: 50%;
  transform: translate(-50%, -50%);
  width: 600px;
  height: 300px;
  background: radial-gradient(ellipse, rgba(249, 115, 22, 0.1) 0%, transparent 70%);
  pointer-events: none;
}

.cta-github__content {
  position: relative;
  z-index: 1;
}

.cta-github__title {
  font-size: var(--font-size-3xl);
  font-weight: var(--font-weight-bold);
  color: var(--color-text);
  margin-bottom: var(--space-4);
}

.cta-github__subtitle {
  font-size: var(--font-size-base);
  color: var(--color-text-muted);
  margin-bottom: var(--space-8);
}

.cta-github__actions {
  display: flex;
  align-items: center;
  justify-content: center;
  gap: var(--space-4);
  margin-bottom: var(--space-8);
}

.cta-github__stats {
  display: flex;
  align-items: center;
  justify-content: center;
  gap: var(--space-6);
  font-size: var(--font-size-sm);
  color: var(--color-text-faint);
}

@media (max-width: 768px) {
  .cta-github__title {
    font-size: var(--font-size-2xl);
  }

  .cta-github__actions {
    flex-direction: column;
    align-items: stretch;
  }

  .cta-github__stats {
    flex-direction: column;
    gap: var(--space-2);
  }
}
```

- [ ] **Step 4: 验证 landing.css 包含所有区块**

```bash
grep "^/\* ---" css/landing.css
```

期望输出（4 行，每行对应一个区块）：
```
/* --- Hero --- */
/* --- Features --- */
/* --- Code Demo --- */
/* --- GitHub CTA Banner --- */
```

- [ ] **Step 5: 提交**

```bash
git add css/landing.css
git commit -m "feat: add features, code-demo, cta-github styles to landing.css"
```

---

## Task 6: index.html — 完整页面 HTML

**Files:**
- Create: `index.html`

**注意：** radio input 必须是 `.code-window` 的前置兄弟元素（在同一父容器下），`:checked ~ .code-window` 选择器才能生效。结构为：

```
<div class="code-demo__wrapper">
  <input id="tab-python" ...>
  <input id="tab-node" ...>
  <input id="tab-curl" ...>
  <div class="code-window">
    <div class="code-window__chrome">
      <div class="code-tabs">
        <label for="tab-python">Python</label>
        ...
      </div>
    </div>
    <div id="panel-python" class="code-panel">...</div>
    ...
  </div>
</div>
```

- [ ] **Step 1: 创建 index.html**

```html
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>AISIX AI Gateway — Open Source AI Gateway</title>
  <meta name="description" content="Route, secure and scale any AI provider with a single unified API. Open source, self-hostable AI Gateway.">
  <link rel="stylesheet" href="css/reset.css">
  <link rel="stylesheet" href="css/variables.css">
  <link rel="stylesheet" href="css/main.css">
  <link rel="stylesheet" href="css/landing.css">
</head>
<body>

  <!-- ==================== HEADER ==================== -->
  <header class="site-header">
    <div class="container site-header__inner">
      <a href="/" class="site-header__logo">
        <div class="site-header__logo-icon">⬡</div>
        AISIX AI Gateway
      </a>
      <nav class="site-header__nav">
        <a href="#features" class="nav-link">Features</a>
        <a href="#code-demo" class="nav-link">Docs</a>
        <a href="https://github.com/membphis/http_css_demo" target="_blank" rel="noopener" class="btn btn--outline">★ GitHub</a>
      </nav>
    </div>
  </header>

  <main>

    <!-- ==================== HERO ==================== -->
    <section class="hero">
      <div class="hero__glow-1"></div>
      <div class="hero__glow-2"></div>
      <div class="hero__content">
        <span class="hero__badge">v1.0 · OPEN SOURCE</span>
        <h1 class="hero__title">
          The AI Gateway for<br>
          <span class="hero__title-gradient">Production Teams</span>
        </h1>
        <p class="hero__subtitle">
          Route. Secure. Scale. Any AI Provider.<br>
          统一接口管理 OpenAI、Anthropic、Gemini 等所有 AI 提供商
        </p>
        <div class="hero__cta">
          <a href="#code-demo" class="btn btn--primary">快速开始 →</a>
          <a href="https://github.com/membphis/http_css_demo" target="_blank" rel="noopener" class="btn btn--outline">★ GitHub</a>
        </div>
        <div class="hero__social-proof">
          <span>★ 2.3k stars</span>
          <span>MIT License</span>
          <span>v1.0.0</span>
        </div>
      </div>
    </section>

    <!-- ==================== FEATURES ==================== -->
    <section class="features" id="features">
      <div class="container">
        <div class="section-header">
          <span class="section-header__label">Features</span>
          <h2 class="section-header__title">一个网关，接管所有 AI</h2>
          <p class="section-header__subtitle">从路由到可观测性，AISIX AI Gateway 覆盖生产环境所需的一切</p>
        </div>
        <div class="features__grid">

          <div class="feature-card">
            <div class="feature-card__glow feature-card__glow--orange"></div>
            <span class="feature-card__icon">⚡</span>
            <h3 class="feature-card__title">智能路由</h3>
            <p class="feature-card__desc">基于延迟、成本、可用性自动选择最优 Provider，支持故障转移与负载均衡。</p>
          </div>

          <div class="feature-card">
            <div class="feature-card__glow feature-card__glow--blue"></div>
            <span class="feature-card__icon">🔒</span>
            <h3 class="feature-card__title">密钥管理</h3>
            <p class="feature-card__desc">集中管理所有 Provider 的 API Keys，细粒度权限控制，避免密钥泄露风险。</p>
          </div>

          <div class="feature-card">
            <div class="feature-card__glow feature-card__glow--green"></div>
            <span class="feature-card__icon">📊</span>
            <h3 class="feature-card__title">可观测性</h3>
            <p class="feature-card__desc">Token 用量、费用、延迟全链路追踪，实时监控 AI 调用情况。</p>
          </div>

          <div class="feature-card">
            <div class="feature-card__glow feature-card__glow--purple"></div>
            <span class="feature-card__icon">🔄</span>
            <h3 class="feature-card__title">限流与重试</h3>
            <p class="feature-card__desc">速率限制、自动重试、熔断器保护，确保服务在高压下的稳定性。</p>
          </div>

          <div class="feature-card">
            <div class="feature-card__glow feature-card__glow--orange-light"></div>
            <span class="feature-card__icon">🌐</span>
            <h3 class="feature-card__title">多 Provider</h3>
            <p class="feature-card__desc">统一接口接入 OpenAI、Anthropic、Gemini、Mistral 等主流 AI 提供商。</p>
          </div>

          <div class="feature-card">
            <div class="feature-card__glow feature-card__glow--blue-light"></div>
            <span class="feature-card__icon">🔌</span>
            <h3 class="feature-card__title">插件系统</h3>
            <p class="feature-card__desc">自定义中间件与扩展，灵活集成缓存、日志、鉴权等业务逻辑。</p>
          </div>

        </div>
      </div>
    </section>

    <!-- ==================== CODE DEMO ==================== -->
    <section class="code-demo" id="code-demo">
      <div class="container">
        <div class="section-header">
          <span class="section-header__label">Quick Start</span>
          <h2 class="section-header__title">几行代码，接入所有 AI</h2>
          <p class="section-header__subtitle">兼容 OpenAI SDK，无需修改现有代码</p>
        </div>

        <div class="code-demo__wrapper">
          <input type="radio" name="code-tab" id="tab-python" class="code-tab__input" checked>
          <input type="radio" name="code-tab" id="tab-node" class="code-tab__input">
          <input type="radio" name="code-tab" id="tab-curl" class="code-tab__input">

          <div class="code-window">
            <div class="code-window__chrome">
              <div class="code-window__dots">
                <span class="code-window__dot code-window__dot--red"></span>
                <span class="code-window__dot code-window__dot--yellow"></span>
                <span class="code-window__dot code-window__dot--green"></span>
              </div>
              <div class="code-tabs">
                <label for="tab-python" class="code-tab__label">Python</label>
                <label for="tab-node" class="code-tab__label">Node.js</label>
                <label for="tab-curl" class="code-tab__label">cURL</label>
              </div>
            </div>

            <div id="panel-python" class="code-panel">
<span class="tok-keyword">import</span> <span class="tok-name">openai</span>

<span class="tok-name">client</span> <span class="tok-punct">=</span> <span class="tok-name">openai</span><span class="tok-punct">.</span><span class="tok-func">OpenAI</span><span class="tok-punct">(</span>
    <span class="tok-param">base_url</span><span class="tok-punct">=</span><span class="tok-string">"http://localhost:8080/v1"</span><span class="tok-punct">,</span>
    <span class="tok-param">api_key</span><span class="tok-punct">=</span><span class="tok-string">"nex-your-key"</span>
<span class="tok-punct">)</span>

<span class="tok-name">response</span> <span class="tok-punct">=</span> <span class="tok-name">client</span><span class="tok-punct">.</span><span class="tok-name">chat</span><span class="tok-punct">.</span><span class="tok-name">completions</span><span class="tok-punct">.</span><span class="tok-func">create</span><span class="tok-punct">(</span>
    <span class="tok-param">model</span><span class="tok-punct">=</span><span class="tok-string">"gpt-4o"</span><span class="tok-punct">,</span>
    <span class="tok-param">messages</span><span class="tok-punct">=[{</span><span class="tok-string">"role"</span><span class="tok-punct">:</span> <span class="tok-string">"user"</span><span class="tok-punct">,</span> <span class="tok-string">"content"</span><span class="tok-punct">:</span> <span class="tok-string">"Hello!"</span><span class="tok-punct">}]</span>
<span class="tok-punct">)</span>
<span class="tok-comment"># 原生 OpenAI SDK，直接将 base_url 指向 AISIX AI Gateway 即可</span>
            </div>

            <div id="panel-node" class="code-panel">
<span class="tok-keyword">import</span> <span class="tok-name">OpenAI</span> <span class="tok-keyword">from</span> <span class="tok-string">'openai'</span><span class="tok-punct">;</span>

<span class="tok-keyword">const</span> <span class="tok-name">client</span> <span class="tok-punct">=</span> <span class="tok-keyword">new</span> <span class="tok-func">OpenAI</span><span class="tok-punct">({</span>
  <span class="tok-param">baseURL</span><span class="tok-punct">:</span> <span class="tok-string">'http://localhost:8080/v1'</span><span class="tok-punct">,</span>
  <span class="tok-param">apiKey</span><span class="tok-punct">:</span> <span class="tok-string">'nex-your-key'</span><span class="tok-punct">,</span>
<span class="tok-punct">});</span>

<span class="tok-keyword">const</span> <span class="tok-name">response</span> <span class="tok-punct">=</span> <span class="tok-keyword">await</span> <span class="tok-name">client</span><span class="tok-punct">.</span><span class="tok-name">chat</span><span class="tok-punct">.</span><span class="tok-name">completions</span><span class="tok-punct">.</span><span class="tok-func">create</span><span class="tok-punct">({</span>
  <span class="tok-param">model</span><span class="tok-punct">:</span> <span class="tok-string">'gpt-4o'</span><span class="tok-punct">,</span>
  <span class="tok-param">messages</span><span class="tok-punct">: [{</span> <span class="tok-param">role</span><span class="tok-punct">:</span> <span class="tok-string">'user'</span><span class="tok-punct">,</span> <span class="tok-param">content</span><span class="tok-punct">:</span> <span class="tok-string">'Hello!'</span> <span class="tok-punct">}],</span>
<span class="tok-punct">});</span>
<span class="tok-comment">// 零改动迁移——只需更换 baseURL</span>
            </div>

            <div id="panel-curl" class="code-panel">
<span class="tok-func">curl</span> <span class="tok-string">http://localhost:8080/v1/chat/completions</span> <span class="tok-punct">\</span>
  <span class="tok-param">-H</span> <span class="tok-string">"Authorization: Bearer nex-your-key"</span> <span class="tok-punct">\</span>
  <span class="tok-param">-H</span> <span class="tok-string">"Content-Type: application/json"</span> <span class="tok-punct">\</span>
  <span class="tok-param">-d</span> <span class="tok-string">'{
    "model": "gpt-4o",
    "messages": [{"role": "user", "content": "Hello!"}]
  }'</span>
            </div>
          </div>
        </div>

        <p class="code-demo__note">
          <strong>兼容 OpenAI SDK</strong> — 无需修改任何现有代码，直接替换 base_url 即可
        </p>
      </div>
    </section>

    <!-- ==================== GITHUB CTA ==================== -->
    <section class="cta-github">
      <div class="cta-github__glow"></div>
      <div class="container cta-github__content">
        <h2 class="cta-github__title">开源、免费、可自托管</h2>
        <p class="cta-github__subtitle">加入社区，一起构建下一代 AI 基础设施</p>
        <div class="cta-github__actions">
          <a href="https://github.com/membphis/http_css_demo" target="_blank" rel="noopener" class="btn btn--primary">★ Star on GitHub</a>
          <a href="https://github.com/membphis/http_css_demo#readme" target="_blank" rel="noopener" class="btn btn--outline">查看文档</a>
        </div>
        <div class="cta-github__stats">
          <span>★ 2.3k stars</span>
          <span>180 forks</span>
          <span>42 contributors</span>
        </div>
      </div>
    </section>

  </main>

  <!-- ==================== FOOTER ==================== -->
  <footer class="site-footer">
    <div class="container">
      <div class="site-footer__inner">
        <div>
          <div class="site-footer__brand">
            <span>⬡</span> AISIX AI Gateway
          </div>
          <p class="site-footer__tagline">Open Source AI Gateway</p>
        </div>
        <nav class="site-footer__nav">
          <a href="#features">Features</a>
          <a href="#code-demo">Docs</a>
          <a href="https://github.com/membphis/http_css_demo" target="_blank" rel="noopener">GitHub</a>
          <a href="https://github.com/membphis/http_css_demo/blob/main/LICENSE" target="_blank" rel="noopener">License</a>
        </nav>
        <p class="site-footer__meta">MIT License · Made with ♥ by the community</p>
      </div>
      <p class="site-footer__copy">© 2026 AISIX AI Gateway. Released under the MIT License.</p>
    </div>
  </footer>

</body>
</html>
```

- [ ] **Step 2: 在浏览器中打开页面，目视验证以下内容**

```bash
python3 -m http.server 8000
# 访问 http://localhost:8000
```

检查清单：
- [ ] Header 吸顶，Logo + 导航显示正常
- [ ] Hero 区光晕渐变可见，标题渐变文字显示正确
- [ ] Features 6 张卡片 3 列排列，悬停有上浮效果
- [ ] Code Demo 标签切换正常（点击 Python / Node.js / cURL 切换代码面板）
- [ ] GitHub CTA 横幅橙色光晕可见
- [ ] Footer 三列布局正常
- [ ] 缩小窗口至 <768px，布局折叠正常

- [ ] **Step 3: 提交**

```bash
git add index.html
git commit -m "feat: add complete index.html for AISIX AI Gateway landing page"
```

---

## Task 7: CSS 选择器修正（Tab 切换）

**注意：** `:checked ~ .code-window` 要求 `input` 元素与 `.code-window` 是同级兄弟节点且 input 在前。`landing.css` 中的选择器需与 HTML 结构匹配：

```css
/* 正确：input 在 .code-demo__wrapper 内，.code-window 也在其内 */
#tab-python:checked ~ .code-window #panel-python { display: block; }
```

- [ ] **Step 1: 验证 Tab 切换功能**

打开浏览器，点击 Node.js 和 cURL 标签，确认代码面板正确切换，Python 面板默认显示。

- [ ] **Step 2: 若切换失效，检查 DOM 结构**

确认 `index.html` 中 `<input>` 元素直接位于 `.code-demo__wrapper` 内部，且在 `.code-window` 之前。

- [ ] **Step 3: 目视通过后提交最终版本**

```bash
git add -A
git commit -m "feat: verify and finalize tab switching behavior"
```
