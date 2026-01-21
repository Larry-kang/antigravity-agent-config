---
name: python-scripting
description: Use when running any Python scripts in this project to avoid environment issues. Ensures correct Python script execution using project-specific interpreter.
---

# Python Scripting Skill

This skill ensures Agent uses the correct Python interpreter and follows project-specific execution patterns.

## When to use this skill

- Running any Python script in `scripts/` or `ops/`
- Executing data fetching, simulation, or report generation tasks
- Troubleshooting Python-related errors

## Critical Rule: Use Project Python

**Always use `.bin\python\python.exe`, never `python` or `python3`**

### Why?
- Project uses isolated Python environment in `.bin/python/`
- System Python may lack required dependencies
- Ensures reproducible execution across environments

## Standard Execution Pattern

### Basic Script Execution
```powershell
.bin\python\python.exe <script_path> [args]
```

### Examples
```powershell
# Data fetching
.bin\python\python.exe scripts/fetch_history_metrics.py

# Simulation with arguments
.bin\python\python.exe scripts/daily_forecast_sim.py --price 95000

# Operations
.bin\python\python.exe ops/repair_project.py
.bin\python\python.exe ops/lint_reports.py
```

## Common Scripts Reference

### Data & Analysis
| Script | Purpose | Typical Args |
|--------|---------|--------------|
| `scripts/fetch_history_metrics.py` | Fetch 5Y historical data for calibration | None |
| `scripts/simulate_ticker.py` | Run Monte Carlo simulations | None (reads ticker_params.json) |
| `scripts/daily_forecast_sim.py` | Daily risk forecast | `--price <BTC_PRICE>` |

### Operations
| Script | Purpose | When to Use |
|--------|---------|-------------|
| `ops/repair_project.py` | Fix project integrity issues | At workflow start |
| `ops/lint_reports.py` | Validate report encoding/quality | Before Git commit |
| `ops/generate_reports.py` | Generate comprehensive reports | Manual trigger |
| `ops/sync_full_research.py` | Sync to Notion | After daily-routine |

### Debugging
| Script | Purpose |
|--------|---------|
| `ops/check_encoding_status.py` | Diagnose encoding issues |
| `ops/diagnose_notion.py` | Debug Notion sync problems |

## Error Handling

### Common Errors & Solutions

**ModuleNotFoundError**
```
Error: No module named 'pandas'
Solution: Verify .bin/python environment is intact
Action: Run ops/repair_project.py
```

**UnicodeDecodeError**
```
Error: 'utf-8' codec can't decode byte...
Solution: File has wrong encoding
Action: Run ops/lint_reports.py to auto-fix
```

**FileNotFoundError**
```
Error: [Errno 2] No such file or directory
Solution: Use relative paths from project root
Action: Ensure CWD is d:\Dev\GitHub\sovereign-alpha-research
```

## Decision Tree

**Q: Which Python interpreter should I use?**
- Always: `.bin\python\python.exe`
- Never: `python`, `python3`, or system Python

**Q: How to handle script failures?**
1. Check if using correct Python interpreter
2. Verify CWD is project root
3. Run `ops/repair_project.py` to fix environment
4. Check script output for specific error messages

**Q: Should I install packages?**
- No: Project uses isolated environment
- If needed: Contact user (environment is pre-configured)

## Best Practices

1. **Always specify full path**: `.bin\python\python.exe scripts/...`
2. **Check CWD**: Ensure working directory is project root
3. **Read output**: Python scripts often print important status messages
4. **Sequential execution**: Don't run multiple heavy scripts in parallel
5. **Validate inputs**: Check file existence before running scripts
