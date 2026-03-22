# Feature Card Hover Glow Effect 实施计划

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** 为 Feature 卡片添加鼠标悬停时的橙色品牌色外部发光效果

**Architecture:** 通过修改 `css/landing.css` 中 `.feature-card:hover` 选择器的 box-shadow 属性，添加三层阴影实现发光效果（边框光晕环 + 外部发光 + 投影）

**Tech Stack:** 纯 CSS，box-shadow，CSS transitions

---

## 文件结构

**需要修改的文件：**
- `css/landing.css` — Feature 卡片的样式定义

**不变文件：**
- `css/variables.css` — 无需添加新的设计 tokens
- `index.html` — 无需修改 HTML 结构
- 其他 CSS 文件 — 不受影响

---

### Task 1: 备份当前状态

**Files:**
- Read: `css/landing.css:157-173`

- [ ] **Step 1: 读取当前的 `.feature-card:hover` 实现**

```bash
grep -A 10 "\.feature-card:hover" css/landing.css
```

Expected: 看到现有的 hover 效果定义

- [ ] **Step 2: 创建视觉回归测试目录**

```bash
mkdir -p docs/visual-regression
```

Expected: 目录创建成功

- [ ] **Step 3: 截图 Features 区域用于对比**

在浏览器中打开 `index.html`，导航到 Features 区域，保存截图作为修改前的视觉记录

文件保存位置：`docs/visual-regression/features-before.png`

---

### Task 2: 修改 `.feature-card:hover` 选择器

**Files:**
- Modify: `css/landing.css:169-173`

- [ ] **Step 1: 用多层 box-shadow 替换单一 shadow**

将现有的：
```css
.feature-card:hover {
  transform: translateY(-3px);
  border-color: var(--color-border-accent);
  box-shadow: var(--shadow-md);
}
```

替换为：
```css
.feature-card:hover {
  transform: translateY(-3px);
  border-color: var(--color-border-accent);
  box-shadow:
    0 0 0 1px rgba(249, 115, 22, 0.2),    /* 边框光晕环 */
    0 0 20px rgba(249, 115, 22, 0.35),     /* 外部发光 */
    0 4px 12px rgba(0, 0, 0, 0.5);        /* 投影阴影 */
}
```

- [ ] **Step 2: 验证 CSS 语法正确**

```bash
# 验证 CSS 语法（可选，如果已安装 stylelint）
npx stylelint "css/landing.css" --fix
```

Expected: 无语法错误

---

### Task 3: 验证视觉效果

**Files:**
- None (浏览器测试)

- [ ] **Step 1: 在浏览器中打开页面**

```bash
# Linux
xdg-open index.html

# macOS
open index.html
```

- [ ] **Step 2: 导航到 Features 区域并测试悬停效果**

1. 滚动到 Features 区域
2. 将鼠标悬停在每张 Feature 卡片上（6 张）
3. 验证每张卡片都显示橙色外部发光
4. 验证发光动画平滑（250ms 过渡）

Expected: 所有卡片悬停时显示橙色发光，动画流畅

- [ ] **Step 3: 截图 Features 区域修改后效果**

文件保存位置：`docs/visual-regression/features-after.png`

- [ ] **Step 4: 对比前后截图**

对比 `docs/visual-regression/features-before.png` 和 `docs/visual-regression/features-after.png`

Expected: 悬停效果有明显的橙色发光增强，其他元素无变化

---

### Task 4: 测试响应式设计

**Files:**
- None (浏览器测试)

- [ ] **Step 1: 调整浏览器窗口宽度至 < 768px**

在开发者工具中切换到移动端视图或手动调整窗口宽度

- [ ] **Step 2: 验证卡片布局和悬停效果**

1. 验证卡片垂直堆叠（现有响应式行为保持不变）
2. 验证悬停效果仍然有效（橙色发光）
3. 验证动画仍然平滑

Expected: 布局和悬停效果在移动端视图下正常工作

- [ ] **Step 3: 测试 Firefox 浏览器**

在 Firefox 中打开 `index.html`，重复 Step 2 的测试

Expected: 发光效果与 Chrome/Edge 一致

---

### Task 5: 测试边缘情况

**Files:**
- None (浏览器测试)

- [ ] **Step 1: 快速悬停测试**

将鼠标快速在多张卡片间移动

Expected: 动画不中断，每次悬停都正确触发发光

- [ ] **Step 2: 验证悬停状态清除**

1. 悬停在卡片上
2. 移开鼠标
3. 验证发光效果完全消失

Expected: 鼠标离开后发光效果立即消失

---

### Task 6: 代码审查

**Files:**
- Review: `css/landing.css:169-173`

- [ ] **Step 1: 验证遵循 BEM 命名约定**

确认 `.feature-card:hover` 使用正确的 BEM 块级选择器

- [ ] **Step 2: 验证品牌色一致性**

确认使用 `rgba(249, 115, 22, ...)` 匹配现有品牌色 `--color-primary: #f97316`，符合 spec 中"无需新的设计 tokens"的要求

- [ ] **Step 3: 验证使用设计 tokens**

确认：
- `border-color` 使用 `var(--color-border-accent)`
- 过渡时间使用现有的 `--transition-base`（已在 transition 声明中）

- [ ] **Step 4: 验证单文件变更范围**

确认仅修改了 `css/landing.css`，其他文件未受影响

```bash
git status
```

Expected: 只有 `css/landing.css` 被修改

---

### Task 7: 提交代码

**Files:**
- Commit: `css/landing.css`

- [ ] **Step 1: 添加修改到 git**

```bash
git add css/landing.css
```

- [ ] **Step 2: 创建提交**

```bash
git commit -m "feat: add brand color external glow to feature cards on hover

- Add 3-layer box-shadow to .feature-card:hover
- Border glow ring (1px, rgba orange 0.2 opacity)
- External glow (20px blur, rgba orange 0.35 opacity)
- Drop shadow (existing, for depth)
- Maintains existing translateY(-3px) lift animation
- All 6 feature cards use unified brand orange glow"
```

Expected: Commit 成功

- [ ] **Step 3: 查看提交历史**

```bash
git log --oneline -3
```

Expected: 新提交显示在历史中

---

### Task 8: 可选：推送到远程仓库

**Files:**
- Git remote

- [ ] **Step 1: 推送到远程 main 分支**

```bash
git push origin main
```

Expected: 推送成功，远程仓库包含最新变更

- [ ] **Step 2: 验证 GitHub 上的文件**

在浏览器中访问 GitHub 仓库，确认变更已推送

---

## 验证清单

实施完成后，验证以下项目：

**功能性：**
- [ ] 悬停在任何 Feature 卡片上显示橙色外部发光
- [ ] 发光动画平滑（250ms 过渡）
- [ ] 所有 6 张 Feature 卡片发光效果一致

**视觉：**
- [ ] 发光可见但不刺眼
- [ ] 发光与现有卡片设计相辅相成
- [ ] 悬停效果感觉精致和专业
- [ ] 发光颜色与品牌身份匹配（橙色）

**性能：**
- [ ] 无布局偏移或卡顿
- [ ] 动画 60fps 或更好
- [ ] 页面加载时间无增加

**代码质量：**
- [ ] 遵循 AGENTS.md BEM 命名约定
- [ ] 使用设计 tokens（无其他硬编码颜色）
- [ ] 单文件变更（最小范围）

**浏览器兼容性：**
- [ ] Chrome/Edge 工作正常
- [ ] Firefox 工作正常
- [ ] 响应式设计（<768px）工作正常

---

## 回滚计划

如果需要回滚：

```bash
# 回滚到上一个提交
git reset --hard HEAD~1

# 或者撤销特定提交
git revert HEAD
```

---

## 相关文档

- **设计规范:** `docs/superpowers/specs/2026-03-23-feature-card-glow-effect-design.md`
- **项目约定:** `AGENTS.md`
- **现有 CSS:** `css/landing.css`, `css/variables.css`
