---
name: document-quality
description: Use when ensuring generated documents meet quality standards or before committing research documents. Ensures compliance with encoding, language, and formatting standards.
---

# Document Quality Skill

This skill ensures all research documents maintain consistent quality standards, particularly for encoding and language correctness.

## When to use this skill

- Before committing any research documents
- After generating reports (daily briefs, ticker analyses)
- When encountering encoding errors
- During document review workflows

## Quality Standards

### 1. Encoding Requirements
- **UTF-8 without BOM** (Byte Order Mark)
- No mixed encodings (Big5, CP950, GB18030)
- Consistent line endings (CRLF for Windows)

### 2. Language Requirements
- **Traditional Chinese** (繁體中文) for all content
- **No Simplified Chinese** (簡体中文)
- **No晶晶體** (mixed Chinese-English), except:
  - Technical terms (API, Docker, Git)
  - Proper nouns (NVDA, BTC, TSMC)
  - Code snippets

### 3. Content Requirements
- No garbage/illegal characters
- Proper Markdown formatting
- Consistent spacing and punctuation
- Complete sentences (no truncated content)

## Validation Tools

### Automated Linter
```powershell
.bin\python\python.exe ops/lint_reports.py
```

**What it checks**:
- UTF-8 encoding compliance
- Garbage/illegal characters
- Simplified Chinese character leaks
- Automatically fixes detected issues

**Expected output**:
```
--- SAR Report Linter V1.1 ---
------------------------------
Result: 77 Scan, 0 Issue Files, 0 Fixes.
```

### Manual Review Workflow
```
Call /document-review
```

**What it does**:
- Comprehensive quality checklist
- Manual verification of critical content
- Final sign-off before commit

## Common Issues & Solutions

### Issue 1: Encoding Errors
**Symptom**: Garbled Chinese characters (亂碼)
```
Example: ?A?O?u??N?`??v
```

**Solution**:
```powershell
# Auto-fix with linter
.bin\python\python.exe ops/lint_reports.py

# Manual conversion if needed
.bin\python\python.exe ops/convert_to_utf8.py <file_path>
```

### Issue 2: Simplified Chinese Leaks
**Symptom**: Characters like ?体、优化、?据

**Solution**: Linter auto-detects and flags for manual correction

### Issue 3: Garbage Characters
**Symptom**: Special characters like ?, ?, ?

**Solution**: Linter auto-removes or replaces with valid characters

### Issue 4: Incomplete Content
**Symptom**: Truncated sentences, missing sections

**Solution**: Manual review required, regenerate report if necessary

## Quality Checklist

Before committing any document, verify:

- [ ] **Encoding**: UTF-8 without BOM
- [ ] **Language**: Traditional Chinese only
- [ ] **No晶晶體**: Except technical terms
- [ ] **No Garbage**: Clean character set
- [ ] **Formatting**: Proper Markdown structure
- [ ] **Completeness**: All sections present
- [ ] **Accuracy**: Data and calculations correct

## Auto-fix Capabilities

The linter can automatically fix:

| Issue | Auto-fix? | Manual Review? |
|-------|-----------|----------------|
| UTF-8 encoding | ? Yes | ? No |
| Garbage characters | ? Yes | ? Yes (verify) |
| Simplified Chinese | ?? Flags only | ? Yes (required) |
| Spacing issues | ? Yes | ? No |
| Incomplete content | ? No | ? Yes (required) |

## Decision Tree

**Q: When should I run quality checks?**
- **Always**: Before Git commit
- **Always**: After generating reports
- **Optional**: During development (for quick feedback)

**Q: Should I auto-fix or manual review?**
- **Auto-fix**: Encoding, spacing, garbage characters
- **Manual review**: Simplified Chinese, incomplete content, critical errors

**Q: What if linter reports issues?**
1. Review the error output
2. Run auto-fix if available
3. Manually correct flagged issues
4. Re-run linter to verify
5. Commit only after clean result

## Best Practices

1. **Run linter early**: Catch issues before they propagate
2. **Commit frequently**: Smaller changes are easier to review
3. **Use UTF-8 editors**: Ensure your editor saves as UTF-8
4. **Validate inputs**: Check data sources for encoding issues
5. **Document exceptions**: Note any intentional deviations from standards

## Integration with Workflows

### /daily-routine
- Phase 5: Document Review
- Automatically calls linter before commit

### /ticker-deep-dive
- Section 7: Document Review
- Ensures ticker reports meet quality standards

### /document-review
- Dedicated quality validation workflow
- Comprehensive checklist and sign-off
