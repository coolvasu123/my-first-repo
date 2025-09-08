#!/bin/bash

# check-branch.sh - Utility to check current branch and warn about main branch work

echo "=============================================="
echo "       CURRENT BRANCH STATUS CHECK"
echo "=============================================="

# Get current branch name
CURRENT_BRANCH=$(git branch --show-current)
echo "📍 Current branch: $CURRENT_BRANCH"

# Check if we're on main branch
if [[ "$CURRENT_BRANCH" == "main" ]]; then
    echo "⚠️  WARNING: You are on the MAIN branch!"
    echo "💡 Consider creating a feature branch before making changes:"
    echo "   git checkout -b feature/your-feature-name"
    echo ""
fi

# Show git status
echo ""
echo "📊 Git Status:"
git status --short --branch

# Show recent commits
echo ""
echo "📝 Recent commits on this branch:"
git log --oneline -3

echo ""
echo "=============================================="

# If on main, prompt user
if [[ "$CURRENT_BRANCH" == "main" ]]; then
    echo "⚠️  REMINDER: Avoid making changes directly to main!"
    echo "✅ Use feature branches for all development work."
    echo "=============================================="
fi