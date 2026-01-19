---
description: 注入新市場洞察與知識 (Knowledge Injection SOP)
---

# 知識注入標準程序 (Knowledge Injection SOP)

本流程用於將外部研究、市場發現或用戶提供的洞察，結構化地存入系統記憶。

## Phase 1: 分類與撰寫 (Category & Structuring)
1. **判斷類別**:
   - **Macro**: 宏觀經濟、利率政策、地緣政治。
   - **Crypto**: 鏈上數據、協議更新、幣圈敘事。
   - **Equity**: 個股財報、產業趨勢、機構評級。
   - **Strategy**: 交易策略、風險控管模型。
2. **撰寫 Markdown**:
   - 建議建立新檔案: `research/notes/Note_[Topic]_[Date].md`。
   - 或追加至 `my-ai-swarm/project-memory.md` (若為長期原則)。

## Phase 2: 關聯性連結 (Linking)
1. **更新相關報告**:
   - 若知識影響特定標的 (e.g., NVDA 新晶片)，請更新 `research/tickers/NVDA_Full_Analysis.md` 的 "Catalysts" 章節。
   - 若影響宏觀判斷，請更新 `research/strategy/SAP_Master_Report_2026.md`。

## Phase 3: 審查與同步 (Review & Sync)
1. **文件審查**: 呼叫 [/document-review](file:///.agent/workflows/document-review.md)。
2. **Notion 同步**: 呼叫 @[/sync-research](file:///.agent/workflows/sync-research.md) 將新知識推送到 Research Hub。

## Phase 4: 版本控制與索引更新 (Version Control & Indexing)
1. **更新知識索引**:
   ```powershell
   wsl python3 ops/update_knowledge_hub.py
   ```
2. **Git Commit**:
   ```powershell
   git add research/ my-ai-swarm/
   git commit -m "[Knowledge] Inject: [Brief Topic]"
   ```
