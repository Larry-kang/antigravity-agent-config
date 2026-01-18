---
name: git-branching
description: 標準化 Git 分支策略與版本控制工作流程
version: 1.0.0
---

# Git Branching Skill

此技能規範跨專案的 Git 版本控制策略，確保一致的分支命名、提交訊息格式與合併流程。

## 分支策略 (Branching Strategy)

### 主要分支
| 分支 | 用途 | 保護規則 |
|------|------|----------|
| main / master | 生產環境代碼 | 禁止直接推送，僅允許 PR 合併 |
| develop | 開發整合分支 | 可選，適用於較大型專案 |

### 功能分支命名規範
類型/簡短描述

類型清單:
- feature/ — 新功能開發
- fix/ — 問題修復
- refactor/ — 重構（無功能變更）
- docs/ — 文件更新
- chore/ — 維護性任務

範例:
feature/add-btc-analysis
fix/encoding-mojibake
docs/update-readme

## 提交訊息規範 (Commit Message Convention)

### 格式
類型: 簡短描述

### 規則
1. 語言: 使用繁體中文撰寫描述
2. 長度: 標題行不超過 50 字元
3. 時態: 使用祈使句（如「新增」而非「新增了」）

## 合併策略 (Merge Strategy)

### Pull Request 流程
1. 從 main 建立功能分支
2. 完成開發與本地測試
3. 推送分支並建立 Pull Request
4. 通過 Code Review 後合併

### 合併方式優先順序
1. Squash and Merge (首選) — 保持主分支歷史清晰
2. Rebase and Merge — 適用於線性歷史需求
3. Merge Commit — 保留完整歷史

## 最佳實踐

1. 小步提交: 保持每次提交專注於單一變更
2. 頻繁同步: 定期 rebase 主分支，減少衝突
3. 清晰描述: 提交訊息應讓未來的自己或團隊成員能快速理解變更目的