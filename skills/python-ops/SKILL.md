---
name: python-ops
description: Python 通用操作技能 (環境管理、執行器)
version: 1.0.0
---

# Python Ops Skill

此技能提供跨專案的 Python 執行標準，確保使用正確的虛擬環境 (Virtual Environment)。

## 核心規則 (Core Rule)
**優先使用專案內部的 Python解釋器**
為了確保環境一致性，Agent 必須優先檢查以下路徑來執行 Python：
1.  `.bin/python/python.exe` (最佳實踐：Sovereign Alpha 標準)
2.  `.venv/Scripts/python.exe` (標準 venv)
3.  `venv/Scripts/python.exe`
4.  最後才使用系統 PATH 的 `python`

## 提供的指令 (Commands)

### 1. Run Script (執行腳本)
使用偵測到的最佳 Python 環境執行腳本。

```powershell
# 請根據專案結構自行替換路徑
.bin\python\python.exe scripts/your_script.py
```

### 2. Check Environment (檢查環境)
確認目前使用的 Python 版本與路徑。

```powershell
Get-Command python | Select-Object Source
python --version
```

### 3. Pip Install (安裝套件)
**警告**: 僅在全權負責的專案 (Owned Project) 中執行。
對於已有 `requirements.txt` 的專案：

```powershell
pip install -r requirements.txt
```

## 最佳實踐 (Best Practices)
1.  **Always use Full Path**: 在 Prompt 中建議寫出 `.bin\python\python.exe` 以明確指令。
2.  **No System Pollution**: 嚴禁在全域環境 `pip install`，除非是開發者明確要求。
3.  **UTF-8 Handling**: Python 處理中文時，請確保 `PYTHONIOENCODING=utf-8` 或在程式碼中明確指定編碼。
