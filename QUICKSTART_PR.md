# Superpowers 配置 - 快速开始

## 已完成的工作

✅ 创建了 `.superpowers-config.yml` - 项目配置文件
✅ 创建了 `docs/SUPERPOWERS_CONFIG_GUIDE.md` - 详细使用指南
✅ 创建了 `scripts/create-pr.sh` - 快速 PR 创建脚本
✅ 已提交到 Git

## 当前配置

```yaml
default_completion_action: pr  # 自动创建 PR
pr_auto_push: true         # 自动推送
pr_base_branch: main        # 目标分支
```

## 使用方法

### 方法 1：使用辅助脚本（推荐）

实施完成后，运行：

```bash
./scripts/create-pr.sh
```

脚本会：
- 检查未提交的更改
- 推送当前分支
- 读取配置文件
- 创建 Pull Request

### 方法 2：手动命令

```bash
# 推送分支
git push -u origin $(git branch --show-current)

# 创建 PR
gh pr create --title "你的标题" --body "你的描述"
```

### 方法 3：配置全局 Superpowers（需要修改）

参考 `docs/SUPERPOWERS_CONFIG_GUIDE.md` 中的详细说明。

## 为什么需要这样？

**原因：** 全局的 Superpowers skill 目前不支持读取项目配置文件。

**解决方案：**
1. 使用辅助脚本（快速、立即生效）
2. 向 Superpowers 项目贡献配置功能（长期方案）
3. 手动修改全局 skill（不推荐）

## 示例工作流程

```bash
# 1. 使用 Superpowers 实施
"帮我完成文档实施"
# ... Superpowers 执行并提交更改 ...

# 2. 实施完成后，创建 PR
./scripts/create-pr.sh

# 3. 完成！PR 已创建
```

## 修改配置

编辑 `.superpowers-config.yml`：

```yaml
# 改为询问模式
default_completion_action: ask

# 或保持分支
default_completion_action: keep
```

## 相关文档

- [详细使用指南](docs/SUPERPOWERS_CONFIG_GUIDE.md)
- [项目架构](AGENTS.md)
- [Superpowers GitHub](https://github.com/obra/superpowers)
