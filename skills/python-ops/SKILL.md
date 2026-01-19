---
name: python-ops
description: Python 環境與操作規範 (環境管理、執行、編碼)
metadata:
  version: "1.0.0"
---

# Python Ops Skill

此技能規範與維護 Python 開發環境標準，確保使用正確的虛擬環境 (Virtual Environment) 與編碼輸出。

## 核心規則 (Core Rule)

### 1. 虛擬環境執行
- **環境路徑**: `.bin/python/python.exe`
- **使用原則**: 嚴禁直接使用系統 `python`。所有本專案腳本必須通過 `.bin/python/python.exe` 執行。
- **WSL 模式**: 於 WSL 環境下，則使用 `wsl python3`。

### 2. 編碼強制協定 (UTF-8 Protocol)
- **輸入讀取**: 讀取檔案時必須顯式指定 `encoding='utf-8'`。
- **輸出寫入**: 寫入檔案時必須顯式指定 `encoding='utf-8'`。
- **控制台輸出**: 腳本開頭必須 reconfiguration `sys.stdout` 確保終端顯示正常：
  ```python
  import sys
  sys.stdout.reconfigure(encoding='utf-8')
  ```

### 3. Mojibake 修復
- 若腳本產出亂碼，優先檢查輸出檔案的編碼宣告。
- 禁止對亂碼進行二進位強制轉碼，應從資料源頭重寫為純 UTF-8。

## 常用操作

### 環境修復
若虛擬環境損毀或依賴遺失，執行：
```powershell
python ops/repair_project.py
```

### 腳本執行 (Powershell)
```powershell
.bin\python\python.exe scripts/your_script.py
```
