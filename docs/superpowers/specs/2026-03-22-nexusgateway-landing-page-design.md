# NexusGateway 落地页 — 设计规格文档

**日期：** 2026-03-22  
**状态：** 已批准  
**技术栈：** 纯静态 HTML + CSS（无 JavaScript，无构建工具）

---

## 概述

为开源 AI 网关项目 **NexusGateway** 创建一个单页官方落地页。
目标受众是正在评估或计划采用该项目的开发者。
页面需呈现现代感、技术感和可信度，与顶级开源工具（如 Vercel、Linear、Shadcn）的视觉风格保持一致。

---

## 视觉设计

### 配色方案 — "石板橙辉"

| CSS Token | 色值 | 用途 |
|---|---|---|
| `--color-bg` | `#0f172a` | 页面背景 |
| `--color-surface` | `#1e293b` | 卡片 / 区块背景 |
| `--color-surface-2` | `#020617` | 代码块背景 |
| `--color-border` | `#334155` | 默认边框 |
| `--color-border-accent` | `rgba(249,115,22,0.25)` | 悬停 / 高亮时的强调边框 |
| `--color-primary` | `#f97316` | 主色橙 — 按钮、激活态 |
| `--color-primary-hover` | `#ea580c` | 主按钮悬停色 |
| `--color-primary-2` | `#ef4444` | 渐变终止色（橙→红） |
| `--color-text` | `#f8fafc` | 主要文字 |
| `--color-text-muted` | `#94a3b8` | 次要文字 / 说明文字 |
| `--color-text-faint` | `#475569` | 淡色 / 禁用文字 |
| `--color-accent-blue` | `#60a5fa` | 代码语法：关键字 |
| `--color-accent-green` | `#34d399` | 代码语法：字符串 / 成功状态 |
| `--color-accent-purple` | `#a78bfa` | 代码语法：import 语句 |

### 字体

- **界面字体：** 系统字体栈（`-apple-system, BlinkMacSystemFont, 'Segoe UI', sans-serif`）
- **代码字体：** `'JetBrains Mono', 'Fira Code', 'Cascadia Code', monospace`
- 字号统一使用 `AGENTS.md` 中定义的 `--font-size-*` token

### 装饰元素

- **径向光晕：** `radial-gradient(circle, <颜色>40, transparent 70%)`，绝对定位置于各区块背景
- **渐变文字：** `background: linear-gradient(90deg, var(--color-primary), var(--color-primary-2)); -webkit-background-clip: text; -webkit-text-fill-color: transparent`
- **卡片悬停：** `translateY(-3px)` 上浮 + 边框颜色切换为 `--color-border-accent`

---

## 页面结构

单文件：`index.html`（根页面）。  
CSS 加载顺序：`reset.css` → `variables.css` → `main.css` → `landing.css`

```
index.html
css/
  reset.css
  variables.css
  main.css
  landing.css
```

---

## 各区块详细说明

### 1. `<header>` — 吸顶导航栏

- **Logo：** 六边形图标 + "NexusGateway" 文字标识（橙色）
- **导航链接：** Features · Docs · GitHub（在新标签页打开）
- **CTA 按钮：** "GitHub ★" — 链接至 `https://github.com/nexusgateway/nexusgateway`
- **滚动行为：** 吸顶固定，纯 CSS `position: sticky` 实现
- **移动端（≤768px）：** 导航链接垂直堆叠排列于 Logo 下方（无汉堡菜单，无 JS）

### 2. `<section class="hero">` — 全幅光晕英雄区

布局：居中对齐，最小高度 `min-height: 100vh`，flex 垂直居中。

内容从上到下依次为：
1. **版本徽章：** 胶囊形标签 — `v1.0 · OPEN SOURCE`，带橙色边框与光晕
2. **主标题：** `The AI Gateway for Production Teams` — 大号加粗
3. **渐变副标题：** `Route. Secure. Scale. Any AI Provider.` — 橙→红渐变文字
4. **说明文字：** 单行简介，使用柔和色调
5. **CTA 按钮组：** 主按钮"快速开始 →" + 描边按钮"★ GitHub"
6. **社区数据行：** `★ 2.3k stars · MIT License · v1.0.0`，使用淡色文字

背景：`--color-bg` 底色上叠加两个径向光晕（右上橙色、左下蓝色）。

### 3. `<section class="features">` — 特性卡片区

区块头部：小号全大写标签 + 大号区块标题 + 柔和副标题。

**6 张特性卡片，3 列网格布局**（移动端 ≤768px 折叠为 1 列）：

| 序号 | 图标 | 英文标题 | 中文标题 | 描述 |
|---|---|---|---|---|
| 1 | ⚡ | Smart Routing | 智能路由 | 基于延迟、成本、可用性自动选择最优 Provider |
| 2 | 🔒 | Key Management | 密钥管理 | 集中管理 API Keys，细粒度权限控制 |
| 3 | 📊 | Observability | 可观测性 | Token 用量、费用、延迟全链路追踪 |
| 4 | 🔄 | Rate Limiting | 限流与重试 | 速率限制、自动重试、熔断器保护 |
| 5 | 🌐 | Multi-Provider | 多 Provider | 统一接口接入 OpenAI、Anthropic、Gemini 等 |
| 6 | 🔌 | Plugin System | 插件系统 | 自定义中间件与扩展，灵活集成业务逻辑 |

每张卡片：深色渐变背景 + 彩色图标 + 标题 + 描述 + 角落微光晕装饰。悬停效果：上浮 + 强调边框。

### 4. `<section class="code-demo">` — 代码示例区（多标签）

布局：居中容器，最大宽度窄于全页。

区块头部：标签 + 标题"几行代码，接入所有 AI"。

**多标签代码窗口：**
- 标签栏：Python | Node.js | cURL（纯 CSS 标签切换，使用隐藏 radio input）
- macOS 风格窗口装饰：三色圆点 + 文件名标签
- 语法高亮：静态 HTML `<span>` 着色，无需 JS 库

**Python 标签内容：**
```python
import openai

client = openai.OpenAI(
    base_url="http://localhost:8080/v1",
    api_key="nex-your-key"
)

response = client.chat.completions.create(
    model="gpt-4o",
    messages=[{"role": "user", "content": "Hello!"}]
)
```

**Node.js 标签内容：**
```js
import OpenAI from 'openai';

const client = new OpenAI({
  baseURL: 'http://localhost:8080/v1',
  apiKey: 'nex-your-key',
});

const response = await client.chat.completions.create({
  model: 'gpt-4o',
  messages: [{ role: 'user', content: 'Hello!' }],
});
```

**cURL 标签内容：**
```bash
curl http://localhost:8080/v1/chat/completions \
  -H "Authorization: Bearer nex-your-key" \
  -H "Content-Type: application/json" \
  -d '{
    "model": "gpt-4o",
    "messages": [{"role": "user", "content": "Hello!"}]
  }'
```

**代码块下方关键说明：** "兼容 OpenAI SDK — 无需修改任何现有代码"

### 5. `<section class="cta-github">` — GitHub 行动号召横幅

全宽深色横幅，带橙色光晕，内容居中：
- **主标题：** "开源、免费、可自托管"
- **副标题：** "加入社区，一起构建下一代 AI 基础设施"
- **按钮组：** "★ Star on GitHub"（主按钮）+ "查看文档"（描边按钮）
- **社区数据行：** `★ 2.3k stars · 180 forks · 42 contributors`（硬编码静态数值）

### 6. `<footer>` — 页脚

- **左侧：** Logo + 项目标语
- **中间：** 导航链接（Features / Docs / GitHub / License）
- **右侧：** "MIT License · Made with ♥ by the community"
- 底部分割线 + 版权信息

---

## 标签切换 — 纯 CSS 技术方案

使用隐藏的 `<input type="radio">` + `<label>` 元素作为标签触发器。
通过 `:checked` 兄弟选择器控制对应代码面板的显示。

```html
<input type="radio" name="code-tab" id="tab-python" checked hidden>
<input type="radio" name="code-tab" id="tab-node" hidden>
<input type="radio" name="code-tab" id="tab-curl" hidden>

<div class="code-tabs">
  <label for="tab-python" class="code-tab__label">Python</label>
  <label for="tab-node"   class="code-tab__label">Node.js</label>
  <label for="tab-curl"   class="code-tab__label">cURL</label>
</div>

<div class="code-panels">
  <div class="code-panel" id="panel-python">...</div>
  <div class="code-panel" id="panel-node">...</div>
  <div class="code-panel" id="panel-curl">...</div>
</div>
```

CSS 选择器模式：`#tab-python:checked ~ .code-panels #panel-python { display: block; }`

**注意：** `input` 元素必须在 DOM 中位于 `.code-tabs` 和 `.code-panels` 之前，兄弟选择器才能正常工作。

---

## 响应式断点

单断点 `768px`（桌面优先，遵循 `AGENTS.md`）。

| 元素 | 桌面端 | 移动端（≤768px） |
|---|---|---|
| 导航链接 | 水平排列 | 垂直堆叠 |
| Hero 主标题 | `font-size: var(--font-size-4xl)` | `font-size: var(--font-size-2xl)` |
| 特性卡片网格 | 3 列 | 1 列 |
| 代码窗口 | 最大宽度 720px 居中 | 全宽，字号缩小 |
| CTA 横幅按钮 | 并排 | 垂直堆叠 |

---

## 文件创建顺序

遵循 `AGENTS.md` 启动清单：

1. `css/reset.css`
2. `css/variables.css`
3. `css/main.css`
4. `css/landing.css`
5. `index.html`

---

## 约束条件（来自 AGENTS.md）

- 禁止使用内联样式
- 禁止使用 `!important`
- 禁止使用 `id` 选择器进行样式控制
- 禁止硬编码颜色、字号、间距 — 一律使用 `var(--token)`
- 禁止使用 JavaScript
- 禁止引入构建工具
- 全程使用 BEM 命名规范
