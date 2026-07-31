#!/bin/bash
# ============================================
# 闪闪✨培训师工作台 - GitHub Pages 更新脚本
# ============================================
# 仓库已存在：https://github.com/SUEMAN1105/trainer-workbench
# 此脚本用于把本地修改推送到远程仓库
#
# 使用方法：
#   1. 确保已安装 git（Windows 可从 https://git-scm.com 下载）
#   2. 把 trainer-workbench 文件夹复制到你的电脑
#   3. 在文件夹内右键 → Git Bash Here
#   4. 粘贴运行：bash deploy.sh
# ============================================

set -e

REPO_URL="https://github.com/SUEMAN1105/trainer-workbench.git"
BRANCH="main"

echo "🚀 更新闪闪✨培训师工作台到 GitHub..."
echo ""

# 检查 git 是否安装
if ! command -v git &> /dev/null; then
  echo "❌ 未检测到 git，请先安装：https://git-scm.com"
  exit 1
fi

# 配置 git（如果未配置过）
if [ -z "$(git config user.email)" ]; then
  git config --global user.email "trainer@workbench.local"
  git config --global user.name "SUEMAN1105"
  echo "✅ Git 用户信息已配置"
fi

# 初始化 git 仓库（如果不存在）
if [ ! -d ".git" ]; then
  git init
  git branch -M $BRANCH
  echo "✅ Git 仓库已初始化"
else
  echo "✅ Git 仓库已存在"
fi

# 添加所有文件
git add -A
git commit -m "更新闪闪✨培训师工作台 $(date '+%Y-%m-%d %H:%M')" || echo "ℹ️ 没有新的变更需要提交"

# 设置远程仓库
git remote remove origin 2>/dev/null || true
git remote add origin "$REPO_URL"

echo ""
echo "📌 正在推送到 GitHub..."
echo "   （如弹出登录窗口，请输入你的 GitHub 账号密码或 Token）"
echo ""

git push -u origin $BRANCH --force

echo ""
echo "✅ 更新完成！"
echo ""
echo "   🌐 网址: https://sueman1105.github.io/trainer-workbench/"
echo "   ⏳ GitHub Pages 会在 1-2 分钟内自动更新"
echo ""
echo "📱 iPad 用户：刷新页面即可看到最新版"
echo ""
