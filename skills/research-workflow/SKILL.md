---
name: research-workflow
description: High-level guidance for the complete research workflow lifecycle. Use when planning multi-step research tasks or understanding workflow dependencies.
---

# Research Workflow Skill

This skill provides a bird's-eye view of the complete research workflow lifecycle, helping Agent understand how different workflows interconnect.

## When to use this skill

- Planning multi-step research tasks
- Understanding workflow dependencies
- Deciding which workflow to invoke
- Troubleshooting workflow execution issues

## Workflow Hierarchy

### Entry Point: /startup
**Purpose**: Initialize environment and prepare for daily work

**What it does**:
1. Git sync (pull latest changes)
2. Environment repair (fix project integrity)
3. Report linting (validate existing documents)

**When to use**: Start of every work session

**Next steps**: Choose daily task (daily-routine, ticker-deep-dive, etc.)

---

### Core Workflow: /daily-routine
**Purpose**: Daily market scan and risk assessment

**Phases**:
1. **Phase 0**: System pre-flight (health check)
2. **Phase 1**: Data collection (market scan, web search)
3. **Phase 2**: Simulation (risk forecast)
4. **Phase 3**: Strategic alignment (LTV matrix, roadmap update)
5. **Phase 4**: Handover (Git commit)
6. **Phase 5**: Document review (quality validation)
7. **Phase 6**: Notion sync (publish)

**Triggers**:
- `/ticker-deep-dive` for core holdings (BTC, NVDA, TSMC, TSLA)
- `/document-review` for quality validation
- `/sync-research` for Notion publishing

**When to use**: Every trading day

---

### Deep Analysis: /ticker-deep-dive
**Purpose**: In-depth analysis of specific tickers

**Sections**:
1. Integrity check (basic data, product structure)
2. Valuation & SAP rating (four-quadrant classification)
3. Localization & tax (true yield calculation)
4. Technical dynamics (Mayer Multiple, RSI, MACD)
5. Multi-horizon simulation (1Y, 5Y, 10Y)
6. Catalysts & news (market intelligence)
7. Document review (quality gate)
8. Version control (Git commit & sync)

**Triggers**:
- `/document-review` for quality validation
- `/sync-research` for Notion publishing

**When to use**:
- New ticker onboarding
- Quarterly deep dive
- Major price movements or news

---

### Knowledge Management: /add-knowledge
**Purpose**: Archive market insights and research findings

**Workflow**:
1. Create knowledge note (`research/notes/Note_[Topic]_[Date].md`)
2. Document analysis and strategic implications
3. Link to relevant ticker reports
4. Commit to version control

**When to use**:
- Discovering new market insights during research
- Documenting important catalysts or events
- Building knowledge base for future reference

---

### Quality Gate: /document-review
**Purpose**: Comprehensive quality validation

**Checklist**:
- UTF-8 encoding compliance
- Traditional Chinese language correctness
- No garbage characters
- Proper Markdown formatting
- Content completeness

**When to use**:
- Before committing any research documents
- After generating reports
- As final step in other workflows

---

### Publishing: /sync-research
**Purpose**: Synchronize research to Notion

**Workflow**:
1. Pre-sync validation (encoding check)
2. Execute sync (incremental or full)
3. Verify completion (state file update)

**When to use**:
- After completing daily-routine
- After major research updates
- Manual trigger by user

---

## Workflow Dependencies

### Sequential Dependencies
```
/startup ¡÷ /daily-routine ¡÷ /sync-research
         ¡õ
         /ticker-deep-dive ¡÷ /document-review ¡÷ /sync-research
```

### Shared Dependencies
All workflows depend on:
- `health-check` skill (environment validation)
- `python-scripting` skill (correct Python execution)
- `document-quality` skill (quality standards)

### Optional Integrations
- `/add-knowledge` can be called from any workflow
- `/document-review` is recommended but not mandatory
- `/sync-research` can be skipped during development

## Decision Tree

### Q: Which workflow should I start with?
- **New work session**: `/startup`
- **Daily market scan**: `/daily-routine`
- **Deep ticker analysis**: `/ticker-deep-dive`
- **Archive insights**: `/add-knowledge`
- **Quality check only**: `/document-review`
- **Publish to Notion**: `/sync-research`

### Q: Should I chain workflows?
- **Yes**: `/startup` ¡÷ `/daily-routine` (standard daily flow)
- **Yes**: `/ticker-deep-dive` ¡÷ `/document-review` (quality gate)
- **No**: Don't chain too many workflows (risk of failure propagation)

### Q: What if a workflow fails?
1. Check error message
2. Run `/startup` to repair environment
3. Retry failed workflow
4. If persistent, break into manual steps

## Best Practices

### 1. Always Start with /startup
- Ensures clean environment
- Pulls latest changes
- Validates project integrity

### 2. Use Workflows Sequentially
- Complete one workflow before starting another
- Avoid parallel execution of heavy workflows
- Commit changes between workflows

### 3. Validate Before Publishing
- Run `/document-review` before `/sync-research`
- Ensure quality standards met
- Avoid polluting Notion with bad data

### 4. Leverage Skills
- Agent automatically references relevant skills
- Skills provide context and best practices
- Don't need to explicitly invoke skills

### 5. Handle Failures Gracefully
- Don't retry indefinitely
- Break complex workflows into steps
- Notify user of persistent issues

## Common Workflow Patterns

### Pattern 1: Daily Routine
```
/startup
  ¡õ
/daily-routine
  ¢u¢w /ticker-deep-dive (for core holdings)
  ¢u¢w /document-review (quality gate)
  ¢|¢w /sync-research (publish)
```

### Pattern 2: New Ticker Onboarding
```
/add-new-ticker
  ¡õ
/ticker-deep-dive
  ¡õ
/document-review
  ¡õ
/sync-research
```

### Pattern 3: Research & Archive
```
[Web Research]
  ¡õ
/add-knowledge
  ¡õ
[Update ticker reports]
  ¡õ
/document-review
  ¡õ
/sync-research
```

### Pattern 4: Quick Quality Check
```
[Generate reports manually]
  ¡õ
/document-review
  ¡õ
[Fix issues if any]
  ¡õ
[Commit changes]
```

## Integration with Skills

### Skills Referenced by Workflows

| Workflow | Skills Used |
|----------|-------------|
| `/startup` | `health-check`, `git-ops` |
| `/daily-routine` | `health-check`, `python-scripting`, `quantitative-research`, `git-ops`, `document-quality`, `notion-sync` |
| `/ticker-deep-dive` | `python-scripting`, `quantitative-research`, `document-quality`, `git-ops` |
| `/document-review` | `document-quality` |
| `/sync-research` | `notion-sync`, `document-quality` |

### How Agent Uses Skills
1. Agent sees workflow invocation
2. Checks skill descriptions for relevance
3. Reads relevant skills for guidance
4. Follows skill best practices during execution

## Troubleshooting

### Issue: Workflow hangs or times out
**Solution**: Break into manual steps, run health check

### Issue: Multiple workflows fail
**Solution**: Run `/startup` to reset environment

### Issue: Quality validation fails
**Solution**: Run `/document-review` standalone, fix issues

### Issue: Notion sync fails repeatedly
**Solution**: Check encoding, verify credentials, use incremental sync
