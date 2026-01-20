---
name: systematic-debugging
description: Use when debugging any technical issue - test failures, production bugs, unexpected behavior. Enforces root cause analysis before fixes.
metadata:
  version: "1.0.0"
  source: "Adapted from obra/superpowers"
---

# 系統性除錯 (Systematic Debugging)

隨機修復浪費時間並可能引入新 Bug。必須先找到根因，再提出修復方案。

## 鐵律

```
NO FIXES WITHOUT ROOT CAUSE INVESTIGATION FIRST
```

若尚未完成 Phase 1，禁止提出修復方案。

## 何時使用

- 測試失敗
- 生產環境 Bug
- 非預期行為
- 效能問題
- 建置失敗
- 整合問題

**特別是當：**
- 時間緊迫（緊急情況讓人想猜測）
- 「一個小修復」似乎很明顯
- 已嘗試多次修復
- 上次修復沒用
- 不完全理解問題

## 四階段流程

### Phase 1: 根因調查 (Root Cause Investigation)

**目標**: 確定問題的真正來源

1. **重現問題** - 確保可穩定重現
2. **收集證據** - 日誌、錯誤訊息、堆疊追蹤
3. **隔離變數** - 什麼改變了？什麼沒改？
4. **追蹤來源** - 從症狀往回追蹤到根因

**產出**: 「問題是 X，因為 Y，證據是 Z」

### Phase 2: 模式分析 (Pattern Analysis)

**目標**: 理解問題的模式

1. 這是個別案例還是系統性問題？
2. 其他地方也有類似問題嗎？
3. 這是新問題還是舊問題的變種？

### Phase 3: 假說測試 (Hypothesis Testing)

**目標**: 驗證根因假說

1. 提出假說：「如果問題是 X，那麼 Y 應該...」
2. 設計測試驗證假說
3. 執行測試
4. 假說成立 → Phase 4
5. 假說失敗 → 回到 Phase 1

### Phase 4: 實作修復 (Implementation)

**現在才可以修復！**

1. 設計最小修復方案
2. 撰寫測試驗證修復
3. 實作修復
4. 執行所有測試
5. 確認問題已解決

## 紅旗警示

**立即停止並遵循流程：**

| 症狀 | 表示 |
|------|------|
| 「讓我試試這個...」 | 在猜測 |
| 「這應該可以...」 | 沒有驗證 |
| 「奇怪，為什麼不行」 | 不理解問題 |
| 多次修復嘗試 | 沒有根因分析 |

## 常見合理化藉口

| 藉口 | 駁斥 |
|------|------|
| 「情況緊急」 | 系統性方法更快 |
| 「這很簡單」 | 簡單問題也有根因 |
| 「我知道問題在哪」 | 那就證明它 |
| 「上次這樣修好的」 | 不同症狀可能不同根因 |
