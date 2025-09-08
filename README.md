# My First Repo

A simple click counter web application.

## 🚨 Branch Safety - Preventing Accidental Main Branch Updates

This repository includes tools to help prevent accidental commits to the main branch.

### Quick Branch Check

Before making any changes, always check which branch you're currently on:

```bash
# Option 1: Use our custom branch checker (recommended)
./check-branch.sh

# Option 2: Quick git commands
git branch --show-current
git status
```

### ⚠️ Main Branch Protection

**NEVER work directly on the main branch!** Always create a feature branch:

```bash
# Create and switch to a new feature branch
git checkout -b feature/your-feature-name

# Or create from main
git checkout main
git pull origin main
git checkout -b feature/your-feature-name
```

### 🛡️ Automated Protection

This repository includes a pre-commit hook that automatically blocks commits to main:

- **Already installed**: The hook is set up in this repository
- **For new repositories**: Run `./install-hooks.sh` to set up protection

### 🔧 Emergency Override

If you absolutely must commit to main (use with extreme caution):

```bash
git commit --no-verify -m "your message"
```

### Best Practices

1. **Always check your branch**: Run `./check-branch.sh` before starting work
2. **Use descriptive branch names**: `feature/add-user-login`, `bugfix/fix-counter-reset`
3. **Keep main clean**: Only merge via pull requests
4. **Pull before branching**: Ensure your feature branch is based on latest main

---
