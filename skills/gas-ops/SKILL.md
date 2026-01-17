---
name: gas-ops
description: Google Apps Script 營運與開發工具箱
version: 1.0.0
---

# GAS Ops Skill

此技能提供 Google Apps Script (GAS) 專案的標準開發流程，整合 `clasp` 工具進行雲端同步。

## 依賴需求 (Dependencies)
- Node.js & npm
- @google/clasp (全域或本地安裝)
- 若未安裝，請執行: `npm install -g @google/clasp`

## 提供的指令 (Commands)

### 1. Push to Cloud (推送到雲端)
將本地代碼推送到 Google Apps Script 專案。
此指令會自動處理 `.js` 到 `.gs` 的轉換（若有配置）。

```powershell
clasp push
```

### 2. Pull from Cloud (從雲端拉取)
從 Google Apps Script 專案拉取最新代碼。
**注意**: 這將會覆蓋本地變更。

```powershell
clasp pull
```

### 3. Deploy (部署版本)
建立新的不可變版本 (Version) 並更新部署 (Deployment)。

```powershell
clasp version "Auto-deploy: $(Get-Date -Format 'yyyy-MM-dd HH:mm')"
# 需搭配 deploymentId 使用，通常建議手動確認 ID
# clasp deploy -i [deploymentId] -d "Description"
```

## 最佳實踐 (Best Practices)
1.  **Always Pull First**: 修改前先 Pull，避免版本衝突。
2.  **Use TypeScript/JSDoc**: 善用型別檢查減少 Runtime 錯誤。
3.  **Local Testing**: 盡可能將邏輯抽離成純 JS 函?，在本地用 Node.js 測試後再 Push。
