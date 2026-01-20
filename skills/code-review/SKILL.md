---
name: code-review
description: Use when reviewing code changes for security, performance, and compliance. Triggers two-stage review process.
metadata:
  version: "2.0.0"
  source: "Enhanced with Superpowers two-stage review methodology"
---

# 代碼審查 (Code Review)

對代碼變更進行全方位稽核，確保所有交付物符合生產環境標準。

## 二階段審查機制

Superpowers 強調的二階段審查：先確認符合規格，再確認代碼品質。

### Stage 1: Spec 合規審查 (Specification Compliance)

確認代碼符合規格：

| 檢查項 | 通過條件 |
|-------|---------|
| 需求完整性 | 所有規格需求都已實作 |
| 無多餘實作 | 沒有規格外的功能 (YAGNI) |
| 邊界案例 | 規格定義的邊界都已處理 |

**未通過時**: 回到開發，修復後重審

### Stage 2: 品質審查 (Code Quality)

確認代碼品質達標：

| 面向 | 檢查內容 |
|------|---------|
| 安全性 | 硬編碼祕鑰、SQL 注入、權限驗證 |
| 效能 | 迴圈複雜度、快取使用、記憶體洩漏 |
| 可維護性 | 命名清晰、結構合理、註解完整 |
| 測試覆蓋 | 有對應的測試驗證 |

**未通過時**: 回到開發，修復後重審

## 審查清單

### 1. 安全性 (Security)
- [ ] 無硬編碼的祕鑰、Token 或私鑰
- [ ] API Endpoint 具備權限驗證
- [ ] SQL 查詢使用參數化查詢
- [ ] CORS 設定僅允許特定來源

### 2. 效能 (Performance)
- [ ] 無深度巢狀迴圈導致的性能瓶頸
- [ ] 大數據量下正確使用緩衝或分頁
- [ ] 無記憶體洩漏風險

### 3. 規範性 (Compliance)
- [ ] 遵循 `.agent/rules/` 的規定
- [ ] 檔案/變數/類別命名一致
- [ ] 註解語言符合規範

### 4. 測試 (Testing)
- [ ] 有對應的單元測試
- [ ] 邊界案例已測試
- [ ] 所有測試通過

## 審查報告格式

```markdown
## 審查報告

**審查者**: [Agent ID]
**日期**: YYYY-MM-DD
**狀態**: 通過 / 需修改

### Stage 1: Spec 合規
- ✅ 需求完整性: [說明]
- ⚠️ YAGNI 違規: [若有]

### Stage 2: 代碼品質

#### 致命錯誤 (Critical)
- [必須立即修復的問題]

#### 改進建議 (Suggestions)
- [效能優化或重構建議]

#### 規範優化 (Chore)
- [風格、命名微調]
```

## 審查流程

```
收到審查請求
    ↓
Stage 1: Spec 合規審查
    ↓
通過？ → No → 回開發修復 → 重審
    ↓ Yes
Stage 2: 品質審查
    ↓
通過？ → No → 回開發修復 → 重審
    ↓ Yes
審查通過，可合併
```

## 禁止行為

| 禁止 | 原因 |
|------|------|
| 跳過 Stage 1 直接審品質 | 可能審查不該存在的代碼 |
| 「Close Enough」接受 | 問題會累積 |
| 忽略警告訊息 | 警告會變錯誤 |
