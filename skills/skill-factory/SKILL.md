---
name: skill-factory
description: Use when creating new skills for the .agent framework. Guides SKILL.md structure, CSO optimization, and validation.
metadata:
  version: "2.0.0"
  source: "Enhanced with Superpowers CSO methodology"
---

# Skill Factory

在 `.agent/skills/` 目錄下建立符合規範的新技能，並確保可被 AI 代理發現。

## 核心規則

### 1. 命名規範
- 目錄名稱：全小寫英文 + 連字符號 (`a-z`, `-`)
- `SKILL.md` 內的 `name` 欄位必須與目錄名完全一致

### 2. 檔案結構
```
skills/
  skill-name/
    SKILL.md              # 主文件 (必要)
    supporting-file.*     # 輔助檔案 (可選)
```

### 3. Frontmatter 格式
- 必須包含 `name` 與 `description`
- 額外資訊放入 `metadata:` 區塊
- **限制 1024 字元**

## Claude Search Optimization (CSO)

> [!IMPORTANT]
> 技能寫得再好，如果 AI 找不到就沒用！

### description 撰寫規範

**格式**: 以「Use when...」開頭，描述**觸發條件**，不是技能內容

**✅ 正確範例**:
```yaml
description: Use when debugging test failures, production bugs, or unexpected behavior. Enforces root cause analysis.
```

**❌ 錯誤範例**:
```yaml
description: A skill that helps you debug issues systematically using a four-phase approach.
```

### CSO 檢查清單
- [ ] 以「Use when...」開頭
- [ ] 描述症狀和情境
- [ ] 包含關鍵字覆蓋
- [ ] 不描述技能流程
- [ ] 少於 500 字元

## SKILL.md 結構

```markdown
---
name: skill-name-with-hyphens
description: Use when [specific triggering conditions and symptoms]
metadata:
  version: "1.0.0"
---

# 技能名稱

## 何時使用
- 情境 1
- 情境 2
- 何時**不**使用

## 核心原則
[1-2 句核心概念]

## 流程/操作指南
[步驟式說明]

## 常見錯誤
[問題 + 解法]
```

## 建立新技能

### Step 1: 建立目錄
```powershell
New-Item -ItemType Directory -Path ".agent/skills/your-skill-name"
```

### Step 2: 撰寫 SKILL.md
使用上述結構撰寫內容

### Step 3: 驗證規範
- [ ] 目錄名符合 `[a-z-]+`
- [ ] description 符合 CSO 規範
- [ ] UTF-8 編碼
- [ ] 有具體操作指南

## 驗證腳本

```powershell
# 驗證所有技能 frontmatter
Get-ChildItem -Path ".agent/skills" -Filter "SKILL.md" -Recurse | ForEach-Object {
    $content = Get-Content $_.FullName -Raw -Encoding UTF8
    if ($content -notmatch "^---") { 
        Write-Warning "Missing frontmatter: $($_.FullName)" 
    }
    if ($content -notmatch "description:\s*Use when") {
        Write-Warning "CSO violation: $($_.FullName)"
    }
}
```
