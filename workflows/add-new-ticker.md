---
description: 新增標的與初始化分析流程 (New Asset Onboarding)
---

# 新增標的標準程序 (Add New Ticker SOP)

本流程用於將新的投資標的納入研究系統。

## Phase 1: 基本資料確認 (Data Verification)
1. **確認屬性 (Type)**:
   - **Equity**: Individual Stock, REITs.
   - **ETF**: Physical, Synthetic, Leveraged/Inverse.
   - **Crypto**: Layer-1, DeFi, Speculative.
   - **Fixed Income**: Treasury (US/TW), Corporate Bond, HY Bond.
   - **Commodity**: Gold, Oil, Agriculture (Futures/ETF).
   - **Forex/Macro**: Fiat Pairs (USD/TWD, DXY), Indices (VIX, Yield).

2. **確認市場 (Market)**:
   - US / TW / Crypto / Global.

3. **稅務狀態 (Tax Status)**:
   - 30% WHT / QI Qualified / Tax Free.

4. **取得代碼**: 確認 Yahoo Finance Ticker (e.g., `2330.TW`, `BTC-USD`, `^VIX`).

## Phase 2: 系統註冊 (System Registration)
1. **更新配置**:
   - 檢查 `research/config/ticker_params.json` (通常由腳本自動生成，但需確認)。
   - 若為特殊資產，需手動新增至 `ops/generate_reports.py` 的 `TICKER_DB` 清單中 (如需)。

## Phase 3: 量化校準 (Quant Calibration)
1. **抓取歷史數據**:
   - 執行: `.bin\python\python.exe scripts/fetch_history_metrics.py`
   - 確保新標的已被加入掃描並成功計算 CAGR / Volatility / Decay。
2. **驗證參數**:
   - 檢查 `ticker_params.json` 是否有該標的數據。
   - 確認 `vol_decay` 數值合理 (非 NaN)。

## Phase 4: 初次報告生成 (Initial Report)
1. **執行模擬**:
   - 執行: `.\run_sim.bat` (或針對單一標的執行 simulation script)。
2. **產出檢查**:
   - 檢查 `research/deep_dives/tickers/[Ticker]_Full_Analysis.md` 是否生成。
   - 檢查模擬數據表格是否完整。

## Phase 5: 交付與歸檔 (Handover)
1. **Git Commit**:
   ```powershell
   git add research/
   git commit -m "[Feat] Add new ticker: [Ticker Symbol]"
   ```
2. **通知用戶**: 報告已生成並同步至 Notion。
