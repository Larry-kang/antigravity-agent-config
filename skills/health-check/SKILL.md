---
name: health-check
description: Use when performing system health checks, environment repair, and report linting. Enforces workspace clean state.
metadata:
  version: "1.0.0"
---

# Health Check Skill

This skill ensures the SAR project environment is in a healthy state before executing research workflows. It combines environment repair and automated quality checks.

## When to use this skill

- At the beginning of any workflow (especially `/startup` and `/daily-routine`)
- After pulling new code from the repository
- When encountering unexpected errors in Python scripts
- Before generating or modifying research reports

## Health Check Steps

### 1. Environment Repair

Run the project repair script to fix common issues:

```powershell
.bin\python\python.exe ops/repair_project.py
```

**What it does**:
- Validates `ticker_params.json` integrity
- Checks for missing or corrupted configuration files
- Repairs file encoding issues
- Ensures all required directories exist

### 2. Report Linting

Run the automated linter to ensure report quality:

```powershell
.bin\python\python.exe ops/lint_reports.py
```

**What it checks**:
- UTF-8 encoding compliance
- Garbage/illegal characters
- Simplified Chinese character leaks
- Automatically fixes detected issues

### 3. Rule Integrity Check

Verify core rules are present:

```powershell
# Check if team protocols exist
if (-not (Test-Path ".agent\rules\team-protocols.md")) {
    Write-Warning "CRITICAL: .agent\rules\team-protocols.md is missing!"
}
```

## Expected Output

**Successful Health Check**:
```
--- SAR Report Linter V1.1 ---
------------------------------
Result: 77 Scan, 0 Issue Files, 0 Fixes.
```

**Issues Detected**:
```
[ISSUE] research/daily_briefs\report.md
  - Encoding error (UTF-8 violation)
  - Garbage/Illegal characters
  [FIXED] Auto-corrections applied.
```

## Decision Tree

**Q: When should I run a health check?**
- Always at workflow start (via `/startup`)
- After any Git pull operation
- When Python scripts fail unexpectedly

**Q: What if health check fails?**
- Review the error output
- Check if `ops/repair_project.py` exists and is executable
- Verify `.bin\python\python.exe` is available
- Report to user if critical files are missing

**Q: Should I continue if linter finds issues?**
- Yes, if issues were auto-fixed
- No, if critical files are corrupted beyond repair
