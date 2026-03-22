# HTTP & CSS Demo — AISIX

> 静态 HTML + CSS 演示落地页，具有干净的架构和现代设计。

## 概述

此项目演示了 AISIX 的生产就绪静态 HTML + CSS 落地页，这是一个开源 AI 网关。使用纯 HTML 和 CSS 构建 — 无构建工具、无打包器、无 JavaScript。

**技术栈：**
- 静态 HTML5
- 现代 CSS（自定义属性、网格、弹性盒）
- 无构建工具或包管理器

**项目状态：**
- 活跃 — AISIX 落地页已实现

直接在浏览器中打开 `.html` 文件以预览。

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

## 项目结构

```
http_css_demo/
├── README.md              # 此文件
├── AGENTS.md              # 架构和开发指南
├── index.html             # AISIX 落地页
├── css/
│   ├── reset.css           # 浏览器重置（box-sizing、列表、锚点、媒体）
│   ├── variables.css       # 设计令牌（所有 CSS 自定义属性）
│   ├── main.css            # 全局样式（导航、按钮、页脚、响应式）
│   └── landing.css         # 落地页特定样式
└── docs/
    ├── architecture.md     # CSS 架构和约定（详细）
    └── contributing.md     # 贡献指南和工作流程
```

## 文档

- **[架构与约定](docs/architecture.md)** — 深入探索 CSS 架构、设计令牌、命名约定和组件模式
- **[贡献指南](docs/contributing.md)** — 如何添加页面、组件并有效贡献
- **[AGENTS.md](AGENTS.md)** — 详细的架构规范和开发指南
- **[Superpowers 配置指南](docs/SUPERPOWERS_CONFIG_GUIDE.md)** — 自定义 Superpowers 工具行为
- **[快速创建 PR](QUICKSTART_PR.md)** — 使用辅助脚本快速创建 Pull Request

## 主要特性

- **纯 HTML + CSS** — 无 JavaScript、无构建工具、无依赖
- **响应式设计** — 桌面优先，在 768px 处有单一断点
- **BEM 命名约定** — 清晰、可维护的 CSS 类名
- **设计令牌系统** — 通过 CSS 自定义属性实现一致样式
- **交互式组件** — 仅 CSS 的交互性（悬停状态、标签页）
- **现代视觉设计** — 带有渐变、发光和玻璃效果的暗色主题

## 浏览器支持

适用于所有支持 CSS 自定义属性的现代浏览器：
- Chrome/Edge 88+
- Firefox 85+
- Safari 14+

## 许可证

MIT 许可证 — 详见 [LICENSE](LICENSE)
