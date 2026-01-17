# Global Skills (全域技能庫)

這個目錄存放跨專案通用的 Agent 技能。

## 用途
當多個專案需要執行類似的任務（例如：Git 操作、通用的 Python 環境檢查、Docker 管理）時，應將相關的 `SKILL.md` 定義在此處。

## 架構
每個技能應有自己的資料夾：
- `skill-name/`
  - `SKILL.md`: 技能說明與指令
  - `scripts/`: 相關腳本
  - `resources/`: 相關資源

## 範例
- `git-ops`: 跨專案的 Git 提交與同步標準流程
- `code-review`: 通用的代碼審查標準
