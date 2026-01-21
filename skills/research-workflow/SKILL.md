---
name: research-workflow
description: Use when planning multi-step research tasks or understanding workflow dependencies. High-level guidance for the complete research workflow lifecycle.
metadata:
  version: "1.0.0"
---

# Research Workflow Skill

本技能提供全專案研究工作流（Research Workflow）的高階導引，確保各子系統與 Agent 協同運作。

## 何時使用
- 規劃跨多個步驟的研究任務時。
- 需要理解不同工作流（如 `/daily-routine`, `/ticker-deep-dive`）之間的依賴關係時。
- 排除工作流執行失敗的疑難雜症時。

## 核心原則
研究工作流遵循「自動化、模組化、可核對」的原則。每個工作流應具備清晰的 Phase 分類與自動環境修復能力。

## 工作流階層與對應技能

| 工作流 | 核心技能 | 依賴/後置 |
| :--- | :--- | :--- |
| `/startup` | `health-check` | 初始化環境 |
| `/daily-routine` | `quantitative-research` | 生成每日簡報 |
| `/document-review` | `document-quality` | 文檔品質檢查 |
| `/sync-research` | `notion-sync` | 同步至 Notion |

## 如何操作 (How Agent Uses Skill)
1. **識別起點**: 通常從 `/startup` 開始檢查環境。
2. **檢視描述**: 根據當前任務選擇對應技能。
3. **查閱導引**: 在執行複雜計畫前，查閱本技能以理解流程間的互動邏輯。

## 常見問題 (Troubleshooting)

### 問題：工作流掛起或逾時
- **解法**: 將任務拆解為手動步驟，優先執行 `health-check` 確保環境純淨。

### 問題：多個工作流連續失敗
- **解法**: 執行 `/startup` 重置環境。

### 問題：品質驗證不通過
- **解法**: 單獨執行 `/document-review` 並根據提示手動修復文檔內容。
