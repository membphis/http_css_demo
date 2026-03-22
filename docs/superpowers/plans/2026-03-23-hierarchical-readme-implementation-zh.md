# 分层式 README 实施计划

> **对于代理工作者：** 必需子技能：使用 superpowers:subagent-driven-development（推荐）或 superpowers:executing-plans 逐步实施此计划。步骤使用复选框（`- [ ]`）语法进行跟踪。

**目标：** 为 HTTP & CSS Demo 项目创建三文件分层文档结构（README.md、docs/architecture.md、docs/contributing.md），以提供清晰、可访问的开发者文档。

**架构：** 分层文档，README.md 作为入口点，docs/architecture.md 用于技术参考，docs/contributing.md 用于贡献工作流程。所有 markdown 文件带有交叉引用和导航。

**技术栈：** Markdown、Git（用于版本控制）

---

## 文件结构

### 要创建的文件：
- 创建：`README.md` - 访问者的快速开始和概述（约 80-100 行）
- 创建：`docs/architecture.md` - 完整的技术参考（约 200-250 行）
- 创建：`docs/contributing.md` - 贡献指南（约 150-180 行）

### 职责：
- **README.md** - 落地页文档、快速入门、导航中心
- **docs/architecture.md** - CSS 架构、约定、设计令牌、模式
- **docs/contributing.md** - 如何添加页面/组件、工作流程、最佳实践

---

## 任务 1：创建 docs/ 目录结构

**文件：**
- 创建：`docs/`（目录）

- [ ] **步骤 1：创建 docs 目录**

```bash
mkdir -p docs
```

- [ ] **步骤 2：验证目录已创建**

运行：`ls -la docs`
预期：docs/ 目录存在且为空

- [ ] **步骤 3：无需提交**（将在添加文件时提交）

---

## 任务 2：创建 README.md

**文件：**
- 创建：`README.md`
- 参考：`docs/superpowers/specs/2026-03-23-hierarchical-readme-design-zh.md`
- 参考：`index.html`
- 参考：`AGENTS.md`

- [ ] **步骤 1：创建 README.md 并添加页眉和标题**

```markdown
# HTTP & CSS Demo — AISIX AI Gateway

> 静态 HTML + CSS 演示落地页，具有干净的架构和现代设计。
```

- [ ] **步骤 2：添加概述部分**

```markdown
## 概述

此项目演示了 AISIX AI Gateway 的生产就绪静态 HTML + CSS 落地页，这是一个开源 AI 网关。使用纯 HTML 和 CSS 构建 — 无构建工具、无打包器、无 JavaScript。

**技术栈：**
- 静态 HTML5
- 现代 CSS（自定义属性、网格、弹性盒）
- 无构建工具或包管理器

**项目状态：**
- 活跃 — AISIX AI Gateway 落地页已实现

直接在浏览器中打开 `.html` 文件以预览。
```

- [ ] **步骤 3：添加快速开始部分**

```markdown
## 快速开始

**选项 1：直接打开**

只需在浏览器中打开 HTML 文件：

```bash
# Linux
xdg-open index.html

# macOS
open index.html

# Windows
start index.html
```

**选项 2：本地服务器（可选）**

如果你更喜欢本地服务器：

```bash
# Python 3
python3 -m http.server 8000

# Node.js（需要 serve）
npx serve .

# 然后访问 http://localhost:8000
```

进行更改后刷新浏览器以立即查看更新。
```

- [ ] **步骤 4：添加项目结构部分**

```markdown
## 项目结构

```
http_css_demo/
├── README.md              # 此文件
├── AGENTS.md              # 架构和开发指南
├── index.html             # AISIX AI Gateway 落地页
├── css/
│   ├── reset.css           # 浏览器重置（box-sizing、列表、锚点、媒体）
│   ├── variables.css       # 设计令牌（所有 CSS 自定义属性）
│   ├── main.css            # 全局样式（导航、按钮、页脚、响应式）
│   └── landing.css         # 落地页特定样式
└── docs/
    ├── architecture.md     # CSS 架构和约定（详细）
    └── contributing.md     # 贡献指南和工作流程
```
```

- [ ] **步骤 5：添加文档部分**

```markdown
## 文档

- **[架构与约定](docs/architecture.md)** — 深入探索 CSS 架构、设计令牌、命名约定和组件模式
- **[贡献指南](docs/contributing.md)** — 如何添加页面、组件并有效贡献
- **[AGENTS.md](AGENTS.md)** — 详细的架构规范和开发指南
```

- [ ] **步骤 6：添加主要特性部分**

```markdown
## 主要特性

- **纯 HTML + CSS** — 无 JavaScript、无构建工具、无依赖
- **响应式设计** — 桌面优先，在 768px 处有单一断点
- **BEM 命名约定** — 清晰、可维护的 CSS 类名
- **设计令牌系统** — 通过 CSS 自定义属性实现一致样式
- **交互式组件** — 仅 CSS 的交互性（悬停状态、标签页）
- **现代视觉设计** — 带有渐变、发光和玻璃效果的暗色主题
```

- [ ] **步骤 7：添加浏览器支持和许可证部分**

```markdown
## 浏览器支持

适用于所有支持 CSS 自定义属性的现代浏览器：
- Chrome/Edge 88+
- Firefox 85+
- Safari 14+

## 许可证

MIT 许可证 — 详见 [LICENSE](LICENSE)
```

- [ ] **步骤 8：验证 README.md**

```bash
# 检查文件存在并有内容
wc -l README.md

# 验证它是有效的 markdown
head -20 README.md
```

预期：文件有 80-100 行，有效的 markdown 语法

- [ ] **步骤 9：提交 README.md**

```bash
git add README.md
git commit -m "docs: 添加 README.md，包含项目概述和快速开始"
```

---

## 任务 3：创建 docs/architecture.md

**文件：**
- 创建：`docs/architecture.md`
- 参考：`docs/superpowers/specs/2026-03-23-hierarchical-readme-design-zh.md`
- 参考：`AGENTS.md`
- 参考：`css/variables.css`
- 参考：`css/main.css`

- [ ] **步骤 1：创建 docs/architecture.md 并添加页眉**

```markdown
# 架构与约定

> HTTP & CSS Demo 项目的完整技术参考。

本文档涵盖 CSS 架构、命名约定、设计令牌、组件模式和响应式设计指南。
```

- [ ] **步骤 2：添加 CSS 架构部分**

```markdown
## CSS 架构

### 文件加载顺序（强制性）

每个 HTML 文件必须按此确切顺序加载 CSS 文件：

1. **`css/reset.css`** — 始终第一
   - 浏览器重置：box-sizing、列表样式、锚点标签、表单字体

2. **`css/variables.css`** — 始终第二
   - 所有设计令牌作为 CSS 自定义属性
   - 永远不要在其他地方硬编码颜色、间距或字体大小

3. **`css/main.css`** — 始终第三
   - 全局样式：body、页头、导航、页脚、按钮、响应式
   - 可重用的组件和布局模式

4. **页面特定的 CSS** — 始终最后
   - 例如，`css/landing.css` 用于落地页样式
   - 在 `<head>` 中的 `main.css` 之后添加

### 路径约定

- 根页面（如 `index.html`）：`href="css/*.css"`
- `pages/` 中的子页面：`href="../css/*.css"`

### 设计令牌系统

所有设计值都位于 `css/variables.css` 的 `:root` 上。永远不要在其他地方硬编码十六进制颜色、像素字体大小或魔术数字间距。

需要新的设计值时：
1. 首先将令牌添加到 `css/variables.css`
2. 在样式中使用 `var(--your-token)` 引用它

**示例：**
```css
/* 在 variables.css 中 */
:root {
  --color-accent: #f97316;
}

/* 在组件 CSS 中 */
.button {
  background: var(--color-accent);
}
```
```

- [ ] **步骤 3：添加设计令牌参考表**

```markdown
### 设计令牌参考

所有令牌都在 `css/variables.css` 中定义。

| 前缀         | 用途                    | 示例                    |
|----------------|----------------------------|----------------------------|
| `--color-*`     | 颜色                     | `var(--color-primary)`     |
| `--font-size-*` | 排版比例（xs、sm、base、lg、xl、2xl、3xl、4xl） | `var(--font-size-lg)`  |
| `--font-weight-*`| 字重（normal、medium、semibold、bold、extrabold） | `var(--font-weight-bold)` |
| `--space-*`     | 间距（1、2、3、4、5、6、8、10、12、16） | `var(--space-4)`       |
| `--radius-*`     | 边框半径（sm、md、lg、xl、full） | `var(--radius-md)`       |
| `--shadow-*`    | 阴影（sm、md、lg）             | `var(--shadow-sm)`        |
| `--transition-*`| 持续时间（fast、base）               | `var(--transition-fast)`  |
| `--max-width`   | 内容最大宽度                    | `var(--max-width)`        |
| `--header-height`| 粘性页头高度               | `var(--header-height)`    |

**令牌值（来自 `css/variables.css`）：**

```css
/* 颜色 */
--color-bg: #0f172a;
--color-surface: #1e293b;
--color-surface-2: #020617;
--color-border: #334155;
--color-primary: #f97316;
--color-text: #f8fafc;

/* 排版 */
--font-ui: -apple-system, BlinkMacSystemFont, 'Segoe UI', sans-serif;
--font-code: 'JetBrains Mono', 'Fira Code', 'Cascadia Code', monospace;

/* 布局 */
--max-width: 1100px;
--header-height: 64px;
```
```

- [ ] **步骤 4：添加命名约定部分**

```markdown
## 命名约定

### HTML 约定

**缩进：**
- 2 空格缩进
- 所有属性使用双引号

**必需元素：**
- `<html>` 上的 `lang="en"`
- `charset` 和 `viewport` 元标签

**语义 HTML：**
使用语义元素进行结构：
```html
<header>      <!-- 站点页头和导航 -->
<nav>         <!-- 导航链接 -->
<main>        <!-- 主要内容区域 -->
<section>     <!-- 内容部分 -->
<footer>      <!-- 站点页脚 -->
```

**子页面标题格式：**
```html
<title>页面名称 - HTTP & CSS Demo</title>
```

### CSS 约定 — BEM

我们对所有 CSS 类使用 BEM（块元素修饰符）命名。

**语法：**
```
.block              → .card, .nav-bar, .site-header
.block__element     → .card__title, .form__input
.block--modifier    → .btn--primary, .alert--error
```

**规则：**
- **块：** 小写，连字符分隔（`site-header`、`demo-section`）
- **元素：** 双下划线（`card__title`）
- **修饰符：** 双连字符（`btn--outline`）
- **最大深度：** 一个元素层级深度（无 `.block__el__sub`）
- **多词：** 使用连字符，而非驼峰命名（`nav-link`，而非 `navLink`）

**示例：**
```css
/* 块 */
.feature-card { ... }

/* 元素 */
.feature-card__title { ... }
.feature-card__desc { ... }

/* 修饰符 */
.feature-card--highlighted { ... }
```

### 属性顺序

编写 CSS 时，按以下顺序排列属性：
1. **布局** — display、position、grid、flex
2. **盒模型** — margin、border、padding、width、height
3. **排版** — font、line-height、text-align
4. **视觉** — color、background、box-shadow
5. **杂项** — cursor、pointer-events、transition

**示例：**
```css
.card {
  /* 布局 */
  display: grid;
  grid-template-columns: 1fr;

  /* 盒模型 */
  margin: var(--space-4);
  padding: var(--space-6);
  border-radius: var(--radius-lg);

  /* 排版 */
  font-size: var(--font-size-base);

  /* 视觉 */
  background: var(--color-surface);
  border: 1px solid var(--color-border);

  /* 杂项 */
  transition: transform var(--transition-base);
}
```
```

- [ ] **步骤 5：添加组件模式部分**

```markdown
## 组件模式

### 居中容器

使用 `main.css` 中的容器类进行居中内容：

```css
.container {
  max-width: var(--max-width);
  margin: 0 auto;
  padding: 0 var(--space-6);
}
```

**HTML：**
```html
<div class="container">
  <h1>章节标题</h1>
  <p>内容在这里</p>
</div>
```

### 带悬停提升的卡片

创建具有悬停效果的交互式卡片：

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

**焦点环模式**

对于交互式元素，添加焦点环：

```css
.input:focus {
  outline: none;
  border-color: var(--color-primary);
  box-shadow: 0 0 0 3px rgba(37, 99, 235, 0.15);
}
```

### 按钮变体

使用按钮修饰符实现不同样式：

```css
.btn {
  /* 基础按钮样式 */
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

**悬停状态模式**

对于交互式元素使用 `:hover:not(:disabled)`：

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

- [ ] **步骤 6：添加响应式设计部分**

```markdown
## 响应式设计

### 断点

在 **768px**（平板/移动端）处有单一断点。

**桌面优先方法：** 为桌面编写样式，添加移动端覆盖：

```css
/* 桌面样式（默认） */
.nav {
  display: flex;
  gap: var(--space-6);
}

/* 移动端覆盖 */
@media (max-width: 768px) {
  .nav {
    flex-direction: column;
  }
}
```

### 网格模式

优先使用 `auto-fit` 和 `minmax()` 实现内在响应式：

```css
.grid {
  display: grid;
  grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
  gap: var(--space-6);
}
```

这会根据可用空间自动调整列数。

### 响应式位置

将响应式块放在每个 CSS 文件的底部，用注释标记：

```css
/* --- 组件样式 --- */

.card { ... }

/* --- 响应式 --- */
@media (max-width: 768px) {
  .card {
    padding: var(--space-4);
  }
}
```
```

- [ ] **步骤 7：添加设计原则部分**

```markdown
## 设计原则

### 不要

❌ 使用内联样式
❌ 使用 `!important`
❌ 使用 `id` 选择器进行样式设计
❌ 硬编码颜色、字体大小或间距 — 始终使用 `var(--token)`
❌ 除非明确需要，否则添加 JavaScript
❌ 未经讨论引入构建工具（Sass、PostCSS、打包器）

### 令牌优先开发

始终从 `variables.css` 引用设计令牌：

```css
/* ✅ 好 */
.button {
  padding: var(--space-4);
  color: var(--color-text);
}

/* ❌ 不好 */
.button {
  padding: 1rem;
  color: #f8fafc;
}
```

### 语义 HTML

使用语义元素进行结构和可访问性：

```html
<!-- ✅ 好 -->
<header>
  <nav>
    <a href="/" class="nav-link">首页</a>
  </nav>
</header>

<!-- ❌ 不好 -->
<div class="header">
  <div class="navigation">
    <a href="/" class="link">首页</a>
  </div>
</div>
```

### YAGNI（你不需要它）

只构建现在需要的内容。避免：
- 未使用的 CSS 类
- 过度设计的模式
- 过早优化
```

- [ ] **步骤 8：添加相关文档部分**

```markdown
## 相关文档

- **[贡献指南](contributing.md)** — 添加功能时如何应用这些模式
- **[AGENTS.md](../AGENTS.md)** — 完整的架构规范和开发指南
- **[README.md](../README.md)** — 项目概述和快速开始

## 下一步

- 阅读[贡献指南](contributing.md) 开始添加页面和组件
- 审查 [AGENTS.md](../AGENTS.md) 以获取详细的架构规范
- 探索 `css/variables.css` 查看所有可用的设计令牌
```

- [ ] **步骤 9：验证 docs/architecture.md**

```bash
# 检查文件存在并有内容
wc -l docs/architecture.md

# 验证它是有效的 markdown
head -30 docs/architecture.md

# 检查是否有损坏的链接（可选）
# npx markdown-link-check docs/architecture.md
```

预期：文件有 200-250 行，有效的 markdown 语法

- [ ] **步骤 10：提交 docs/architecture.md**

```bash
git add docs/architecture.md
git commit -m "docs: 添加 architecture.md，包含 CSS 架构和约定"
```

---

## 任务 4：创建 docs/contributing.md

**文件：**
- 创建：`docs/contributing.md`
- 参考：`docs/superpowers/specs/2026-03-23-hierarchical-readme-design-zh.md`
- 参考：`AGENTS.md`
- 参考：`docs/architecture.md`

- [ ] **步骤 1：创建 docs/contributing.md 并添加页眉**

```markdown
# 贡献指南

> 如何为 HTTP & CSS Demo 项目做出贡献。

本指南涵盖开发工作流程、添加新页面和组件，以及保持代码质量的最佳实践。
```

- [ ] **步骤 2：添加前提条件部分**

```markdown
## 前提条件

### 首先，熟悉架构

在做出贡献之前，请审查以下文档：

- **[架构与约定](architecture.md)** — CSS 模式和设计令牌
- **[AGENTS.md](../AGENTS.md)** — 详细的架构规范

### 你需要什么

你不需要复杂的开发环境：

✅ **必需：**
- 文本编辑器（VS Code、Sublime Text、Notepad++ 等）
- 现代网络浏览器（Chrome、Firefox、Safari、Edge）

❌ **不需要：**
- Node.js 或 npm
- 构建工具或打包器
- 包管理器
- 虚拟环境

这是一个纯 HTML + CSS 项目 — 无编译、无依赖。
```

- [ ] **步骤 3：添加开发工作流程部分**

```markdown
## 开发工作流程

### 进行更改

1. 在文本编辑器中直接编辑 HTML 或 CSS 文件
2. 保存你的更改
3. 刷新浏览器以查看更新

就是这样！无需构建步骤、无需 npm install、无需服务器重启。

### 本地预览

**选项 1：直接打开（推荐）**

```bash
# Linux
xdg-open index.html

# macOS
open index.html

# Windows
start index.html
```

**选项 2：本地服务器（可选）**

如果你更喜欢本地服务器：

```bash
# Python 3
python3 -m http.server 8000

# 然后访问 http://localhost:8000
```

保存更改后刷新你的浏览器。

### 代码检查（可选）

不是必需的，但如果想使用检查工具：

```bash
# HTML 检查
npx htmlhint "**/*.html"

# CSS 检查
npx stylelint "css/**/*.css"
```

这些是有用的工具，但不是强制性的。
```

- [ ] **步骤 4：添加添加新页面部分**

```markdown
## 添加新页面

### 分步指南

**1. 创建页面文件**

```bash
# 创建 pages/yourpage.html
touch pages/yourpage.html
```

**2. 从现有页面复制 `<head>`**

从 `pages/` 子页面（而非根页面）复制以获取正确的 `../css/` 路径：

```html
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>你的页面 - HTTP & CSS Demo</title>
  <meta name="description" content="页面描述">
  <link rel="stylesheet" href="../css/reset.css">
  <link rel="stylesheet" href="../css/variables.css">
  <link rel="stylesheet" href="../css/main.css">
  <link rel="stylesheet" href="../css/yourpage.css">
</head>
```

**3. 逐字复制 `<header>` 和 `<footer>`**

从现有页面逐字复制整个 `<header>` 和 `<footer>`：

```html
<body>
  <header class="site-header">
    <div class="container site-header__inner">
      <a href="../" class="site-header__logo">
        <div class="site-header__logo-icon">⬡</div>
        AISIX AI Gateway
      </a>
      <nav class="site-header__nav">
        <a href="#features" class="nav-link">特性</a>
        <a href="../" class="nav-link">首页</a>
      </nav>
    </div>
  </header>

  <main>
    <!-- 你的内容在这里 -->
  </main>

  <footer class="site-footer">
    <!-- 页脚内容（从现有页面复制） -->
  </footer>
</body>
</html>
```

**4. 标记活动导航链接**

将 `nav-link--active` 添加到当前页面的链接：

```html
<a href="#features" class="nav-link nav-link--active">特性</a>
```

**5. 创建页面特定的 CSS**

创建 `css/yourpage.css` 并添加你的页面样式：

```css
/* css/yourpage.css */

.your-section {
  padding: var(--space-12) var(--space-6);
}
```

**6. 更新导航（如需要）**

在 `css/main.css` 中添加指向你新页面的链接：

```css
.site-header__nav {
  /* 在这里更新导航链接 */
}

.site-footer__nav {
  /* 在这里更新页脚链接 */
}
```
```

- [ ] **步骤 5：添加添加新组件部分**

```markdown
## 添加新组件

### 分步指南

**1. 定义基础块类**

选择适当的 CSS 文件：
- `css/main.css` 用于全局组件（按钮、卡片、输入）
- 页面特定的 CSS（如 `css/landing.css`）用于单页组件

```css
/* 使用 BEM 命名定义块 */
.component {
  /* 基础样式 */
}

.component__element {
  /* 元素样式 */
}

.component--modifier {
  /* 修饰符样式 */
}
```

**2. 仅使用设计令牌**

永远不要硬编码值：

```css
/* ✅ 好 */
.component {
  padding: var(--space-6);
  background: var(--color-surface);
  border-radius: var(--radius-lg);
}

/* ❌ 不好 */
.component {
  padding: 1.5rem;
  background: #1e293b;
  border-radius: 0.5rem;
}
```

需要新令牌？先将其添加到 `css/variables.css`：

```css
/* 在 variables.css 中 */
:root {
  --your-new-token: value;
}
```

**3. 添加悬停和焦点状态**

使用过渡令牌实现平滑动画：

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

对于交互式元素使用 `:hover:not(:disabled)` 模式：

```css
.component:hover:not(:disabled) {
  /* 仅当未禁用时的悬停样式 */
}
```

**4. 添加禁用状态（如交互式）**

```css
.component:disabled {
  opacity: 0.5;
  cursor: not-allowed;
}
```

**5. 响应式测试**

在桌面（768px+）和移动端（768px 及以下）测试：

```css
/* 桌面样式（默认） */
.component {
  display: grid;
  grid-template-columns: repeat(3, 1fr);
}

/* 移动端覆盖 */
@media (max-width: 768px) {
  .component {
    grid-template-columns: 1fr;
  }
}
```

**6. 使用语义 HTML**

```html
<!-- ✅ 好 -->
<section class="features-section">
  <h2 class="features-section__title">特性</h2>
  <div class="features-section__grid">...</div>
</section>

<!-- ❌ 不好 -->
<div class="features">
  <div class="title">特性</div>
  <div class="grid">...</div>
</div>
```
```

- [ ] **步骤 6：添加常见模式部分**

```markdown
## 常见模式

### 居中内容

使用 `main.css` 中的容器类：

```html
<div class="container">
  <h1>章节标题</h1>
  <p>内容在这里</p>
</div>
```

### 带悬停效果的卡片

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
  <h3 class="card__title">标题</h3>
  <p class="card__desc">描述文本</p>
</div>
```

### 代码块

使用语法高亮类：

```html
<pre><code><span class="tok-keyword">import</span> <span class="tok-name">openai</span></code></pre>
```

可用的令牌类：
- `.tok-keyword` — 关键字（import、return、if）
- `.tok-string` — 字符串
- `.tok-name` — 变量/函数名
- `.tok-func` — 函数调用
- `.tok-comment` — 注释
- `.tok-param` — 参数
- `.tok-punct` — 标点符号

### 响应式网格

```css
.grid {
  display: grid;
  grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
  gap: var(--space-6);
}
```

这会根据可用空间自动调整列数。

### 章节标题

```html
<div class="section-header">
  <span class="section-header__label">特性</span>
  <h2 class="section-header__title">章节标题</h2>
  <p class="section-header__subtitle">副标题文本</p>
</div>
```
```

- [ ] **步骤 7：添加代码质量部分**

```markdown
## 代码质量

### 命名

始终如一地使用 BEM 命名：

```css
/* ✅ 好 */
.feature-card { ... }
.feature-card__title { ... }
.feature-card--highlighted { ... }

/* ❌ 不好 */
.featureCard { ... }
.featureCardTitle { ... }
.feature_card__highlighted { ... }
```

多词名称使用 kebab-case：

```css
/* ✅ 好 */
.site-header__nav-link { ... }

/* ❌ 不好 */
.siteHeader__navLink { ... }
.site-header__navLink { ... }
```

### 无硬编码值

始终使用设计令牌：

```css
/* ✅ 好 */
.button {
  padding: var(--space-4);
  color: var(--color-text);
  background: var(--color-primary);
}

/* ❌ 不好 */
.button {
  padding: 1rem;
  color: #f8fafc;
  background: #f97316;
}
```

### 语义 HTML

使用适当的语义元素：

```html
<!-- ✅ 好 -->
<header>
  <nav>
    <a href="/" class="nav-link">首页</a>
  </nav>
</header>

<main>
  <section>
    <h2>章节标题</h2>
  </section>
</main>

<footer>
  <p>© 2026 项目</p>
</footer>

<!-- ❌ 不好 -->
<div class="header">
  <div class="nav">
    <a href="/" class="link">首页</a>
  </div>
</div>

<div class="main">
  <div class="section">
    <div class="title">章节标题</div>
  </div>
</div>

<div class="footer">
  <p>© 2026 项目</p>
</div>
```

### 清洁的 CSS

```css
/* ✅ 好 - 每行一个声明 */
.card {
  padding: var(--space-6);
  background: var(--color-surface);
  border-radius: var(--radius-lg);
}

/* ✅ 好 - 规则块之间有空行 */
.card {
  padding: var(--space-6);
}

.card__title {
  font-size: var(--font-size-base);
}

/* ✅ 好 - 长文件中的节分隔符 */
/* --- 页头样式 --- */

.site-header { ... }

/* --- 按钮样式 --- */

.btn { ... }

/* ❌ 不好 - 每行多个声明 */
.card { padding: var(--space-6); background: var(--color-surface); }

/* ❌ 不好 - 无空行 */
.card { padding: var(--space-6); }
.card__title { font-size: var(--font-size-base); }
```
```

- [ ] **步骤 8：添加快速参考部分**

```markdown
## 快速参考

### 添加组件时，参考：

- **[设计令牌](architecture.md#design-tokens-reference)** — 一个表格中的所有可用令牌
- **[组件模式](architecture.md#component-patterns)** — 带有代码示例的可重用组件模式
- **[响应式设计](architecture.md#responsive-design)** — 如何使组件响应式
- **[命名约定](architecture.md#naming-conventions)** — BEM 语法和示例

### 常见文件位置：

| 你正在添加的内容 | 文件位置 |
|-------------------|---------------|
| 全局组件 | `css/main.css` |
| 页面特定样式 | `css/<page>.css` |
| 新页面 | `pages/<page>.html` |
| 新设计令牌 | `css/variables.css` |

### 快速命令：

```bash
# 创建新页面
touch pages/yourpage.html

# 创建新 CSS 文件
touch css/yourpage.css

# 在浏览器中预览
open index.html  # macOS
xdg-open index.html  # Linux

# 可选的代码检查
npx htmlhint "**/*.html"
npx stylelint "css/**/*.css"
```
```

- [ ] **步骤 9：添加许可证部分**

```markdown
## 许可证

MIT 许可证 — 详见 [LICENSE](../LICENSE)

## 感谢你的贡献！🎉

你的贡献使这个项目变得更好。如果你有问题或需要帮助，请随时联系我们。
```

- [ ] **步骤 10：验证 docs/contributing.md**

```bash
# 检查文件存在并有内容
wc -l docs/contributing.md

# 验证它是有效的 markdown
head -30 docs/contributing.md

# 检查是否有损坏的链接（可选）
# npx markdown-link-check docs/contributing.md
```

预期：文件有 150-180 行，有效的 markdown 语法

- [ ] **步骤 11：提交 docs/contributing.md**

```bash
git add docs/contributing.md
git commit -m "docs: 添加 contributing.md，包含贡献指南和工作流程"
```

---

## 任务 5：最终验证和确认

**文件：**
- 验证：`README.md`
- 验证：`docs/architecture.md`
- 验证：`docs/contributing.md`

- [ ] **步骤 1：验证所有文件存在**

```bash
ls -la README.md docs/architecture.md docs/contributing.md
```

预期：所有三个文件都存在且可读

- [ ] **步骤 2：检查行数在范围内**

```bash
echo "README.md:" && wc -l README.md
echo "architecture.md:" && wc -l docs/architecture.md
echo "contributing.md:" && wc -l docs/contributing.md
```

预期：
- README.md：80-100 行
- architecture.md：200-250 行
- contributing.md：150-180 行

- [ ] **步骤 3：验证交叉引用正确**

```bash
# 检查是否有指向不存在文件的链接
grep -r "\.md" README.md docs/architecture.md docs/contributing.md | grep -v "## " | head -20
```

预期：所有 markdown 链接都引用现有文件

- [ ] **步骤 4：在浏览器中测试（可选但推荐）**

```bash
# 在 GitHub 或 markdown 查看器中打开
# 如果使用 GitHub：
# 1. git push 到你的 fork
# 2. 在浏览器中打开仓库
# 3. 验证所有三个文档正确渲染
```

预期：所有三个文档正确渲染，链接有效

- [ ] **步骤 5：最终提交（如有任何调整）**

```bash
# 如果进行了任何小的调整
git add -A
git commit -m "docs: 对分层 README 结构的最终调整"
```

---

## 成功标准

实施成功时：

1. ✅ 所有三个文档文件都存在且格式正确
2. ✅ README.md 提供完整的 2-3 分钟概览
3. ✅ docs/architecture.md 作为全面的技术参考
4. ✅ docs/contributing.md 使开发者能够在没有困惑的情况下做出贡献
5. ✅ 所有交叉引用和链接正确工作
6. ✅ 行数在指定范围内
7. ✅ 代码示例准确、完整且可复制粘贴
8. ✅ 结构清晰且易于导航

---

## 参考

- **规范：** `docs/superpowers/specs/2026-03-23-hierarchical-readme-design-zh.md`
- **AGENTS.md：** `AGENTS.md` — 详细的架构规范
- **项目文件：** `index.html`、`css/variables.css`、`css/main.css`、`css/landing.css`
