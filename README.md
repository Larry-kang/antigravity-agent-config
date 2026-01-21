# Antigravity Agent 配置庫 (Agent Configuration)

本目錄存放了 Antigravity AI 代理的核心配置、行為準則、技能模組與自動化工作流，旨在確保 Agent 在開發與研究任務中的穩定性與標準化。

## 目錄結構

```text
.agent/
├── rules/             # 核心準則與規範
│   ├── global_rules.md # 全域開發與行為準則
│   └── project_rules.md # 專案特定規則
├── skills/            # 技能模組 (Skills)
│   ├── skill-factory/ # 技能工廠 (管理規範)
│   ├── gas-ops/       # Google Apps Script 營運規範
│   ├── dotnet-engineering/ # .NET 工程標準
│   └── ...            # 其他專業技能
├── workflows/         # 自動化工作流 (Workflows)
│   ├── daily-routine.md # 每日例行分析
│   ├── startup.md      # 環境初始化
│   └── ...            # 其他斜槓指令工作流
└── README.md          # 本說明文件
```

## 核心功能

1. **規範優先**: 所有 AI 行為均受到 `rules/` 下的 Markdown 規範約束。
2. **技能擴充**: 透過 `skills/` 目錄，Agent 可獲得處理特定技術棧（如 .NET, GAS, Python）的能力。
3. **流程自動化**: `workflows/` 定義了複雜任務的 SOP，可透過 Chat 介面以斜槓指令調用。

## 使用指引

- **更新技能**: 請參考 `skills/skill-factory/` 的規範進行。
- **調整準則**: 修正 `rules/global_rules.md` 前須經過「蘇格拉底式需求釐清」流程。
- **疑難排解**: 執行 `/health-check` 技能以確認環境狀態。

---
**最後更新**: 2026-01-21  
**維護者**: 🕵️ [Agent: Auditor]  
*Powered by Antigravity "Superpowers" Framework*
