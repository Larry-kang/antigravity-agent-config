---
description: 執行每日風險預測與市場掃描 (Daily Risk Forecast & Market Scan)
---

# 每日例行工作流 (Daily Routine)

## Phase 0: 系統預檢 (Pre-flight)

// turbo
1. **環境健康檢查**:
   ```powershell
   .bin\python\python.exe ops/repair_project.py
   .bin\python\python.exe ops/lint_reports.py
   ```
2. **Git 分支準備**:
   ```powershell
   git checkout main
   git pull origin main
   ```

## Phase 1: 數據蒐集與報告 (Data & Reporting)
1. **確認日期**: 獲取當前日期 (YYYYMMDD)。
2. **Oracle Check (Polymarket)**: 檢查關鍵預測市場訊號 (Fed Rates, Geopolitics, BTC Top)，確認是否有重大機率變動。
3. **搜索數據**: 針對以下標的進行 Web Search (技術面、籌碼面、消息面)：
   - **BTC**: 重點關注 Price, ETF Flow, Whale Activity, Support/Resistance。
   - **NVDA, TSMC (2330), TSLA**: 重點關注機構評級、營收預期、技術指標。
   - **Macro**: 查詢 "Economic Calendar next 5 days" (重點: CPI, Fed Rate Decision, Non-Farm, FOMC Minutes)。
   - **Crypto Flows**: 查詢 "Bitcoin ETF net inflow yesterday", "BTC whale alert today", "USDT market cap change"。
   - **Tech Fundamentals**: 查詢 "NVDA/TSMC revenue guidance consensus", "analyst price target changes"。
   - **Yield Options**: 查詢 "YMAG implied volatility rank", "current 30-day SEC yield"。
4. **更新關鍵標的 (Targeted Update)**:
   - 呼叫 `.agent/workflows/ticker-deep-dive.md` 並指定參數：`BTC`, `NVDA`, `TSMC`, `TSLA`。
   - 目的：僅針對核心持倉進行每日報價與模擬更新，大幅縮短執行時間。
5. **產出報告**: 
   - 彙整所有數據，建立/覆蓋檔案: `research/daily_briefs/Multi_Target_Analysis_[YYYYMMDD].md`。
   - 格式請參考 `research/templates/daily_report_v5.md`。

## Phase 2: 模擬驗證 (Simulation)
1. **取得 BTC 價格**: 從 Phase 1 的搜索結果中提取當前 BTC 價格。
2. **執行模擬**: 
   - 運行指令: `.bin\python\python.exe scripts/daily_forecast_sim.py --price [BTC price]`
   - (註: 系統將自動讀取 `ticker_params.json` 的校準參數，除非您想手動覆寫 `--vol`)
3. **讀取結果**: 記錄「破產機率 (Liquidation Rate)」與「平均淨值」。

## Phase 3: 戰略校準 (Alignment)
1. **讀取 Roadmap**: `research/strategy/SAP_Master_Report_2026.md`。
2. **新增日誌**: 將今日模擬結果 (日期、價格、破產率、結論) 追加到 Roadmap 的「模擬驗證日誌」表格中。
3. **LTV 執行矩陣對照**: 
   - 計算 **Mayer Multiple (MM)** = BTC 現價 / 200 MA。
   - 根據 [Manual_Smart_Leverage_Matrix.md](file:///research/manuals/Manual_Smart_Leverage_Matrix.md) 查表：
     - MM < 0.6: 深水炸彈區 (Target LTV 40%)
     - MM 0.6-1.0: 低估積累區 (Target LTV 30%)
     - MM 1.0-1.4: 合適持有區 (Target LTV < 25%)
     - MM 1.4-2.0: 風險去化區 (Target LTV < 15%)
     - MM > 2.0: 泡沫警戒區 (Target LTV 0%)
   - **將當前 MM、週期定位、目標 LTV 寫入每日報表**。
4. **檢查觸發條件**:
   - 若破產機率 > 5%: 檢查 Roadmap 狀態是否為警示狀態。
   - 若 BTC < $88,000: 提示使用者是否觸發「閃崩買入」。

## Phase 4: 交付 (Handover)

// turbo
1. **版本鎖定 (Git Commit)**:
   ```powershell
   # Context-Aware Branching: Create doc branch for the day
   $dateStr = Get-Date -Format 'yyyyMMdd'
   $branchName = "doc/daily-report-$dateStr"
   
   # Check if branch exists, if not create it
   if (git show-ref --verify --quiet "refs/heads/$branchName") {
       git checkout $branchName
   } else {
       git checkout -b $branchName
   }

   # 1. 提交變更
   git add research/
   git commit -m "docs: [Report] Daily Analysis $dateStr"
   
   # 2. 合併回 main
   git push origin $branchName
   git checkout main
   git merge $branchName
   git push origin main
   git branch -d $branchName
   ```
2. **通知使用者**: 
   - 提供報告連結。
   - 匯報模擬結果 (安全/危險)。
   - 給出今日操作建議 (維持/行動)。

## Phase 5: 文件審查 (Document Review)
1. **執行檢查**: 呼叫 [/document-review](file:///.agent/workflows/document-review.md) 檢查產出報告。
2. **簽署**: 確認無亂碼、語言正確後，通知使用者。
3. **知識注入**: 若在搜索與分析過程中有新的市場發現，請執行 [/add-knowledge](file:///.agent/workflows/add-knowledge.md) 進行歸檔。

## Phase 6: Notion 推送 (Notion Sync)
1. **執行同步**: Call /sync-research
