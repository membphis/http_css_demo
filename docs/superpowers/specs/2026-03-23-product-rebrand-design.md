# 产品重命名设计文档：AISIX AI Gateway → mmmm

**日期：** 2026-03-23  
**状态：** 已批准  
**类型：** 品牌重命名

## 概述

将产品名称从 "AISIX AI Gateway" 重命名为 "mmmm"，保持 AI Gateway 定位不变。这是一次纯粹的品牌名称更新，不涉及目录结构、代码架构或功能变更。

## 目标

- 将所有用户可见的 "AISIX AI Gateway" 品牌名称替换为 "mmmm"
- 保持产品定位为 "Open Source AI Gateway"
- 确保文档、页面、配置文件的一致性
- 保持项目目录名 `http_css_demo` 不变

## 范围界定

### 需要修改

- **产品名称：** "AISIX AI Gateway" → "mmmm"
- **品牌名单独出现：** "AISIX" → "mmmm"
- **所有用户可见文本：** HTML 页面、文档、README

### 不需要修改

- **目录名：** `http_css_demo` 保持不变
- **产品描述：** "Open Source AI Gateway" 保持
- **产品类型：** "AI Gateway" 保持
- **CSS 样式文件：** 无品牌名称硬编码
- **项目结构：** 文件组织方式不变

## 受影响的文件

### 核心文件（必须修改）

1. **index.html**
   - `<title>` 标签
   - `<meta name="description">` 内容
   - 站点 header 中的品牌名称
   - Hero 区域的标题文本
   - Footer 中的品牌引用

2. **README.md**
   - 项目标题（第一行 H1）
   - 概述部分的产品描述
   - 项目结构说明中的引用

3. **AGENTS.md**
   - 项目状态描述
   - 任何产品名称引用

### 文档文件（已检查，无需修改）

4. **docs/architecture.md** - 不包含产品名称
5. **docs/contributing.md** - 不包含产品名称  
6. **QUICKSTART_PR.md** - 不包含产品名称

### 历史文档（保持不变）

7. **docs/superpowers/plans/** - 历史实现计划，作为历史记录保留
8. **docs/superpowers/specs/** - 历史设计文档，作为历史记录保留
9. **本规格文档** - `2026-03-23-product-rebrand-design.md` 作为设计记录保持不变

### 配置文件（需注意）

- **.gitignore** - 无需修改
- **LICENSE** - 无需修改（除非包含产品名称）
- **GitHub 链接** - HTML 中的链接保持指向当前仓库

## 替换规则

### 精确匹配模式

| 原文本 | 新文本 | 应用场景 |
|--------|--------|----------|
| `AISIX AI Gateway` | `mmmm` | 完整产品名称 |
| `AISIX` | `mmmm` | 单独品牌名 |
| `Open Source AI Gateway` | 保持不变 | 产品描述/副标题 |
| `AI Gateway` | 保持不变 | 产品类型 |

### 替换策略

- **区分大小写：** 保持 "mmmm" 小写（除非出现在句首）
- **全局搜索：** 使用 `grep -r "AISIX"` 确保无遗漏
- **上下文检查：** 每次替换后检查语义是否通顺
- **中英文混合：** 统一处理，不区分语言

### 特殊情况处理

- **Git 历史：** 保持不变，不重写历史记录
- **Commit 消息：** 历史 commit 中的 "AISIX" 不修改
- **URL/链接：** GitHub 仓库链接保持现状
- **文件名：** 无包含品牌名称的文件名
- **历史文档：** `docs/superpowers/plans/` 和 `docs/superpowers/specs/` 中的文件作为历史记录保持不变
- **本规格文档：** 本文件 `docs/superpowers/specs/2026-03-23-product-rebrand-design.md` 作为设计记录保持不变

## 修改示例

### index.html

**修改前：**
```html
<title>AISIX AI Gateway — Open Source AI Gateway</title>
<meta name="description" content="Route, secure and scale any AI provider...">

<a href="/" class="site-header__logo">
  <div class="site-header__logo-icon">⬡</div>
  AISIX AI Gateway
</a>

<h1 class="hero__title">
  The AI Gateway for<br>
  <span class="hero__title-gradient">Production Teams</span>
</h1>
```

**修改后：**
```html
<title>mmmm — Open Source AI Gateway</title>
<meta name="description" content="Route, secure and scale any AI provider...">

<a href="/" class="site-header__logo">
  <div class="site-header__logo-icon">⬡</div>
  mmmm
</a>

<h1 class="hero__title">
  The AI Gateway for<br>
  <span class="hero__title-gradient">Production Teams</span>
</h1>
```

### README.md

**修改前：**
```markdown
# HTTP & CSS Demo — AISIX AI Gateway

> 静态 HTML + CSS 演示落地页，具有干净的架构和现代设计。

此项目演示了 AISIX AI Gateway 的生产就绪静态 HTML + CSS 落地页，
这是一个开源 AI 网关。
```

**修改后：**
```markdown
# HTTP & CSS Demo — mmmm

> 静态 HTML + CSS 演示落地页，具有干净的架构和现代设计。

此项目演示了 mmmm 的生产就绪静态 HTML + CSS 落地页，
这是一个开源 AI 网关。
```

### AGENTS.md

**修改前：**
```markdown
**Active** — AISIX AI Gateway landing page implemented.
```

**修改后：**
```markdown
**Active** — mmmm landing page implemented.
```

## 实施步骤

### 1. 准备阶段

```bash
# 检查工作区状态
git status

# 全局搜索所有包含 AISIX 的文件（排除历史文档）
grep -r "AISIX" --exclude-dir=.git --exclude-dir=.superpowers --exclude-dir=superpowers .

# 创建新分支（可选，根据工作流决定）
git checkout -b rebrand-to-mmmm
```

### 2. 执行替换

按以下顺序逐个文件修改：

1. `index.html` - 使用 Edit 工具精确替换
2. `README.md` - 使用 Edit 工具精确替换
3. `AGENTS.md` - 使用 Edit 工具精确替换

**注意事项：**
- 每个文件修改前先用 Read 工具读取
- 使用 Edit 工具的精确匹配，避免误替换
- 每次替换后检查上下文语义

### 3. 验证阶段

```bash
# 再次全局搜索，确认没有遗漏（排除历史文档）
grep -r "AISIX" --exclude-dir=.git --exclude-dir=.superpowers --exclude-dir=superpowers .

# 预览 HTML 页面
xdg-open index.html  # Linux
# 或
open index.html      # macOS
```

**人工检查清单：**
- [ ] 浏览器中页面标题显示为 "mmmm"
- [ ] Header logo 显示为 "mmmm"
- [ ] Hero 区域标题正确
- [ ] Footer 中品牌名称正确
- [ ] README.md 标题和内容一致
- [ ] 文档引用统一
- [ ] 历史文档（docs/superpowers/plans/ 和 specs/）保持不变

### 4. 提交更改

```bash
# 查看所有修改的文件
git status

# 添加所有修改的文件（已通过 git status 预检查）
git add -A

# 创建符合规范的 commit
git commit -m "chore: rebrand from AISIX AI Gateway to mmmm"

# 查看 commit 内容
git show HEAD
```

## 验证标准

### 功能验证

- ✅ 所有文件中不再出现 "AISIX AI Gateway"
- ✅ 所有文件中不再出现单独的 "AISIX"
- ✅ 产品名称统一显示为 "mmmm"
- ✅ "Open Source AI Gateway" 描述保留
- ✅ "AI Gateway" 产品类型保留

### 用户体验验证

- ✅ 浏览器标签页标题正确
- ✅ 页面 header 品牌名称正确
- ✅ Hero 区域视觉效果无影响
- ✅ 所有链接功能正常
- ✅ 响应式布局无破坏

### 文档一致性验证

- ✅ README.md 与页面内容一致
- ✅ AGENTS.md 描述准确
- ✅ 所有文档引用统一
- ✅ 无拼写或语法错误

### 技术验证

- ✅ HTML 语法有效
- ✅ Git commit 符合 Conventional Commits 规范
- ✅ 无未追踪的修改文件
- ✅ 搜索 "AISIX" 无结果（除 git 历史）

## 风险与注意事项

### 低风险

- **CSS 样式：** 无品牌名称硬编码，不受影响
- **项目结构：** 目录名保持不变，路径引用无需修改
- **功能性：** 纯文本替换，不涉及逻辑变更

### 需要注意

- **外部链接：** GitHub 链接仍指向 `http_css_demo` 仓库
- **历史记录：** Git 历史中的 "AISIX" 保持不变（正常）
- **SEO 影响：** 如已部署到生产环境，品牌名变更可能影响搜索排名

### 后续可能需要

- 如果 GitHub 仓库需要改名，需单独在 GitHub 上操作
- 如果有部署的生产环境，需要重新部署
- 如果有外部引用文档，需单独更新

## 回滚方案

如果需要回滚此次更改：

```bash
# 回退到上一次 commit
git revert HEAD

# 或者硬回退（慎用）
git reset --hard HEAD~1
```

建议在合并到主分支前充分测试。

## 成功标准

本次重命名成功的标准：

1. **完整性：** 所有用户可见的 "AISIX AI Gateway" 已替换为 "mmmm"
2. **一致性：** 所有文件中的品牌名称统一
3. **功能性：** 页面显示和功能无任何破坏
4. **可维护性：** 文档清晰，未来修改有章可循
5. **符合规范：** Git commit 遵循项目约定

## 附录

### 相关命令参考

```bash
# 全局搜索（包含行号，排除历史文档）
grep -rn "AISIX" --exclude-dir=.git --exclude-dir=.superpowers --exclude-dir=superpowers .

# 统计出现次数（排除历史文档）
grep -r "AISIX" --exclude-dir=.git --exclude-dir=.superpowers --exclude-dir=superpowers . | wc -l

# 只列出文件名（排除历史文档）
grep -rl "AISIX" --exclude-dir=.git --exclude-dir=.superpowers --exclude-dir=superpowers .

# 全局搜索（不区分大小写）
grep -ri "aisix" --exclude-dir=.git --exclude-dir=superpowers .
```

### 测试清单

在提交前完成以下测试：

- [ ] 在 Chrome/Chromium 中打开 index.html
- [ ] 检查浏览器标签页标题
- [ ] 检查页面 header 显示
- [ ] 检查 hero 区域文本
- [ ] 检查 footer 品牌名称
- [ ] 滚动页面查看所有区域
- [ ] 检查所有文档文件内容
- [ ] 运行 grep 命令验证无遗漏（使用 --exclude-dir=superpowers）
- [ ] 确认历史文档（docs/superpowers/）未被修改
