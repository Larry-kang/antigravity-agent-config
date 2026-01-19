---
name: code-review
description: 針對代碼變更進行安全性、效能與規範性審查 (Audit & Review)
metadata:
  version: "1.0.0"
---

# Code Review Skill

此技能使 Agent 具備對代碼變更進行全方位稽核的能力，確保所有交付物符合生產環境標準。

## 核心審查清單 (Review Checklist)

### 1. 安全性 (Security)
- 是否存在硬編碼的祕鑰 (Hardcoded Secrets)、Token 或私鑰？
- API Endpoint 是否具備過濾與權限驗證？
- SQL 查詢是否預防了注入攻擊？ (使用參數化查詢)

### 2. 效能與資源 (Performance)
- 是否存在可能導致性能瓶頸的深度巢狀迴圈？
- 是否在大數據量下正確使用了緩衝或分頁？
- 是否存在記憶體洩漏風險 (Memory Leak)？

### 3. 規範性 (Compliance)
- 是否遵循了 `.agent/rules/naming-conventions.md` 的規定？
- 檔案命名、變數命名與類別結構是否一致？
- 所有的註解是否為繁體中文？

## 操作指南

### 1. 執行基礎掃描
當使用者要求「審查我的代碼」時，先執行以下指令掃描敏感資訊：
```powershell
# 模擬資安掃描 (若有 scripts 則執行腳本)
echo "Scanning for hardcoded secrets..."
```

### 2. 產出審查報告 (Review Report)
報告必須包含三個區塊：
- **致命錯誤 (Critical)**: 必須立即修復的安全漏洞或編譯錯誤。
- **改進建議 (Suggestions)**: 關於效能優化或代碼重構的建議。
- **規範優化 (Chore)**: 關於風格、命名或文件格式的微調。

## 使用範例
當你要審核 `python-ops.py` 檔案時：
1. 讀取 `.agent/rules/naming-conventions.md`。
2. 逐行分析 `python-ops.py` 以比對規範。
3. 如果發現變數使用了 `CamelCase` 卻在 Python 中，提出修訂建議。
