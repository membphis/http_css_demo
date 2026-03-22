# 架构与约定

> HTTP & CSS Demo 项目的完整技术参考。

本文档涵盖 CSS 架构、命名约定、设计令牌、组件模式和响应式设计指南。

---

## CSS 架构

### 文件加载顺序（强制性）

每个 HTML 文件的 `<head>` 部分必须按以下顺序加载 CSS：

1. `reset.css` — 浏览器重置（始终第一）
2. `variables.css` — 设计令牌（始终第二）
3. `main.css` — 全局样式（始终第三）
4. 页面特定的 CSS — 特定页面样式（始终最后）

**路径约定：**

- 根页面（如 `index.html`）：`href="css/*.css"`
- pages/ 中的子页面：`href="../css/*.css"`

**示例：**

```html
<!-- 根页面 -->
<link rel="stylesheet" href="css/reset.css">
<link rel="stylesheet" href="css/variables.css">
<link rel="stylesheet" href="css/main.css">
<link rel="stylesheet" href="css/landing.css">

<!-- pages/ 子页面 -->
<link rel="stylesheet" href="../css/reset.css">
<link rel="stylesheet" href="../css/variables.css">
<link rel="stylesheet" href="../css/main.css">
<link rel="stylesheet" href="../css/yourpage.css">
```

### 设计令牌系统

所有设计值都定义在 `css/variables.css` 的 `:root` 选择器上，使用 CSS 自定义属性（CSS 变量）。

**关键原则：**

- 永远不要在其他地方硬编码十六进制颜色
- 永远不要在其他地方硬编码像素字体大小
- 永远不要在其他地方硬编码魔术数字间距
- 需要新值时，先将令牌添加到 `variables.css`，然后引用它

---

## 设计令牌参考

### 令牌前缀与用途

| 前缀            | 用途                         | 示例                       |
|-----------------|------------------------------|----------------------------|
| `--color-*`     | 颜色                         | `var(--color-primary)`     |
| `--font-size-*` | 排版比例（xs–4xl）          | `var(--font-size-lg)`      |
| `--font-weight*`| 字重（normal–extrabold）     | `var(--font-weight-bold)`  |
| `--space-*`     | 间距（1–16）                | `var(--space-4)`           |
| `--radius-*`    | 边框半径（sm–full）         | `var(--radius-md)`         |
| `--shadow-*`    | 盒阴影（sm–lg）             | `var(--shadow-sm)`         |
| `--transition-*`| 持续时间（fast, base）      | `var(--transition-fast)`   |
| `--max-width`   | 内容最大宽度                | `var(--max-width)`         |
| `--header-height`| 粘性页头高度               | `var(--header-height)`     |

### 颜色令牌

| 令牌                      | 值               | 用途               |
|---------------------------|------------------|--------------------|
| `--color-bg`              | `#0f172a`        | 页面背景           |
| `--color-surface`         | `#1e293b`        | 卡片/组件背景      |
| `--color-surface-2`       | `#020617`        | 次级表面           |
| `--color-border`          | `#334155`        | 边框颜色           |
| `--color-border-accent`   | `rgba(249, 115, 22, 0.25)` | 强调边框 |
| `--color-primary`         | `#f97316`        | 主色调（橙色）     |
| `--color-primary-hover`   | `#ea580c`        | 主色调悬停         |
| `--color-primary-2`       | `#ef4444`        | 次级主色调         |
| `--color-text`            | `#f8fafc`        | 主要文本           |
| `--color-text-muted`      | `#94a3b8`        | 次要文本           |
| `--color-text-faint`      | `#475569`        | 弱化文本           |
| `--color-accent-blue`     | `#60a5fa`        | 蓝色强调           |
| `--color-accent-green`    | `#34d399`        | 绿色强调           |
| `--color-accent-purple`   | `#a78bfa`        | 紫色强调           |
| `--color-header-bg`       | `rgba(15, 23, 42, 0.85)` | 页头背景（带透明度） |

### 排版令牌

**字体族：**

| 令牌              | 值                                              |
|-------------------|-------------------------------------------------|
| `--font-ui`        | `-apple-system, BlinkMacSystemFont, 'Segoe UI', sans-serif` |
| `--font-code`      | `'JetBrains Mono', 'Fira Code', 'Cascadia Code', monospace` |

**字体大小：**

| 令牌             | 值      |
|------------------|---------|
| `--font-size-xs`  | `0.75rem`  (12px) |
| `--font-size-sm`  | `0.875rem` (14px) |
| `--font-size-base`| `1rem`     (16px) |
| `--font-size-lg`  | `1.125rem` (18px) |
| `--font-size-xl`  | `1.25rem`  (20px) |
| `--font-size-2xl` | `1.5rem`   (24px) |
| `--font-size-3xl` | `1.875rem` (30px) |
| `--font-size-4xl` | `2.25rem`  (36px) |

**字重：**

| 令牌                  | 值      |
|-----------------------|---------|
| `--font-weight-normal`  | `400` |
| `--font-weight-medium`  | `500` |
| `--font-weight-semibold`| `600` |
| `--font-weight-bold`    | `700` |
| `--font-weight-extrabold`| `800` |

### 间距令牌

| 令牌         | 值      |
|--------------|---------|
| `--space-1`   | `0.25rem`  (4px) |
| `--space-2`   | `0.5rem`   (8px) |
| `--space-3`   | `0.75rem`  (12px) |
| `--space-4`   | `1rem`     (16px) |
| `--space-5`   | `1.25rem`  (20px) |
| `--space-6`   | `1.5rem`   (24px) |
| `--space-8`   | `2rem`     (32px) |
| `--space-10`  | `2.5rem`   (40px) |
| `--space-12`  | `3rem`     (48px) |
| `--space-16`  | `4rem`     (64px) |

### 边框半径令牌

| 令牌            | 值           |
|-----------------|--------------|
| `--radius-sm`   | `0.25rem`    (4px) |
| `--radius-md`   | `0.5rem`     (8px) |
| `--radius-lg`   | `0.75rem`    (12px) |
| `--radius-xl`   | `1rem`       (16px) |
| `--radius-full` | `9999px`     (圆形) |

### 阴影令牌

| 令牌          | 值                               |
|---------------|----------------------------------|
| `--shadow-sm` | `0 1px 3px rgba(0, 0, 0, 0.4)`  |
| `--shadow-md` | `0 4px 12px rgba(0, 0, 0, 0.5)` |
| `--shadow-lg` | `0 8px 32px rgba(0, 0, 0, 0.6)`|

### 过渡令牌

| 令牌                | 值           |
|---------------------|--------------|
| `--transition-fast` | `150ms ease` |
| `--transition-base` | `250ms ease` |

### 布局令牌

| 令牌             | 值       |
|------------------|----------|
| `--max-width`    | `1100px` |
| `--header-height`| `64px`   |

---

## 命名约定

### HTML 约定

**格式与缩进：**

- 2 空格缩进
- 所有属性使用双引号
- `<html>` 上必须包含 `lang="en"`
- 必须包含 `charset` 和 `viewport` meta 标签

**语义元素：**

优先使用语义化 HTML5 元素：
- `<header>` — 页头区域
- `<nav>` — 导航区域
- `<main>` — 主要内容
- `<section>` — 内容分区
- `<footer>` — 页脚区域

**子页面标题格式：**

```
<title>Page Name - HTTP &amp; CSS Demo</title>
```

**示例：**

```html
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>About - HTTP &amp; CSS Demo</title>
  <link rel="stylesheet" href="../css/reset.css">
  <link rel="stylesheet" href="../css/variables.css">
  <link rel="stylesheet" href="../css/main.css">
  <link rel="stylesheet" href="../css/about.css">
</head>
<body>
  <header class="site-header">
    <!-- 内容 -->
  </header>

  <main>
    <section class="container">
      <!-- 内容 -->
    </section>
  </main>

  <footer class="site-footer">
    <!-- 内容 -->
  </footer>
</body>
</html>
```

### CSS 约定 — BEM

**BEM 语法：**

```
.block              →  .card, .nav-bar, .site-header
.block__element     →  .card__title, .form__input
.block--modifier    →  .btn--primary, .alert--error
```

**命名规则：**

- **块：** 小写，连字符分隔（`site-header`、`demo-section`、`feature-card`）
- **元素：** 双下划线（`card__title`、`site-header__nav`、`feature-card__desc`）
- **修饰符：** 双连字符（`btn--primary`、`btn--outline`、`nav-link--active`）
- 最多一个元素层级深度（避免 `.block__el__sub`）
- 多词名称使用连字符，而非驼峰命名（`site-header` 而非 `siteHeader`）

**示例：**

```html
<!-- 正确的 BEM 结构 -->
<div class="feature-card">
  <h3 class="feature-card__title">特性标题</h3>
  <p class="feature-card__desc">特性描述</p>
  <button class="feature-card__btn feature-card__btn--primary">了解更多</button>
</div>
```

### 属性顺序

在 CSS 规则中，按以下顺序声明属性：

1. **布局** — `display`, `position`, `top`, `right`, `bottom`, `left`, `float`, `overflow`, `grid`, `flex`
2. **盒模型** — `width`, `height`, `margin`, `padding`, `border`, `border-radius`
3. **排版** — `font`, `font-size`, `font-weight`, `font-family`, `line-height`, `text-align`, `color`
4. **视觉** — `background`, `box-shadow`, `opacity`, `cursor`
5. **杂项** — `transition`, `animation`, `transform`

**示例：**

```css
.card {
  /* 布局 */
  display: grid;
  grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));

  /* 盒模型 */
  padding: var(--space-6);
  border: 1px solid var(--color-border);
  border-radius: var(--radius-lg);

  /* 排版 */
  font-size: var(--font-size-base);
  font-weight: var(--font-weight-medium);
  color: var(--color-text);
  line-height: 1.6;

  /* 视觉 */
  background-color: var(--color-surface);
  box-shadow: var(--shadow-sm);
  cursor: pointer;

  /* 杂项 */
  transition: box-shadow var(--transition-base),
              transform var(--transition-base);
}
```

---

## 组件模式

### 居中容器

所有主要内容应使用居中容器包裹：

```css
.container {
  max-width: var(--max-width);
  margin: 0 auto;
  padding: 0 var(--space-6);
}
```

**使用：**

```html
<section class="container">
  <h1>标题</h1>
  <p>内容</p>
</section>
```

### 带悬停提升的卡片

交互式卡片应在悬停时轻微提升并增强阴影：

```css
.card {
  background-color: var(--color-surface);
  border: 1px solid var(--color-border);
  border-radius: var(--radius-lg);
  box-shadow: var(--shadow-sm);
  transition: box-shadow var(--transition-base),
              transform var(--transition-base);
}

.card:hover {
  box-shadow: var(--shadow-md);
  transform: translateY(-2px);
}
```

### 焦点环模式

所有交互元素应具有清晰的焦点状态：

```css
.input,
.btn {
  outline: none;
}

.input:focus,
.btn:focus {
  border-color: var(--color-primary);
  box-shadow: 0 0 0 3px rgba(249, 115, 22, 0.25);
}
```

### 按钮变体

**基础按钮：**

```css
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
```

**主按钮：**

```css
.btn--primary {
  background: linear-gradient(90deg, var(--color-primary), var(--color-primary-2));
  color: #fff;
  border-color: transparent;
}

.btn--primary:hover:not(:disabled) {
  background: linear-gradient(90deg, var(--color-primary-hover), var(--color-primary-2));
  transform: translateY(-1px);
}
```

**轮廓按钮：**

```css
.btn--outline {
  background: transparent;
  color: var(--color-text-muted);
  border-color: var(--color-border);
}

.btn--outline:hover:not(:disabled) {
  border-color: var(--color-primary);
  color: var(--color-text);
  transform: translateY(-1px);
}
```

**禁用状态：**

```css
.btn:disabled {
  opacity: 0.5;
  cursor: not-allowed;
}
```

### 悬停状态模式

使用 `:hover:not(:disabled)` 模式确保禁用元素不响应悬停：

```css
.btn:hover:not(:disabled) {
  transform: translateY(-1px);
}

.card:hover:not(.card--disabled) {
  box-shadow: var(--shadow-md);
}
```

---

## 响应式设计

### 断点策略

- **单一断点：** `768px`
- **桌面优先：** 默认样式针对 768px+，使用 `@media (max-width: 768px)` 覆盖移动端
- **响应式块位置：** 在每个 CSS 文件的底部

### 响应式网格

优先使用 `auto-fit` 和 `minmax()` 实现内在响应式：

```css
.grid {
  display: grid;
  grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
  gap: var(--space-6);
}

@media (max-width: 768px) {
  .grid {
    grid-template-columns: 1fr;
    gap: var(--space-4);
  }
}
```

### 粘性页头移动端导航

```css
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
}
```

---

## 设计原则

### 不要做

- 使用内联样式（`style="..."`）
- 使用 `!important`
- 使用 id 选择器进行样式设计（`#header { ... }`）
- 硬编码颜色、字体大小或间距
- 除非任务明确需要，否则添加 JavaScript
- 未经讨论引入构建工具（Sass、PostCSS、打包器）
- 修改 `reset.css`，除非修复跨浏览器渲染错误

### 令牌优先开发

- 始先在 `variables.css` 中定义令牌
- 然后使用 `var(--token-name)` 引用
- 需要新值时，先添加令牌再使用

### 语义 HTML

- 使用适当的语义化元素
- 使用有意义的类名（通过 BEM）
- 提供可访问的结构

### YAGNI（你不需要它）

- 不要添加"可能以后需要"的样式或功能
- 从简单开始，按需扩展

---

## 相关文档

- [贡献指南](contributing.md) — 如何添加页面、组件并有效贡献
- [AGENTS.md](../AGENTS.md) — 完整的架构规范和开发指南
- [README.md](../README.md) — 项目概述和快速开始

## 下一步

- 阅读[贡献指南](contributing.md) 开始构建
- 查看 `css/variables.css` 了解所有可用的设计令牌
- 参考 `css/main.css` 了解全局组件模式
