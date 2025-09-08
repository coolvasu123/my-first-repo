#!/bin/bash

# install-hooks.sh - Install git hooks to prevent accidental main branch commits

HOOK_DIR=".git/hooks"
PRE_COMMIT_HOOK="$HOOK_DIR/pre-commit"

echo "Installing git hooks to prevent accidental main branch commits..."

# Check if we're in a git repository
if [ ! -d ".git" ]; then
    echo "❌ Error: Not in a git repository. Please run this from the root of your git project."
    exit 1
fi

# Create the pre-commit hook
cat > "$PRE_COMMIT_HOOK" << 'EOF'
#!/bin/sh
# pre-commit hook to prevent accidental commits to main branch

branch="$(git rev-parse --abbrev-ref HEAD)"

if [ "$branch" = "main" ]; then
    echo "⚠️  COMMIT BLOCKED: You are trying to commit to the main branch!"
    echo ""
    echo "🚫 Direct commits to main are not allowed to prevent accidental updates."
    echo ""
    echo "💡 To fix this:"
    echo "   1. Create a feature branch: git checkout -b feature/your-feature-name"
    echo "   2. Move your changes: git stash && git checkout feature/your-feature-name && git stash pop"
    echo "   3. Then commit your changes on the feature branch"
    echo ""
    echo "🔧 To override this protection (use with caution):"
    echo "   git commit --no-verify"
    echo ""
    exit 1
fi
EOF

# Make the hook executable
chmod +x "$PRE_COMMIT_HOOK"

echo "✅ Pre-commit hook installed successfully!"
echo "💡 The hook will now prevent direct commits to the main branch."
echo ""
echo "🧪 To test the hook:"
echo "   1. Switch to main: git checkout main"
echo "   2. Try to commit: git commit -m 'test'"
echo "   3. You should see the warning and the commit should be blocked"
echo ""