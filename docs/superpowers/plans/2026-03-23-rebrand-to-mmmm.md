# 产品重命名实施计划：AISIX AI Gateway → mmmm

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** 将产品名称从 "AISIX AI Gateway" 重命名为 "mmmm"，保持 AI Gateway 定位不变

**Architecture:** 这是一次纯文本替换操作，涉及 3 个文件（index.html、README.md、AGENTS.md）。每个文件的所有 "AISIX AI Gateway" 和 "AISIX" 都将替换为 "mmmm"，保持其他描述性文本（"Open Source AI Gateway"、"AI Gateway"）不变。历史文档（docs/superpowers/）保持不变。

**Tech Stack:** 
- 纯文本编辑（HTML、Markdown）
- Git（版本控制和提交）
- Grep（验证搜索）

---

## 前置检查

### Task 0: 验证工作区状态

**Files:**
- Check: 工作区状态
- Verify: 需要修改的文件列表

- [ ] **Step 1: 检查 Git 工作区状态**

```bash
git status
```

Expected: 工作区干净，或只有已知的未提交更改

- [ ] **Step 2: 搜索所有包含 AISIX 的文件（排除历史文档）**

```bash
grep -rl "AISIX" --exclude-dir=.git --exclude-dir=.superpowers --exclude-dir=superpowers .
```

Expected output:
```
./README.md
./AGENTS.md
./index.html
```

如果输出结果与预期不符，停止并报告。

- [ ] **Step 3: 统计每个文件中 AISIX 的出现次数**

```bash
echo "=== index.html ===" && grep -o "AISIX" index.html | wc -l
echo "=== README.md ===" && grep -o "AISIX" README.md | wc -l
echo "=== AGENTS.md ===" && grep -o "AISIX" AGENTS.md | wc -l
```

Expected:
- index.html: 6 次
- README.md: 4 次  
- AGENTS.md: 2 次

---

## 实施任务

### Task 1: 重命名 index.html 中的品牌名称

**Files:**
- Modify: `index.html:6` (title)
- Modify: `index.html:19` (header logo)
- Modify: `index.html:24` (GitHub link)
- Modify: `index.html:46` (hero CTA GitHub link)
- Modify: `index.html:222` (footer text)

**替换规则：**
- "AISIX AI Gateway" → "mmmm"
- 单独的 "AISIX" → "mmmm"

- [ ] **Step 1: 读取 index.html 文件**

使用 Read 工具读取 `index.html` 全文，确认需要修改的位置。

- [ ] **Step 2: 替换 title 标签中的品牌名称**

在 `index.html:6` 位置：

**修改前：**
```html
  <title>AISIX AI Gateway — Open Source AI Gateway</title>
```

**修改后：**
```html
  <title>mmmm — Open Source AI Gateway</title>
```

使用 Edit 工具精确替换。

- [ ] **Step 3: 替换 header logo 中的品牌名称**

在 `index.html:17-20` 位置：

**修改前：**
```html
      <a href="/" class="site-header__logo">
        <div class="site-header__logo-icon">⬡</div>
        AISIX AI Gateway
      </a>
```

**修改后：**
```html
      <a href="/" class="site-header__logo">
        <div class="site-header__logo-icon">⬡</div>
        mmmm
      </a>
```

使用 Edit 工具精确替换。

- [ ] **Step 4: 验证 index.html 中不再包含 AISIX**

```bash
grep -n "AISIX" index.html
```

Expected: 无输出（不包含 AISIX）

- [ ] **Step 5: 在浏览器中预览验证**

```bash
xdg-open index.html  # Linux
# 或
open index.html      # macOS
```

检查：
- 浏览器标签页标题显示为 "mmmm — Open Source AI Gateway"
- Header logo 显示为 "mmmm"
- 页面其他内容正常显示

- [ ] **Step 6: 提交 index.html 的更改**

```bash
git add index.html
git commit -m "chore: rebrand index.html from AISIX AI Gateway to mmmm"
```

Expected: Commit 成功创建

---

### Task 2: 重命名 README.md 中的品牌名称

**Files:**
- Modify: `README.md:1` (主标题)
- Modify: `README.md:7` (概述描述)
- Modify: `README.md:15` (项目状态)
- Modify: `README.md:58` (项目结构注释)

**替换规则：**
- "AISIX AI Gateway" → "mmmm"
- 单独的 "AISIX" → "mmmm"

- [ ] **Step 1: 读取 README.md 文件**

使用 Read 工具读取 `README.md` 全文，确认需要修改的位置。

- [ ] **Step 2: 替换主标题中的品牌名称**

在 `README.md:1` 位置：

**修改前：**
```markdown
# HTTP & CSS Demo — AISIX AI Gateway
```

**修改后：**
```markdown
# HTTP & CSS Demo — mmmm
```

使用 Edit 工具精确替换。

- [ ] **Step 3: 替换概述部分的产品描述**

在 `README.md:7` 位置：

**修改前：**
```markdown
此项目演示了 AISIX AI Gateway 的生产就绪静态 HTML + CSS 落地页，这是一个开源 AI 网关。使用纯 HTML 和 CSS 构建 — 无构建工具、无打包器、无 JavaScript。
```

**修改后：**
```markdown
此项目演示了 mmmm 的生产就绪静态 HTML + CSS 落地页，这是一个开源 AI 网关。使用纯 HTML 和 CSS 构建 — 无构建工具、无打包器、无 JavaScript。
```

使用 Edit 工具精确替换。

- [ ] **Step 4: 替换项目状态描述**

在 `README.md:15` 位置：

**修改前：**
```markdown
- 活跃 — AISIX AI Gateway 落地页已实现
```

**修改后：**
```markdown
- 活跃 — mmmm 落地页已实现
```

使用 Edit 工具精确替换。

- [ ] **Step 5: 替换项目结构注释**

在 `README.md:58` 位置：

**修改前：**
```markdown
├── index.html             # AISIX AI Gateway 落地页
```

**修改后：**
```markdown
├── index.html             # mmmm 落地页
```

使用 Edit 工具精确替换。

- [ ] **Step 6: 验证 README.md 中不再包含 AISIX**

```bash
grep -n "AISIX" README.md
```

Expected: 无输出（不包含 AISIX）

- [ ] **Step 7: 提交 README.md 的更改**

```bash
git add README.md
git commit -m "docs: rebrand README from AISIX AI Gateway to mmmm"
```

Expected: Commit 成功创建

---

### Task 3: 重命名 AGENTS.md 中的品牌名称

**Files:**
- Modify: `AGENTS.md:14` (项目状态描述)
- Modify: `AGENTS.md:56` (项目结构注释)

**替换规则：**
- "AISIX AI Gateway" → "mmmm"
- 单独的 "AISIX" → "mmmm"

- [ ] **Step 1: 读取 AGENTS.md 文件**

使用 Read 工具读取 `AGENTS.md` 全文，确认需要修改的位置。

- [ ] **Step 2: 替换项目状态描述**

在 `AGENTS.md:14` 位置：

**修改前：**
```markdown
**Active** — AISIX AI Gateway landing page implemented. This document defines
```

**修改后：**
```markdown
**Active** — mmmm landing page implemented. This document defines
```

使用 Edit 工具精确替换。

- [ ] **Step 3: 替换项目结构注释**

在 `AGENTS.md:56` 位置：

**修改前：**
```
├── index.html              # AISIX AI Gateway landing page
```

**修改后：**
```
├── index.html              # mmmm landing page
```

使用 Edit 工具精确替换。

- [ ] **Step 4: 验证 AGENTS.md 中不再包含 AISIX**

```bash
grep -n "AISIX" AGENTS.md
```

Expected: 无输出（不包含 AISIX）

- [ ] **Step 5: 提交 AGENTS.md 的更改**

```bash
git add AGENTS.md
git commit -m "docs: rebrand AGENTS.md from AISIX AI Gateway to mmmm"
```

Expected: Commit 成功创建

---

## 最终验证

### Task 4: 全局验证和测试

**Files:**
- Verify: 所有文件
- Test: 浏览器预览

- [ ] **Step 1: 全局搜索验证不再包含 AISIX（排除历史文档）**

```bash
grep -r "AISIX" --exclude-dir=.git --exclude-dir=.superpowers --exclude-dir=superpowers .
```

Expected: 无输出（所有需要修改的文件都已更新）

如果有输出，检查是否为历史文档（docs/superpowers/plans/ 或 docs/superpowers/specs/），这些文件应该保持不变。

- [ ] **Step 2: 验证历史文档未被修改**

```bash
git status docs/superpowers/
```

Expected: 无修改（历史文档保持不变）

- [ ] **Step 3: 在浏览器中完整预览 index.html**

```bash
xdg-open index.html  # Linux
# 或
open index.html      # macOS
```

完整检查清单：
- [ ] 浏览器标签页标题显示 "mmmm — Open Source AI Gateway"
- [ ] Header logo 显示 "mmmm"
- [ ] Hero 区域标题正确显示
- [ ] Features 区域内容正常
- [ ] Code demo 区域正常
- [ ] Footer 品牌名称正确
- [ ] 所有链接可点击
- [ ] 页面样式无破坏
- [ ] 响应式布局正常（调整浏览器窗口测试）

- [ ] **Step 4: 检查所有 commit 记录**

```bash
git log --oneline -5
```

Expected: 看到 3 个新的 commit：
- "docs: rebrand AGENTS.md from AISIX AI Gateway to mmmm"
- "docs: rebrand README from AISIX AI Gateway to mmmm"  
- "chore: rebrand index.html from AISIX AI Gateway to mmmm"

- [ ] **Step 5: 查看 git diff 汇总**

```bash
git diff HEAD~3 HEAD --stat
```

Expected: 显示 3 个文件被修改（index.html, README.md, AGENTS.md）

- [ ] **Step 6: 最终确认**

所有验证通过：
- ✅ 3 个文件已成功重命名品牌
- ✅ 历史文档未被修改
- ✅ 页面在浏览器中正常显示
- ✅ 全局搜索无遗漏的 AISIX
- ✅ Git commit 符合规范

---

## 完成标准

- ✅ index.html 中所有 "AISIX AI Gateway" 和 "AISIX" 已替换为 "mmmm"
- ✅ README.md 中所有 "AISIX AI Gateway" 和 "AISIX" 已替换为 "mmmm"
- ✅ AGENTS.md 中所有 "AISIX AI Gateway" 和 "AISIX" 已替换为 "mmmm"
- ✅ 历史文档（docs/superpowers/）未被修改
- ✅ 页面在浏览器中正确显示品牌名称
- ✅ 全局搜索确认无遗漏
- ✅ 每个文件单独提交，commit message 符合规范
- ✅ 所有功能正常，无破坏性变更

## 回滚方案

如果需要回滚：

```bash
# 查看最近的 3 个 commit
git log --oneline -3

# 回滚最近的 3 个 commit（保留文件更改）
git reset --soft HEAD~3

# 或完全回滚（丢弃文件更改）
git reset --hard HEAD~3
```

## 注意事项

1. **使用 Edit 工具**：每次修改前先用 Read 工具读取文件，使用 Edit 工具精确匹配替换，避免使用 sed/awk
2. **逐文件提交**：每个文件修改后立即提交，不要批量提交
3. **验证上下文**：每次替换后检查上下文语义是否通顺
4. **保留历史文档**：docs/superpowers/ 下的所有文件不要修改
5. **浏览器测试**：每次修改 index.html 后都要在浏览器中预览
6. **Commit 规范**：遵循 Conventional Commits 格式，消息使用英文
