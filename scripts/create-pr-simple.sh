#!/bin/bash
set -e

# 颜色定义
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m'

print_info() { printf "${GREEN}[INFO]${NC} %s\n" "$1"; }
print_warn() { printf "${YELLOW}[WARN]${NC} %s\n" "$1"; }
print_error() { printf "${RED}[ERROR]${NC} %s\n" "$1"; }

# 获取当前分支
CURRENT_BRANCH=$(git branch --show-current)
print_info "当前分支: $CURRENT_BRANCH"

# 检查未提交的更改
if ! git diff-index --quiet HEAD --; then
    print_warn "存在未提交的更改"
    git status --short
    echo ""
    print_warn "请先提交更改"
    exit 1
fi

# 推送分支
print_info "正在推送分支..."
if git push -u origin "$CURRENT_BRANCH"; then
    print_info "分支推送成功"
else
    print_error "分支推送失败"
    exit 1
fi

# 检查 gh CLI
if ! command -v gh &> /dev/null; then
    print_error "未找到 GitHub CLI (gh)"
    echo ""
    echo "请安装: brew install gh"
    exit 1
fi

# 创建 PR
TITLE="feat: 为主按钮添加悬停发光效果"

RECENT_COMMITS=$(git log -5 --pretty=%s | sed 's/^/- /')

PR_BODY=$(cat <<EOF
## 实施完成

为主按钮添加悬停发光效果。

### 更改内容

- 使用四层阴影系统
- 橙色内环、外发光、第二层发光
- 立体投影
- 淡入淡出动画

### 最近的提交

$RECENT_COMMITS
EOF
)

print_info "正在创建 PR..."
if gh pr create --title "$TITLE" --body "$PR_BODY"; then
    echo ""
    print_info "PR 创建成功！"
    gh pr view --web
else
    print_error "PR 创建失败"
    exit 1
fi
