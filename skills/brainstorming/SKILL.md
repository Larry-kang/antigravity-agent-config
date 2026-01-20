---
name: brainstorming
description: Use when starting new features, solving complex problems, or when requirements are unclear. Triggers Socratic design refinement before implementation.
metadata:
  version: "1.0.0"
  source: "Adapted from obra/superpowers"
---

# 腦力激盪 (Brainstorming)

透過蘇格拉底式對話，將模糊的想法精煉為完整的設計文件。

## 何時使用

- 開始新功能開發前
- 需求不清晰時
- 解決複雜問題時
- 需要探索多種方案時

## 核心原則

1. **一次一問** - 避免資訊過載
2. **多選題優先** - 比開放式問題更易回答
3. **分段呈現** - 每段 200-300 字，確認後再繼續
4. **探索替代方案** - 提出 2-3 種方案再決定

## 流程

```
啟動腦力激盪
    ↓
理解專案上下文 (檔案、文檔、近期提交)
    ↓
一次一問，釐清需求
    ↓
提出 2-3 種方案 + 優缺點
    ↓
分段呈現設計 (每段 200-300 字)
    ↓
確認每段後再繼續
    ↓
設計文件存入 docs/plans/YYYY-MM-DD-<topic>-design.md
    ↓
提交設計文件至 Git
```

## 問題類型指南

| 情境 | 問題類型 | 範例 |
|------|---------|------|
| 有明確選項 | 多選題 | 「偏好 A: 簡單但較慢、B: 複雜但高效、C: 折衷方案？」 |
| 需要澄清 | 開放式 | 「這個功能預期的使用頻率是？」 |
| 確認理解 | 是/否 | 「所以目標是 X，對嗎？」 |

## 設計文件結構

```markdown
# [功能名稱] 設計文件

**日期**: YYYY-MM-DD
**狀態**: 草案 / 已核准 / 已實作

## 問題陳述
[描述要解決的問題]

## 方案比較
| 方案 | 優點 | 缺點 |
|------|-----|-----|
| A | ... | ... |
| B | ... | ... |

## 選定方案
[選定的方案及理由]

## 架構設計
[技術架構描述]

## 驗收標準
- [ ] 標準 1
- [ ] 標準 2
```

## 完成後

- 使用 `writing-plans` 技能撰寫實作計畫
- 或使用 `/execute-plan` 工作流執行
