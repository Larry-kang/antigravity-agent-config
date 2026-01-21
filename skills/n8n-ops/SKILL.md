---
name: n8n-ops
description: Use when managing, developing, or deploying n8n workflows. Handles automated workflow management and tool configuration.
metadata:
  version: "1.0.0"
---

# n8n Operations (n8n-ops)

此 Skill 提供標準化的工具與流程，用於程式碼化管理 (JSON-as-Code) n8n 工作流。

## 1. 核心能力 (Capabilities)

- **Workflow Patching**: 使用 Python 腳本精準修改複雜的 JSON 結構，避免 UI 操作失誤。
- **Node Injection**: 快速注入標準化的功能節點（如 Yahoo Finance, Logger）。
- **Validation**: 驗證 Workflow JSON 結構是否符合最佳實踐 (Rules)。

## 2. 標準腳本 (Standard Scripts)

此 Skill 包含一個通用的修改腳本模板 `scripts/patch_n8n_workflow.py`，使用前請複製到專案目錄。

### 使用方式
```bash
python scripts/patch_n8n_workflow.py --target "n8n/workflows/daily_routine.json" --action "update_node" --node_name "Yahoo Finance"
```

## 3. 開發流程 (Workflow)

1.  **Export**: 從 n8n UI 匯出最新 JSON 到 git 專案 (`n8n/workflows/`).
2.  **Patch**: 撰寫或使用 Patch Script 修改 JSON。
3.  **Diff**: 使用 Git Diff 檢查變更（確保只改了目標部分）。
4.  **Import**: 將修改後的 JSON 匯入回 n8n。

## 4. 依賴 (Dependencies)
- Python 3.8+
- `json` (Standard Lib)
