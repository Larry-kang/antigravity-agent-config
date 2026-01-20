---
name: subagent-development
description: Use when executing implementation plans with independent tasks and you want fresh context per task with two-stage review.
metadata:
  version: "1.0.0"
  source: "Adapted from obra/superpowers"
---

# 子代理驅動開發 (Subagent-Driven Development)

透過調度獨立子代理執行每個任務，避免上下文污染，並實施二階段審查確保品質。

## 何時使用

- 有已核准的實作計畫
- 任務間相對獨立
- 希望自動化品質把關

## 核心原則

```
每任務獨立子代理 + 二階段審查 = 高品質、快速迭代
```

## 流程圖

```
讀取計畫，提取所有任務
    ↓
[Per Task Loop]
    ↓
調度實作子代理
    ↓
子代理有問題？ → 回答問題，提供上下文
    ↓
子代理實作、測試、提交、自我審查
    ↓
調度 Spec 審查子代理
    ↓
Spec 合規？ → No → 實作子代理修復 → 重審
    ↓ Yes
調度品質審查子代理
    ↓
品質通過？ → No → 實作子代理修復 → 重審
    ↓ Yes
標記任務完成
    ↓
[End Loop]
    ↓
調度最終審查子代理
    ↓
使用 finishing-a-development-branch 完成
```

## 二階段審查

### Stage 1: Spec 合規審查

確認代碼符合規格：
- ✅ 所有需求都已實作
- ✅ 沒有多餘實作 (YAGNI)
- ❌ 若有缺漏或多餘 → 修復後重審

### Stage 2: 品質審查

確認代碼品質：
- 測試覆蓋率
- 代碼可讀性
- 效能考量
- 安全性

## 紅旗警示 (絕不可做)

| 禁止行為 | 原因 |
|---------|------|
| 跳過審查 | 品質無法保證 |
| 帶問題繼續 | 問題會累積 |
| 並行多個實作子代理 | 會產生衝突 |
| 讓子代理讀取計畫檔 | 應提供完整文本 |
| 忽略子代理問題 | 回答後才讓其繼續 |
| Spec 審查有問題就跳品質審查 | 順序錯誤 |

## 子代理失敗處理

若子代理任務失敗：
1. 調度**修復子代理**，提供具體指示
2. 不要手動修復（會污染上下文）

## 優勢

vs. 手動執行：
- 子代理自然遵循 TDD
- 每任務全新上下文
- 可提問，不會卡住

vs. 批次執行：
- 同一會話，無切換成本
- 持續進度，無需等待
- 自動審查檢查點
