---
name: git-ops
description: Use when workflows need to version-control changes following specific branching strategies. Handles Git operations including branching, committing, and pushing.
---

# Git Operations Skill

This skill provides standardized Git operations for the SAR project, ensuring consistent branching, committing, and pushing across all workflows.

## When to use this skill

- At the end of any workflow that generates or modifies research files
- When committing daily reports, ticker analyses, or strategy documents
- For any version control operations within `/daily-routine`, `/ticker-deep-dive`, or other workflows

## Branching Strategy

All changes must be made on feature branches, never directly on `main`.

| Type | Branch Naming | Use Case |
|------|---------------|----------|
| **Feature** | `feat/<description>` | New scripts, workflow additions |
| **Fix** | `fix/<bug-desc>` | Bug fixes |
| **Doc** | `doc/<topic>` | Research reports, daily briefs |
| **Chore** | `chore/<task>` | Config updates, dependencies |

## Standard Commit Flows

### Quick Doc Commit (for daily reports)

Use when committing daily analysis or research updates:

```powershell
$dateStr = Get-Date -Format 'yyyyMMdd'
$branchName = "doc/daily-report-$dateStr"

# Create or switch to branch
if (git show-ref --verify --quiet "refs/heads/$branchName") {
    git checkout $branchName
} else {
    git checkout -b $branchName
}

# Stage and commit
git add research/
git commit -m "docs: [Report] Daily Analysis $dateStr"

# Push, merge, and cleanup
git push origin $branchName
git checkout main
git merge $branchName
git push origin main
git branch -d $branchName
```

### Ticker Analysis Commit

Use when updating ticker reports:

```powershell
git add research/tickers/
git commit -m "docs: [Report] Deep Dive Update"
git push origin main
```

### Script/Config Commit

Use when modifying operational scripts:

```powershell
git checkout -b feat/<description>
git add scripts/ ops/
git commit -m "feat: <description>"
git push origin feat/<description>
# Then create PR or merge locally
```

## Commit Message Convention

Use **Semantic Commit Messages**:

- `feat:` - New features
- `fix:` - Bug fixes  
- `docs:` - Documentation/reports
- `style:` - Formatting (no logic change)
- `refactor:` - Code restructuring
- `chore:` - Maintenance tasks

## Decision Tree

**Q: Which branch type should I use?**
- Research reports/daily briefs: use `doc/`
- Python scripts/workflow changes: use `feat/`
- Bug fixes: use `fix/`
- Config/dependencies: use `chore/`

**Q: Should I push to `main` directly?**
- Never for code changes
- For doc branches: merge locally then push

**Q: What if there are merge conflicts?**
- Pull latest `main` first: `git pull origin main`
- Resolve conflicts manually
- Notify user if critical conflicts exist
