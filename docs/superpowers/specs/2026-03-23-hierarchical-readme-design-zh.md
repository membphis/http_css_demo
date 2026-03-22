# 分层式 README 设计

**日期：** 2026-03-23
**项目：** HTTP & CSS Demo — AISIX AI Gateway
**类型：** 文档架构

---

## 概述

设计一个由三个 markdown 文档组成的分层文档结构，为静态 HTML + CSS 演示项目提供清晰、可访问的开发者文档。

**问题：** 项目缺少 README.md，导致新访问者难以理解项目结构，贡献者也难以知道如何有效地扩展项目。

**解决方案：** 创建三个互补的文档文件，具有清晰的导航和交叉引用，服务于不同的受众和使用场景。

---

## 文档结构

### 要创建的文件

1. **README.md**（根目录，约 80-100 行）
   - 用途：为任何查看仓库的人提供快速入门指南
   - 受众：首次访问者、潜在贡献者
   - 重点：这是什么、如何尝试、在哪里了解更多

2. **docs/architecture.md**（约 200-250 行）
   - 用途：为开发者提供完整的技术参考
   - 受众：贡献者、任何在代码库上工作的人
   - 重点：CSS 架构、约定、设计令牌、模式

3. **docs/contributing.md**（约 150-180 行）
   - 用途：如何有效地贡献
   - 受众：想要添加功能或修复 bug 的人
   - 重点：添加页面、组件、工作流程、最佳实践

### 导航流程

```
README.md
  └─→ 链接到 architecture.md（深入探索）
  └─→ 链接到 contributing.md（如何贡献）

architecture.md
  └─→ 引用 AGENTS.md（详细约定）

contributing.md
  └─→ 引用 architecture.md（当解释模式时）
```

---

## 内容规范

### README.md

#### 章节：

1. **概述** — 简短描述、技术栈、项目状态
2. **快速开始** — 打开 index.html、可选的本地服务器命令
3. **项目结构** — 目录树、css/ 和 pages/ 的说明
4. **文档** — 链接到 architecture.md、contributing.md、AGENTS.md
5. **主要特性** — 响应式设计、BEM 命名、设计令牌、交互式组件
6. **浏览器支持** — 现代浏览器
7. **许可证** — MIT

#### 语气：友好且易于访问，强调即时价值

#### 大纲：

```markdown
# HTTP & CSS Demo — AISIX AI Gateway

## 概述
- 静态 HTML + CSS 演示落地页
- 纯 HTML + CSS，无构建工具
- 活跃：AISIX AI Gateway 落地页已实现

## 快速开始
- 直接在浏览器中打开 index.html
- 可选：python3 -m http.server 8000
- 即时预览体验

## 项目结构
- 目录树
- css/ 和 pages/ 文件夹的简要说明

## 文档
- [架构与约定](docs/architecture.md)
- [贡献指南](docs/contributing.md)
- [AGENTS.md](AGENTS.md) — 详细架构规范

## 主要特性
- 响应式设计（768px 断点）
- BEM 命名约定
- 设计令牌系统
- 交互式组件（仅 CSS）

## 浏览器支持
- 现代浏览器

## 许可证
- MIT
```

---

### docs/architecture.md

#### 章节：

1. **CSS 架构**
   - 文件加载顺序（强制性）
   - 设计令牌系统（所有自定义属性）
   - 令牌参考表（颜色、间距、排版等）

2. **命名约定**
   - HTML 约定（语义标签、缩进）
   - CSS 约定（BEM、属性顺序）
   - 文件命名

3. **组件模式**
   - 容器模式
   - 卡片模式
   - 按钮变体
   - 焦点环
   - 悬停状态

4. **响应式设计**
   - 桌面优先方法
   - 768px 断点
   - 网格模式

5. **设计原则**
   - YAGNI、无内联样式、无 !important
   - 令牌优先开发
   - 参考代码片段

#### 语气：技术性强但易于理解，参考实际项目代码

#### 大纲：

```markdown
# 架构与约定

## CSS 架构

### 文件加载顺序（强制性）
1. reset.css — 始终第一
2. variables.css — 始终第二
3. main.css — 始终第三
4. 页面特定的 CSS — 始终最后

根页面：href="css/*.css"
pages/ 中的页面：href="../css/*.css"

### 设计令牌系统
所有设计值都在 css/variables.css 的 :root 上。
永远不要硬编码十六进制颜色、像素字体大小或魔术数字间距。

### 设计令牌参考

| 前缀         | 用途                    | 示例                    |
|----------------|----------------------------|----------------------------|
| --color-*      | 颜色                     | var(--color-primary)      |
| --font-size-*  | 排版比例（xs–4xl）  | var(--font-size-lg)       |
| --font-weight*| 字重（normal–bold）       | var(--font-weight-bold)   |
| --space-*      | 间距（1–16）             | var(--space-4)            |
| --radius-*     | 边框半径（sm–full）    | var(--radius-md)          |
| --shadow-*     | 阴影（sm–lg）        | var(--shadow-sm)          |
| --transition-* | 持续时间（fast, base）     | var(--transition-fast)    |
| --max-width    | 内容最大宽度          |                            |
| --header-height| 粘性页头高度       |                            |

## 命名约定

### HTML 约定
- 2 空格缩进，所有属性使用双引号
- <html> 上的 lang="en"，必需 charset + viewport 元标签
- 语义元素：<header>、<nav>、<main>、<section>、<footer>
- 子页面标题格式："Page Name - HTTP &amp; CSS Demo"

### CSS 约定 — BEM
- 块：小写，连字符分隔（site-header、demo-section）
- 元素：双下划线（card__title）
- 修饰符：双连字符（btn--outline）
- 最多一个元素层级深度（无 .block__el__sub）
- 多词名称使用连字符，而非驼峰命名

### 属性顺序
布局 → 盒模型 → 排版 → 视觉 → 杂项

## 组件模式

### 居中容器
```css
.container {
  max-width: var(--max-width);
  margin: 0 auto;
  padding: 0 var(--space-6);
}
```

### 带悬停提升的卡片
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

### 焦点环
```css
.input:focus {
  outline: none;
  border-color: var(--color-primary);
  box-shadow: 0 0 0 3px rgba(37, 99, 235, 0.15);
}
```

## 响应式设计

### 断点
- 单一断点：768px
- 桌面优先：@media (max-width: 768px) 覆盖
- 响应式块在每个 CSS 文件的底部
- 优先使用 auto-fit / minmax() 网格以实现内在响应式

## 设计原则

### 不要
- 使用内联样式
- 使用 !important
- 使用 id 选择器进行样式设计
- 硬编码颜色、字体大小或间距
- 除非明确需要，否则添加 JavaScript
- 未经讨论引入构建工具

## 相关文档

- [贡献指南](contributing.md) — 添加功能时如何应用这些模式
- [AGENTS.md](../AGENTS.md) — 完整的架构规范
```

---

### docs/contributing.md

#### 章节：

1. **前提条件**
   - 你需要什么（文本编辑器、浏览器）
   - 无包管理器或构建工具

2. **开发工作流程**
   - 进行更改
   - 本地预览
   - 代码检查（可选工具）

3. **添加新页面**
   - 分步说明
   - 从现有页面复制页头/页脚
   - 更新导航链接

4. **添加新组件**
   - 在适当的 CSS 文件中定义
   - 使用设计令牌
   - 添加悬停/焦点状态

5. **常见模式**
   - 居中内容
   - 带悬停效果的卡片
   - 代码块
   - 响应式网格

6. **代码质量**
   - 遵循 BEM 命名
   - 无硬编码值
   - 使用语义 HTML

#### 语气：鼓励性和指导性，逐步流程

#### 大纲：

```markdown
# 贡献指南

## 前提条件

首先，熟悉架构：
- [架构与约定](architecture.md) — CSS 模式和设计令牌
- [AGENTS.md](../AGENTS.md) — 详细规范

你需要什么：
- 文本编辑器（VS Code、Sublime Text 等）
- 现代网络浏览器（Chrome、Firefox、Safari、Edge）
- 无需包管理器、构建工具或服务器

## 开发工作流程

### 进行更改
1. 直接编辑 HTML 或 CSS 文件
2. 保存你的更改
3. 刷新浏览器以查看更新

### 本地预览
- **直接打开：** 双击 index.html 或右键点击 → "用浏览器打开"
- **本地服务器（可选）：**
  ```bash
  python3 -m http.server 8000
  # 然后访问 http://localhost:8000
  ```

### 代码检查（可选）
不是必需的，但如果想使用检查工具：
```bash
npx htmlhint "**/*.html"
npx stylelint "css/**/*.css"
```

## 添加新页面

### 分步操作

1. 创建页面文件
   ```bash
   # 创建 pages/yourpage.html
   ```

2. 从现有页面复制页头
   - 如果你需要正确的 `../css/` 路径，请使用 `pages/` 页面
   - 按顺序包含所有 CSS 文件：reset → variables → main → yourpage.css

3. 复制页头和页脚
   - 从现有页面逐字复制 `<header>` 和 `<footer>`
   - 用 `nav-link--active` 标记活动导航链接

4. 创建页面特定的 CSS
   - 创建 `css/yourpage.css`
   - 在 head 中将其链接到 `main.css` 之后

5. 更新导航
   - 在 `main.css` 或页面 CSS 中添加链接到 `site-header__nav`
   - 在 `main.css` 中添加链接到 `site-footer__nav`

## 添加新组件

### 分步操作

1. 定义基础块类
   - 选择适当的 CSS 文件（全局使用 main.css，单页使用页面特定）
   - 使用 BEM 命名定义块类

2. 使用设计令牌
   - 永远不要硬编码颜色、间距或字体大小
   - 从[设计令牌表](architecture.md#design-tokens-reference)引用令牌
   - 如需要，将新令牌添加到 `variables.css`

3. 添加悬停和焦点状态
   - 使用过渡令牌以实现平滑动画
   - 示例：`.btn:hover:not(:disabled)` 模式

4. 禁用状态
   - 使用模式：`opacity: 0.5; cursor: not-allowed;`

5. 响应式测试
   - 在桌面（768px+）和移动端（768px 及以下）测试
   - 如需要，添加 `@media (max-width: 768px)` 覆盖

## 常见模式

### 居中内容
使用 main.css 中的容器类：
```html
<div class="container">
  <h1>章节标题</h1>
  <p>内容在这里</p>
</div>
```

### 带悬停效果的卡片
```html
<div class="feature-card">
  <h3 class="feature-card__title">标题</h3>
  <p class="feature-card__desc">描述</p>
</div>
```

### 代码块
使用语法高亮类：
```html
<pre><code><span class="tok-keyword">import</span> <span class="tok-name">openai</span></code></pre>
```

### 响应式网格
```css
.grid {
  display: grid;
  grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
  gap: var(--space-6);
}
```

## 代码质量

### 命名
- 使用 BEM 命名：`.block`、`.block__element`、`.block--modifier`
- 多词名称使用 kebab-case

### 无硬编码值
- 始终为颜色、间距、字体使用 `var(--token)`
- 如需要，将新令牌添加到 `variables.css`

### 语义 HTML
- 使用适当的语义元素：<header>、<nav>、<main>、<section>、<footer>
- 在需要的地方包含适当的元标签和 aria 标签

### 清洁的 CSS
- 每行一个声明
- 规则块之间留空行
- 长文件中的节分隔符：/* --- 节名称 --- */

## 快速参考

添加组件时，参考：
- [architecture.md 中的设计令牌](architecture.md#design-tokens-reference)
- [architecture.md 中的组件模式](architecture.md#component-patterns)
- [architecture.md 中的响应式设计](architecture.md#responsive-design)
```

---

## 导航与交叉引用

### README.md 链接：
```markdown
## 文档
- [架构与约定](docs/architecture.md) — 深入探索 CSS 架构、设计令牌和模式
- [贡献指南](docs/contributing.md) — 如何添加页面、组件并有效贡献
- [AGENTS.md](AGENTS.md) — 详细的架构规范和开发指南
```

### docs/architecture.md 链接：
```markdown
## 相关文档
- [贡献指南](contributing.md) — 添加功能时如何应用这些模式
- [AGENTS.md](../AGENTS.md) — 完整的架构规范

## 下一步
- 阅读[贡献指南](contributing.md) 开始构建
```

### docs/contributing.md 链接：
```markdown
## 前提条件
首先，熟悉架构：
- [架构与约定](architecture.md) — CSS 模式和设计令牌
- [AGENTS.md](../AGENTS.md) — 详细规范

## 快速参考
添加组件时，参考：
- [architecture.md 中的设计令牌](architecture.md#design-tokens-reference)
- [architecture.md 中的组件模式](architecture.md#component-patterns)
```

---

## 语气与风格指南

### 所有文档：
- 清晰、直接的语言（无不必要的术语）
- 实用、行动导向
- 解释旁边附有示例
- 带有上下文的代码片段

### 特定语气：

**README.md：**
- 友好且易于访问
- "你可以..." 而非 "用户应该..."
- 强调即时价值
- 适度使用表情符号（仅在有帮助时）

**docs/architecture.md：**
- 技术性强但易于理解
- "这里是它的工作原理"的方法
- 引用实际项目中的代码
- 包含来自 AGENTS.md 的"不要"反模式

**docs/contributing.md：**
- 鼓励性和指导性
- 逐步流程
- 包含成功标准（"当...时你就知道它正在工作"）
- 故障排除提示

### 代码示例：
- 始终显示完整、可运行的示例
- 尽可能使用项目中的实际代码
- 在解释中突出关键令牌/模式
- 保持示例最小但完整

### 格式一致性：
- 带语言说明符的代码块
- 令牌参考的表格
- 分步的编号列表
- 选项/示例的项目列表
- 用于可扫描性的章节标题（H2/H3）

---

## 成功标准

文档结构成功时：

1. **README.md** 为任何访问仓库的人提供完整的 2-3 分钟概览
2. **docs/architecture.md** 作为贡献者的综合技术参考
3. **docs/contributing.md** 使开发者能够在没有困惑的情况下添加页面和组件
4. 文档之间的导航直观且一致
5. 代码示例准确、完整且可复制粘贴
6. 交叉引用帮助用户快速找到相关信息

---

## 实现说明

### 要创建的文件：
- `README.md`（根目录）
- `docs/architecture.md`
- `docs/contributing.md`

### 引用：
- AGENTS.md 用于架构细节和约定
- 现有 CSS 文件用于代码示例
- index.html 用于项目结构和特性

### 无需依赖：
- 纯 markdown 文件
- 无构建工具或生成器
- 与 GitHub markdown 渲染兼容

---

## 未来考虑

如果项目显著增长，考虑：
- 将 architecture.md 拆分为更小的主题特定文档
- 添加 docs/ 索引页面以实现更好的导航
- 为架构概览创建视觉图表
- 添加故障排除或常见问题部分
- 如果引入破坏性更改，则对文档进行版本控制

然而，对于当前范围，三文件分层结构是适当且充分的。
