---
name: skill-factory
description: Use when creating or refining skills for the .agent framework. Enforces agentskills.io V1.0 specification including Frontmatter, directory structure, and Progressive Disclosure.
license: Apache-2.0
compatibility: Requires .agent framework environment and UTF-8 encoding.
metadata:
  version: "3.0.0"
  spec-version: "agentskills.io-v1.0"
  source: "Upgrade with official Agentskills.io specification"
---

# Skill Factory (V3.0)

本技能用於產出符合 [agentskills.io](https://agentskills.io/specification) 官方規範的 AI 技能包。

## 1. 核心 Frontmatter 規範

所有 `SKILL.md` 必須包含以下欄位，且總量建議控制在 **1024 字元** 以內。

| 欄位 | 規範 | 範例 |
| :--- | :--- | :--- |
| `name` | 小寫加連字號 (a-z, -)，必須與目錄名一致 | `pdf-processing` |
| `description` | **CSO 核心**：以 `Use when...` 開頭，描述觸發情境 | `Use when extracting text from PDFs...` |
| `license` | 許可協議 (推薦 Apache-2.0 或 MIT) | `Apache-2.0` |
| `compatibility` | 環境要求 (1-500 字元) | `Requires Node.js 18+` |
| `metadata` | 鍵對值對應，用於儲存版本或作者資訊 | `metadata: { version: "1.0.0" }` |
| `allowed-tools` | (實驗性) 預先核准的工具列表 | `Bash(git:*) Read` |

## 2. 目錄結構與進階披露 (Progressive Disclosure)

為了優化 AI 的 Context Window 使用效率，技能應遵循分層加載原則：

```text
skill-name/
├── SKILL.md              # 啟動指令 (Load when activated, < 5000 tokens)
├── scripts/              # 工具腳本 (Load only when executed)
├── references/           # 技術參考 (Load only when referenced)
│   ├── REFERENCE.md      # 詳細規格
│   └── FORMS.md          # 結構化模板
└── assets/               # 靜態資源 (Load only when needed)
    └── schema.json       # 資料結構定義
```

### 鏈接引用規範
在 `SKILL.md` 中引用子目錄檔案，應使用相對路徑：
- `See [technical specs](references/REFERENCE.md)`
- `Execute with `scripts/setup.py``

## 3. Claude Search Optimization (CSO) 鐵律

> [!IMPORTANT]
> `description` 是 AI 發現技能的唯一憑據。

- **觸發導向**: 描述「使用者想要做什麼」或「系統發現了什麼問題」，而非技能本身的功能。
- **關鍵字堆疊**: 包含領域專有名詞（如：`TDD`, `Clean Architecture`, `Excel`）。
- **字數限制**: 保持在 500-1000 字元之間，確保高發現率。

## 4. 完整技能模板 (TEMPLATE)

```markdown
---
name: [skill-name]
description: Use when [Context A, Symptom B, or Request C]. Enforces [Standard/Rule].
license: Apache-2.0
metadata:
  version: "1.0.0"
---

# [Skill Title]

## 何時使用
- 當需要 [情境]
- 當發現 [問題]
- **不適用**於 [排除情境]

## 操作指南
1. [步驟一]
2. [步驟二]

## 參考與工具
- 詳細文件請見 [REFERENCE.md](references/REFERENCE.md)
- 執行指令：`scripts/run.py`
```

## 5. 建立與驗證流程

### 步驟 A: 結構初始化
```powershell
mkdir ".agent/skills/new-skill/scripts"
mkdir ".agent/skills/new-skill/references"
touch ".agent/skills/new-skill/SKILL.md"
```

### 步驟 B: 規範稽核
1. [ ] `name` 是否全小寫？
2. [ ] `description` 是否以 `Use when` 開頭？
3. [ ] 檔案是否為 **UTF-8** 編碼？
4. [ ] 指令與鏈路是否使用相對路徑？

---
*Powered by Agentskills.io Specification V1.0*
