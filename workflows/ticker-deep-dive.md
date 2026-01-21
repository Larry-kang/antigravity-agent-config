---
description: V4.0 全球標的深度研究標準 (Multi-Horizon & Compliance)
---

# Ticker Deep Dive Workflow V4.0 (全球標的深度研究標準)

## 0. 執行規則 (Execution Rule)
*   **默認行為**: 若未指定 Ticker，則自動遍歷 `research/reports/tickers` 目錄下所有已存在的 `.md` 報告，進行更新。
*   **指定模式**: 若指定 Ticker (e.g. `TSMC`)，則只針對該標的執行。
*   **新增標的**: 若需分析全新標的，請先執行 [/add-new-ticker](file:///.agent/workflows/add-new-ticker.md) 完成設定。


> **核心宗旨 (Core Doctrine)**: V4.0 標準旨在將「多週期量化預測」與「SAP 稅務/結構合規」完美融合，打造符合 2036 FIRE 戰略的終極決策文檔。

## 1. 完整性檢查 (Integrity Check)
*   **基本資料**: 
    *   全名 / 代號 / 交易所 / 成立日期。
    *   **內扣費用 (Expense Ratio)**: 長期持有的隱形成本。
    *   **資產規模 (AUM)**: 流動性與清算風險指標。
*   **產品結構**: 
    *   ETF (Physical/Synthetic) / ETN / CEFs / Stock / Crypto。
    *   **稅務屬性**: 是否適用 30% 預扣稅 (WHT) 或具備 QI 退稅資格。

## 2. 價值模型與 SAP 評級 (Valuation & Rating)
*   **SAP 四象限評級**:
    *   🛡️ **Beta (基準)**: 市場權值，跟隨大盤 (如 0050, VOO)。
    *   ⚔️ **Alpha (攻擊)**: 超額報酬，跑贏大盤 (如 NVDA, BTC, 00757)。
    *   💰 **Cash (現金流)**: 穩定配息，提供生活費 (如 0056, 00878)。
    *   ⚠️ **Trap (陷阱)**: 賺股息賠價差，或結構性減損 (需避開)。
*   **估值指標**:
    *   PE / PB / Yield (基本面)。
    *   Premium/Discount (ETF 折溢價)。

## 3. 在地化稅務試算 (Localization & Tax) - **V4.0 核心**
*   **情境**: 台灣投資人 (Non-US Person) 複委託/台股視角。
*   **真實殖利率 (True Yield)**:
    *   美股/ETF: `Gross Yield * 0.7` (扣除 30% WHT)。
    *   台股: `Gross Yield` (由股利所得稅處理，視個人級距)。
    *   加密貨幣: 資本利得稅 (目前台灣個人暫無，海外所得制)。
    *   *註：主要評估「稅後」拿到手裡的真實現金流效益。*

## 4. 技術動能分析 (Technical Dynamics) - **V3.1 繼承**
*   **趨勢指標**:
    *   **Mayer Multiple (MM)**: 價格 / 200MA (判斷乖離率)。
        *   `MM < 0.9`: **[Strong Buy]** (極度便宜/回歸均值區)。
        *   `MM > 2.4`: **[Sell]** (過熱區)。
    *   **RSI (14)**: 動能過熱/過冷。
    *   **MACD & KD**: 輔助判斷短線轉折。

## 5. 多週期量化模擬 (Multi-Horizon Simulation) - **V3.1 繼承**
1. **參數校準 (Calibration)**:
   - 運行指令: `.bin\python\python.exe scripts/fetch_history_metrics.py`
   - 目的: 根據 5 年歷史數據自動校準 CAGR 與 Volatility (寫入 `ticker_params.json`，來源標記為 `History (5Y)`)。
2. **執行模擬**:
   - 運行指令 (Batch): `.bin\python\python.exe scripts/simulate_ticker.py`
   - 腳本將優先讀取 JSON 參數，若無則使用戰略階層假設 (Tier Fallback)。
   - **產出**: 更新每個 `*_Full_Analysis.md` 檔案內的模擬表格 (Section 4) + Dashboard。
// turbo
3. **FIRE 對齊更新**:
   - 運行指令: `.bin\python\python.exe ops/update_fire_section.py`
   - 目的: 將模擬結果 (1Y/10Y 中位數) 注入 Section 5 FIRE 戰略對齊表格。


## 6. 即時情報與市場催化劑 (Catalysts & News)
*   整合近期重大新聞、財報預期與市場敘事 (Narrative)。

---
*V4.0 標準制定於 2026-01-09*

## 7. 文件審查 (Document Review)
1. **執行檢查**: Call /document-review

## 8. 版本控制與同步 (Commit & Sync)
1. **提交變更**:
   ```powershell
   git add research/tickers/
   git commit -m "[Report] Deep Dive Update"
   git push origin main
   ```
2. **執行同步**: Call /sync-research
