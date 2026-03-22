# Superpowers 配置使用指南

## 概述

`.superpowers-config.yml` 文件允许你在本项目中自定义 Superpowers 工具的默认行为，特别是 `finishing-a-development-branch` skill。

## 当前配置

本项目的当前配置为：

```yaml
# 默认完成操作：自动创建 Pull Request
default_completion_action: pr

# PR 目标分支
pr_base_branch: main

# 自动推送分支
pr_auto_push: true

# 跳过确认
skip_confirmation: false
```

这意味着当实施完成时，Superpowers 会**自动**执行以下操作：
1. 推送当前分支到远程
2. 创建 Pull Request 到 `main` 分支
3. 不需要你手动选择

## 配置选项说明

### default_completion_action

控制实施完成后的默认行为：

| 值 | 行为 | 说明 |
|------|------|------|
| `ask` | 询问用户 | 始终显示 4 个选项供选择（原始默认行为）|
| `pr` | 创建 PR | 自动推送并创建 Pull Request |
| `merge` | 合并 | 自动合并到目标分支 |
| `keep` | 保持分支 | 保持分支不变，不推送或合并 |

### pr_base_branch

指定 PR 或合并的目标分支：
- 如果未指定，自动检测 `main` 或 `master`
- 可以设置为 `dev`、`develop` 等其他分支名

### pr_auto_push

是否在创建 PR 之前自动推送：
- `true` - 先推送分支再创建 PR
- `false` - 假设分支已推送，直接创建 PR

### skip_confirmation

是否跳过确认步骤：
- `true` - 跳过确认，直接执行
- `false` - 执行前显示确认信息

## 修改配置

1. 编辑 `.superpowers-config.yml` 文件
2. 修改你需要的配置项
3. 保存文件

**注意：** 目前全局的 Superpowers skill 还不支持读取此配置文件。要让配置生效，你有两个选择：

### 选项 1：手动修改全局 skill（不推荐）

需要修改 `~/.cache/opencode/node_modules/superpowers/skills/finishing-a-development-branch/SKILL.md`：

在 `Step 3: Present Options` 部分，添加配置检查逻辑：

```markdown
### Step 3: Present Options

First, check for project configuration:

```bash
if [ -f .superpowers-config.yml ]; then
  # Read config and use default action
  # Skip presenting options if default is set
else
  # Present 4 options as usual
fi
```

**缺点：**
- 全局修改，影响所有项目
- 更新 superpowers 时会被覆盖

### 选项 2：使用自定义工作流（推荐）

使用 Superpowers 的 `subagent-driven-development` skill 时，在实施完成后手动控制行为：

```bash
# 推送并创建 PR
git push -u origin $(git branch --show-current)
gh pr create --title "Your PR Title" --body "Description"
```

或者，在对话中明确要求：

```
实施完成后，请直接创建 PR，不需要询问我选项。
```

### 选项 3：向 Superpowers 项目贡献此功能（最佳长期方案）

这是一个有用的功能，可以向 Superpowers 项目贡献 PR：

1. Fork [superpowers 仓库](https://github.com/obra/superpowers)
2. 修改 `finishing-a-development-branch/SKILL.md`
3. 添加读取 `.superpowers-config.yml` 的逻辑
4. 提交 PR

这样所有项目都可以受益于此功能。

## 当前状态

**已创建：**
- ✅ `.superpowers-config.yml` - 项目配置文件
- ⚠️ 全局 skill 尚未修改，配置**未生效**

**下一步：**
1. 选择上述一个选项使配置生效
2. 或者继续使用当前行为，手动在实施完成后创建 PR

## 示例配置

### 快速开发模式（总是创建 PR）

```yaml
default_completion_action: pr
pr_auto_push: true
skip_confirmation: true
```

### 审查模式（总是询问）

```yaml
default_completion_action: ask
```

### 本地开发模式（保持分支）

```yaml
default_completion_action: keep
pr_auto_push: false
```

## 相关文档

- [Superpowers GitHub](https://github.com/obra/superpowers)
- [Superpowers README](~/.cache/opencode/node_modules/superpowers/README.md)
- [finishing-a-development-branch skill](~/.cache/opencode/node_modules/superpowers/skills/finishing-a-development-branch/SKILL.md)
- [AGENTS.md](AGENTS.md) - 项目架构和开发指南
