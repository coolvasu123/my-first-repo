# Branch Safety Guide

This document explains the branch safety features implemented in this repository to prevent accidental commits to the main branch.

## Overview

Accidental commits to the main branch can cause issues in collaborative development. This repository includes several tools to prevent this:

1. **Branch Status Checker** (`check-branch.sh`)
2. **Pre-commit Hook** (automatic protection)
3. **Installation Script** (`install-hooks.sh`)
4. **Documentation** (this guide and README)

## Tools Explained

### 1. Branch Status Checker (`check-branch.sh`)

**Purpose**: Provides a clear overview of your current branch status before making changes.

**Usage**:
```bash
./check-branch.sh
```

**What it shows**:
- Current branch name with visual indicators
- Warning if you're on the main branch
- Git status (staged/unstaged changes)
- Recent commits on the current branch
- Helpful suggestions for safe workflow

**When to use**:
- Before starting any new work
- When unsure which branch you're on
- As part of your regular development workflow

### 2. Pre-commit Hook

**Purpose**: Automatically prevents commits to the main branch.

**How it works**:
- Runs automatically before every commit
- Checks if you're on the main branch
- Blocks the commit if on main
- Provides clear instructions on how to fix the situation

**Bypass option** (use with caution):
```bash
git commit --no-verify -m "Emergency commit"
```

### 3. Installation Script (`install-hooks.sh`)

**Purpose**: Easy setup of branch protection for new repositories.

**Usage**:
```bash
./install-hooks.sh
```

**What it does**:
- Installs the pre-commit hook
- Sets proper permissions
- Provides testing instructions

## Common Workflows

### Safe Development Workflow

1. **Check your branch**:
   ```bash
   ./check-branch.sh
   ```

2. **If on main, create a feature branch**:
   ```bash
   git checkout -b feature/your-feature-name
   ```

3. **Make your changes and commit**:
   ```bash
   git add .
   git commit -m "Your commit message"
   ```

4. **Push to your feature branch**:
   ```bash
   git push origin feature/your-feature-name
   ```

### Recovering from Main Branch Work

If you accidentally made changes on main:

1. **Don't panic** - the pre-commit hook should catch this
2. **Stash your changes**:
   ```bash
   git stash
   ```
3. **Create a feature branch**:
   ```bash
   git checkout -b feature/your-feature-name
   ```
4. **Apply your changes**:
   ```bash
   git stash pop
   ```
5. **Commit on the feature branch**:
   ```bash
   git add .
   git commit -m "Your commit message"
   ```

## Emergency Procedures

### If you MUST commit to main

**Warning**: Only use this in genuine emergencies!

```bash
git commit --no-verify -m "EMERGENCY: description of why this is necessary"
```

### If the hook is preventing legitimate work

1. **First, verify you should be on main** - usually you shouldn't be
2. **If truly necessary**, use `--no-verify` flag
3. **Document why** in the commit message
4. **Inform your team** about the direct main commit

## Best Practices

1. **Always check your branch** before starting work
2. **Use descriptive branch names**: `feature/add-login`, `bugfix/fix-counter`
3. **Never work directly on main** unless it's a true emergency
4. **Keep feature branches small and focused**
5. **Use pull requests** for all merges to main
6. **Pull latest main** before creating new feature branches

## Troubleshooting

### "Hook not working"
- Check if the hook file exists: `.git/hooks/pre-commit`
- Check if it's executable: `ls -la .git/hooks/pre-commit`
- Reinstall with: `./install-hooks.sh`

### "Can't see current branch"
- Run `git branch` to see all branches
- Run `./check-branch.sh` for detailed status

### "Accidentally bypassed hook"
- If you used `--no-verify`, create a new commit that moves changes to a feature branch
- Use `git revert` if the commit has been pushed

## Setup for New Repositories

1. Copy `install-hooks.sh` to your new repository
2. Run `./install-hooks.sh`
3. Copy `check-branch.sh` for easy branch checking
4. Update your README with branch safety instructions

---

Remember: These tools are here to help you, not restrict you. They prevent common mistakes while allowing legitimate emergency overrides when needed.