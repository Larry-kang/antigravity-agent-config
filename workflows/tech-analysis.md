---
description: 即時技術面分析 (Instant Technical Analysis - No File Output)
---

# Instant Technical Analysis Workflow V1.0 (即時技術面分析)

本工作流專門用於「即時盤勢掃描」，分析結果將直接透過對話匯報，不儲存至本地檔案，以維持研究目錄的純淨與即時性。

## 0. 執行規則 (Execution Rule)
*   **指令觸發**: `/tech-analysis [Ticker]` (例如: `/tech-analysis BTC`)。
*   **無檔案產出**: 嚴禁在執行此工作流期間建立任何 `.md` 檔案。
*   **即時性**: 所有數據必須為執行當下的最新網路資訊。

## 1. 數據獲取 (Data Acquisition)
*   **即時行情**: 獲取標的之目前成交價、漲跌幅、24H 成交量。
*   **技術指標 (Standard Metrics)**:
    - **移動平均線**: 20MA, 50MA, 200MA。
    - **乖離率 (MM)**: 價格 / 200MA (計算 Mayer Multiple)。
    - **超買超賣**: RSI (14) 指標。
*   **盤勢結構**: 最近的關鍵支撐位 (Support) 與壓力位 (Resistance)。

## 2. AI 趨勢分析 (Trend Assessment)
*   **趨勢判斷**: 根據均線排列與 MM 值判斷當前處於：🔥 強勢多頭 / 🛡️ 高位盤整 / ❄️ 弱勢空頭。
*   **動能評估**: 根據 RSI 判斷是否具備超跌反彈機會或過熱回調風險。

## 3. 即時匯報規範 (Report Protocol)
1. **摘要**: 給出一致的建議標記 (e.g. [Bullish], [Wait], [Caution])。
2. **數據清單**: 以繁體中文條列上述獲取的技術指標。
3. **戰略提示**: 基於 SAP 戰略，給出「日内」或「週內」的操作建議。

---
*V1.0 標準制定於 2026-01-14*

## 4. 結束程序
1. **完成**: 確保所有分析已在對話中呈現，結束工作流。