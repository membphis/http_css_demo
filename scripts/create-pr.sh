#!/bin/bash
# Superpowers 快速 PR 创建脚本
# 使用此脚本在实施完成后快速创建 Pull Request

set -e

# 颜色定义
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# 打印带颜色的消息
print_info() {
    echo -e "${GREEN}[INFO]${NC} $1"
}

print_warn() {
    echo -e "${YELLOW}[WARN]${NC} $1"
}

print_error() {
    echo -e "${RED}[ERROR]${NC} $1"
}

# 检查是否在 Git 仓库中
if ! git rev-parse --git-dir > /dev/null 2>&1; then
    print_error "当前目录不是一个 Git 仓库"
    exit 1
fi

# 获取当前分支
CURRENT_BRANCH=$(git branch --show-current)
print_info "当前分支: $CURRENT_BRANCH"

# 检查是否有未提交的更改
if ! git diff-index --quiet HEAD --; then
    print_warn "存在未提交的更改"
    git status --short
    echo ""
    read -p "是否先提交这些更改？(y/N) " -n 1 -r
    echo
    if [[ $REPLY =~ ^[Yy]$ ]]; then
        print_info "请先提交你的更改，然后再创建 PR"
        exit 0
    fi
fi

# 读取配置文件（如果存在）
CONFIG_FILE=".superpowers-config.yml"
if [ -f "$CONFIG_FILE" ]; then
    print_info "找到配置文件: $CONFIG_FILE"
    # 简单解析（假设使用默认 pr 设置）
    BASE_BRANCH=$(grep "pr_base_branch:" "$CONFIG_FILE" | sed 's/pr_base_branch: //' | xargs)
    BASE_BRANCH=${BASE_BRANCH:-main}
    print_info "目标分支: $BASE_BRANCH"
else
    BASE_BRANCH="main"
    print_warn "未找到配置文件，使用默认设置"
fi

# 检查是否已推送
if git rev-parse --abbrev-ref --symbolic-full-name @{u} > /dev/null 2>&1; then
    TRACKING=$(git rev-parse --abbrev-ref --symbolic-full-name @{u})
    REMOTE=$(git config branch."$CURRENT_BRANCH".remote")
    REMOTE_BRANCH=${TRACKING#$REMOTE/}
    print_info "分支已推送: $REMOTE/$REMOTE_BRANCH"
else
    print_info "分支未推送，准备推送..."

    # 推送分支
    if git push -u origin "$CURRENT_BRANCH"; then
        print_info "分支推送成功"
    else
        print_error "分支推送失败"
        exit 1
    fi
fi

# 读取 PR 标题模板
if [ -f "$CONFIG_FILE" ]; then
    TITLE_TEMPLATE=$(grep "pr_title_template:" "$CONFIG_FILE" | sed 's/pr_title_template: //' | xargs)
    if [ -n "$TITLE_TEMPLATE" ]; then
        # 替换变量
        TITLE=${TITLE_TEMPLATE//\{\{description\}\}/实施完成}
    else
        TITLE="实施完成"
    fi
else
    TITLE="实施完成"
fi

# 检查是否安装了 gh CLI
if ! command -v gh &> /dev/null; then
    print_error "未找到 GitHub CLI (gh)"
    echo ""
    echo "请安装 GitHub CLI:"
    echo "  macOS:   brew install gh"
    echo "  Ubuntu:  apt install gh"
    echo "  或访问: https://cli.github.com/"
    exit 1
fi

# 确认创建 PR
echo ""
read -p "确定要创建 PR 到 $BASE_BRANCH 吗？(y/N) " -n 1 -r
echo ""

if [[ ! $REPLY =~ ^[Yy]$ ]]; then
    print_info "已取消"
    exit 0
fi

# 获取最近的提交消息作为 PR 描述
LAST_COMMIT_MSG=$(git log -1 --pretty=%B)
RECENT_COMMITS=$(git log -5 --pretty=%s | sed 's/^/- /')

# 创建 PR body
PR_BODY=$(cat <<EOF
## 实施完成

实施已按照计划完成并通过验证。

### 更改内容

- 完成 Superpowers 实施计划
- 所有任务已完成并提交

### 最近的提交

$RECENT_COMMITS

### 验证

- [ ] 所有文档文件已创建
- [ ] 交叉引用正确
- [ ] 在浏览器中测试过
- [ ] 代码示例可复制粘贴
EOF
)

# 创建 PR
print_info "正在创建 PR..."
if gh pr create --base "$BASE_BRANCH" --title "$TITLE" --body "$PR_BODY"; then
    echo ""
    print_info "✓ PR 创建成功！"
    echo ""
    echo "PR URL:"
    gh pr view --web
else
    print_error "PR 创建失败"
    echo ""
    echo "请检查："
    echo "1. 分支是否已推送"
    echo "2. 是否已登录 GitHub (gh auth login)"
    echo "3. 目标分支是否存在"
    exit 1
fi
