# 贡献指南

> 如何为 HTTP & CSS Demo 项目做出贡献。

本指南涵盖开发工作流程、添加新页面和组件，以及保持代码质量的最佳实践。

---

## 前提条件

### 熟悉架构

在开始贡献之前，请熟悉以下文档：

- **[架构与约定](architecture.md)** — CSS 架构、命名约定和设计令牌
- **[AGENTS.md](../AGENTS.md)** — 完整的项目架构和开发规范

### 你需要什么

- **文本编辑器** — VS Code、Sublime Text 或其他你喜欢的编辑器
- **现代浏览器** — Chrome、Firefox、Safari 或 Edge（用于预览）

**不需要：**
- Node.js
- 构建工具
- 打包器
- JavaScript 框架

这是一个纯静态 HTML + CSS 项目。直接打开 `.html` 文件即可在浏览器中预览。

---

## 开发工作流程

### 进行更改

开发流程非常简单：

1. **编辑** — 在你的文本编辑器中修改文件
2. **保存** — 保存文件
3. **刷新** — 在浏览器中刷新页面查看更改

### 本地预览

有几种方式可以预览你的更改：

```bash
# 方式 1：直接打开（最简单）
xdg-open index.html              # Linux
open index.html                  # macOS
start index.html                 # Windows

# 方式 2：本地服务器（可选）
python3 -m http.server 8000
# 然后访问 http://localhost:8000

# 方式 3：使用 npx serve（需要 Node.js）
npx serve .
```

### 代码检查（可选）

项目不强制要求代码检查，但你可以使用以下工具：

```bash
# HTML 检查
npx htmlhint "**/*.html"

# CSS 检查
npx stylelint "css/**/*.css"
```

**验证方式：** 视觉验证是最重要的。在浏览器中打开页面并检查外观是否符合预期。

---

## 添加新页面

添加新页面的完整步骤：

### 1. 创建页面文件

在 `pages/` 目录中创建新的 HTML 文件：

```bash
touch pages/yourpage.html
```

### 2. 从现有页面复制 `<head>`

从一个现有的子页面（如 `pages/about.html`）复制 `<head>` 部分。确保 CSS 链接路径正确（使用 `../css/`）：

```html
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Your Page Name - HTTP &amp; CSS Demo</title>
  <link rel="stylesheet" href="../css/reset.css">
  <link rel="stylesheet" href="../css/variables.css">
  <link rel="stylesheet" href="../css/main.css">
  <link rel="stylesheet" href="../css/yourpage.css">
</head>
```

### 3. 逐字复制 `<header>` 和 `<footer>`

所有页面共享相同的导航和页脚。从一个现有页面复制以下内容：

```html
<header class="site-header">
  <div class="site-header__container container">
    <!-- 完整的 header 内容 -->
  </div>
</header>

<footer class="site-footer">
  <!-- 完整的 footer 内容 -->
</footer>
```

### 4. 标记活动导航链接

在导航中找到指向你新页面的链接，添加 `nav-link--active` 类：

```html
<nav class="site-header__nav">
  <a href="../index.html" class="nav-link">首页</a>
  <a href="../pages/yourpage.html" class="nav-link nav-link--active">你的页面</a>
  <a href="../pages/about.html" class="nav-link">关于</a>
</nav>
```

### 5. 创建页面特定的 CSS

在 `css/` 目录中创建新的 CSS 文件：

```bash
touch css/yourpage.css
```

在 HTML 的 `<head>` 中，确保它在 `main.css` 之后加载：

```html
<link rel="stylesheet" href="../css/main.css">
<link rel="stylesheet" href="../css/yourpage.css">
```

### 6. 更新导航

在 `main.css` 中，你可能需要更新导航链接列表。确保所有页面的导航保持一致。

---

## 添加新组件

添加新组件的步骤：

### 1. 定义基础块类

在适当的 CSS 文件中定义组件的基础块类：

```css
.my-component {
  /* 布局 */
  display: block;

  /* 盒模型 */
  padding: var(--space-4);
  border: 1px solid var(--color-border);
  border-radius: var(--radius-md);

  /* 排版 */
  font-size: var(--font-size-base);
  color: var(--color-text);

  /* 视觉 */
  background-color: var(--color-surface);

  /* 杂项 */
  transition: background-color var(--transition-fast);
}
```

### 2. 仅使用设计令牌

永远不要硬编码值。所有颜色、字体大小、间距等都应使用 `css/variables.css` 中定义的令牌：

```css
/* ❌ 错误：硬编码值 */
.my-component {
  padding: 16px;
  border: 1px solid #334155;
  border-radius: 8px;
  font-size: 16px;
}

/* ✅ 正确：使用设计令牌 */
.my-component {
  padding: var(--space-4);
  border: 1px solid var(--color-border);
  border-radius: var(--radius-md);
  font-size: var(--font-size-base);
}
```

### 3. 添加悬停和焦点状态

为交互式组件添加悬停和焦点状态，使用过渡令牌：

```css
.my-component {
  transition: background-color var(--transition-fast),
              border-color var(--transition-fast),
              box-shadow var(--transition-base);
}

.my-component:hover {
  border-color: var(--color-primary);
  box-shadow: var(--shadow-md);
}

.my-component:focus {
  outline: none;
  border-color: var(--color-primary);
  box-shadow: 0 0 0 3px rgba(249, 115, 22, 0.25);
}
```

### 4. 添加禁用状态（如交互式）

如果组件可以被禁用，添加禁用样式：

```css
.my-component:disabled,
.my-component--disabled {
  opacity: 0.5;
  cursor: not-allowed;
}

/* 确保禁用元素不响应悬停 */
.my-component:hover:not(:disabled):not(.my-component--disabled) {
  border-color: var(--color-primary);
}
```

### 5. 响应式测试

在 CSS 文件底部添加响应式覆盖：

```css
/* 桌面样式（默认） */
.my-component {
  padding: var(--space-6);
}

/* 移动端覆盖 */
@media (max-width: 768px) {
  .my-component {
    padding: var(--space-4);
  }
}
```

### 6. 使用语义 HTML

使用语义化 HTML5 元素：

```html
<!-- ✅ 良好：语义化 -->
<article class="feature-card">
  <h3 class="feature-card__title">标题</h3>
  <p class="feature-card__desc">描述</p>
</article>

<!-- ❌ 避免：非语义化 -->
<div class="feature-card">
  <div class="feature-card__title">标题</div>
  <div class="feature-card__desc">描述</div>
</div>
```

---

## 常见模式

### 居中容器

```css
.container {
  max-width: var(--max-width);
  margin: 0 auto;
  padding: 0 var(--space-6);
}
```

```html
<section class="container">
  <h1>标题</h1>
  <p>内容</p>
</section>
```

### 带悬停效果的卡片

```css
.card {
  background-color: var(--color-surface);
  border: 1px solid var(--color-border);
  border-radius: var(--radius-lg);
  padding: var(--space-6);
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
  <h3 class="card__title">卡片标题</h3>
  <p class="card__content">卡片内容</p>
</div>
```

### 代码块

```css
.code-block {
  background-color: var(--color-bg);
  border: 1px solid var(--color-border);
  border-radius: var(--radius-md);
  padding: var(--space-4);
  font-family: var(--font-code);
  font-size: var(--font-size-sm);
  line-height: 1.6;
  overflow-x: auto;
}
```

```html
<pre class="code-block"><code>const message = "Hello, World!";</code></pre>
```

### 响应式网格

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

```html
<div class="grid">
  <div class="card">项目 1</div>
  <div class="card">项目 2</div>
  <div class="card">项目 3</div>
</div>
```

### 章节标题

```css
.section-title {
  font-size: var(--font-size-3xl);
  font-weight: var(--font-weight-bold);
  color: var(--color-text);
  margin-bottom: var(--space-6);
}
```

```html
<section class="container">
  <h2 class="section-title">章节标题</h2>
  <p>章节内容</p>
</section>
```

---

## 代码质量

### 命名约定

**CSS 类名 — BEM：**

- **块：** 小写，连字符分隔（`.site-header`、`.feature-card`）
- **元素：** 双下划线（`.card__title`、`.card__content`）
- **修饰符：** 双连字符（`.btn--primary`、`.nav-link--active`）
- 最多一个元素层级深度（避免 `.block__el__sub`）

**HTML：**

- 2 空格缩进
- 所有属性使用双引号
- `lang="en"` 在 `<html>` 上
- 必须包含 `charset` 和 `viewport` meta 标签

**CSS：**

- 2 空格缩进
- 每行一个声明
- 左大括号与选择器在同一行
- 规则块之间有空行
- 长文件中添加章节分隔符：`/* --- Section Name --- */`
- 属性顺序：布局 → 盒模型 → 排版 → 视觉 → 杂项

### 无硬编码值

永远不要硬编码：

- 颜色（十六进制、RGB 等）
- 像素字体大小
- 魔术数字间距
- 边框半径值
- 阴影值
- 过渡持续时间

始终使用 `css/variables.css` 中定义的令牌。

### 语义 HTML

优先使用语义化元素：

```html
<!-- ✅ 语义化 -->
<header>
  <nav>
    <ul>
      <li><a href="#">链接</a></li>
    </ul>
  </nav>
</header>

<main>
  <section>
    <article>
      <h1>标题</h1>
      <p>内容</p>
    </article>
  </section>
</main>

<footer>
  <p>&copy; 2026 项目名称</p>
</footer>
```

### 清洁的 CSS

**属性顺序：**

```css
.selector {
  /* 1. 布局 */
  display: grid;
  grid-template-columns: 1fr 1fr;

  /* 2. 盒模型 */
  padding: var(--space-4);
  border: 1px solid var(--color-border);
  border-radius: var(--radius-md);

  /* 3. 排版 */
  font-size: var(--font-size-base);
  font-weight: var(--font-weight-medium);
  color: var(--color-text);
  line-height: 1.6;

  /* 4. 视觉 */
  background-color: var(--color-surface);
  box-shadow: var(--shadow-sm);
  cursor: pointer;

  /* 5. 杂项 */
  transition: background-color var(--transition-fast);
}
```

**选择器优先级：**

- 避免深层嵌套（最多 3 层）
- 避免使用 `!important`
- 避免使用 ID 选择器进行样式设计
- 避免使用内联样式

---

## 快速参考

### 添加组件时参考的内容

- **设计令牌：** 查看 `css/variables.css` 了解所有可用的令牌
- **现有组件：** 参考 `css/main.css` 中的全局组件
- **模式参考：** 查看 `docs/architecture.md` 中的组件模式
- **命名约定：** 遵循 BEM 命名约定

### 常见文件位置

| 文件/目录 | 用途 |
|-----------|------|
| `css/variables.css` | 所有设计令牌 |
| `css/reset.css` | 浏览器重置 |
| `css/main.css` | 全局样式和组件 |
| `css/landing.css` | 首页特定样式 |
| `css/<page>.css` | 特定页面样式 |
| `index.html` | 首页 |
| `pages/<page>.html` | 子页面 |
| `docs/architecture.md` | 完整架构参考 |
| `docs/contributing.md` | 本指南 |
| `AGENTS.md` | 项目架构和规范 |

### 快速命令

```bash
# 预览首页
xdg-open index.html

# 预览子页面
xdg-open pages/about.html

# 启动本地服务器
python3 -m http.server 8000

# HTML 检查（可选）
npx htmlhint "**/*.html"

# CSS 检查（可选）
npx stylelint "css/**/*.css"

# 查看所有设计令牌
cat css/variables.css
```

---

## 许可证

本项目采用 MIT 许可证。

感谢你的贡献！🎉

---

## 相关文档

- **[架构与约定](architecture.md)** — CSS 架构、命名约定和设计令牌
- **[AGENTS.md](../AGENTS.md)** — 完整的项目架构和开发规范
- **[README.md](../README.md)** — 项目概述和快速开始
