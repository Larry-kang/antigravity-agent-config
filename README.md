# Antigravity Agent Config

> 高品質的 AI Agent 工程規範與技能庫

這是一個為 Google Antigravity AI Agent 設計的全局配置專案，包含完整的工程規範、技能定義與工作流程。

## 專案結構

```
.agent/
├── rules/              # 全局規則
│   └── global_rules.md
├── skills/             # 技能庫
│   ├── gas-ops/        # Google Apps Script 工程規範
│   ├── dotnet-engineering/  # C# .NET 工程規範
│   ├── python-ops/     # Python 工程規範
│   ├── docker-ops/     # Docker 容器化規範
│   └── wsl-ops/        # WSL 操作規範
├── workflows/          # 工作流程
└── scripts/            # 工具腳本
```

## 技能庫

### 已建立技能

| 技能 | 版本 | 說明 |
|---|---|---|
| [gas-ops](skills/gas-ops/SKILL.md) | v2.0.0 | Google Apps Script 工程規範 (開發、效能、UI、測試、CI/CD) |
| [dotnet-engineering](skills/dotnet-engineering/SKILL.md) | v2.0.0 | .NET 工程規範 (架構、編碼、SOLID、測試) |
| [python-ops](skills/python-ops/SKILL.md) | v2.0.0 | Python 工程規範 (PEP 8、Type Hints、測試) |
| [docker-ops](skills/docker-ops/SKILL.md) | v1.0.0 | Docker 容器化規範 (Dockerfile、Compose、安全性) |
| [wsl-ops](skills/wsl-ops/SKILL.md) | v1.0.0 | WSL 操作規範 (安裝、檔案系統、網路、整合) |

## 全局規則

專案包含完整的全局規則 ([global_rules.md](rules/global_rules.md))，涵蓋：

- **語言絕對原則**: 思考過程使用繁體中文，程式碼使用英文
- **第一性原理思維**: 強制執行拆解與重構思考模式
- **品質計分系統**: 自評機制與修正觸發
- **交付即用原則**: 一鍵啟動與完整上下文
- **編碼協定**: UTF-8 強制規範

## 使用方式

### 1. 作為全局配置
將此專案放置於 `d:\Dev\GitHub\.agent`，Antigravity Agent 會自動載入全局規則與技能。

### 2. 技能引用
在專案特定的 `.agent` 目錄中引用全局技能：

```markdown
---
trigger: always_on
description: 專案特定規則
---

# 專案規則

參考全局技能：
- [Python 工程規範](file:///d:/Dev/GitHub/.agent/skills/python-ops/SKILL.md)
- [Docker 規範](file:///d:/Dev/GitHub/.agent/skills/docker-ops/SKILL.md)
```

## 貢獻

歡迎提交 Issue 或 Pull Request 來改進規範與技能定義。

## 授權

MIT License - 詳見 [LICENSE](LICENSE)

## 作者

Larry Kang
