---
name: skill-factory
description: 用於建立符合 agentskills.io 規範的新技能 (Skill for creating Skills)
metadata:
  version: "1.0.0"
---

# Skill Factory

此技能規範了如何在 `.agent/skills/` 目錄下建立符合 `agentskills.io` 官方規範的新技能。

## 核心規則 (Core Rules)

1. **命名規範**: 
   - 技能目錄名稱必須為全小寫英文字母與連字符號 (`a-z`, `-`)。
   - `SKILL.md` 內的 `name` 欄位必須與目錄名稱完全一致。
2. **檔案結構**:
   - 每個技能必須包含 `SKILL.md`。
   - 可選包含 `scripts/`, `references/`, `assets/` 目錄。
3. **Frontmatter 格式**:
   - 必須包含 `name` 與 `description`。
   - `version` 等額外資訊必須放在 `metadata:` 區塊內。

## 建立新技能的步驟

### 1. 建立目錄
```powershell
New-Item -ItemType Directory -Path ".agent/skills/your-skill-name"
```

### 2. 初始化 SKILL.md
使用以下模板建立檔案：
```markdown
---
name: your-skill-name
description: 簡短描述新技能的功能與使用時機
metadata:
  version: "1.0.0"
  author: "Larry"
---

# Skill Name

## 當前技能的使用時機
- [場景 1]
- [場景 2]

## 操作指南
1. [步驟 1]
2. [步驟 2]
```

### 3. 驗證規範
- 檢查目錄名是否符合 `[a-z-]`。
- 檢查 `SKILL.md` 第一行是否為 `---`。
- 檢查 `metadata:` 是否正確縮排。

## 檢查清單 (Definition of Done)
- [ ] 目錄與 `name` 欄位一致
- [ ] 使用純 UTF-8 編碼
- [ ] 包含具體的引導說明
- [ ] 包含常見錯誤處理 (Edge Cases)
