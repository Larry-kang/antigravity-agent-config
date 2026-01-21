---
name: markdown-quality
description: Use when validating Markdown files for encoding, formatting, and quality standards. Ensures global documentation consistency.
metadata:
  version: "1.0.0"
---

# Markdown Quality Skill

此技能規範 Markdown 文件的品質標準，包含編碼驗證、語言合規與格式檢查。

## 核心規則 (Core Rules)

### 1. 編碼標準 (Encoding Standard)
- 強制 UTF-8: 所有 .md 檔案必須使用 UTF-8 編碼儲存
- 禁止 BOM: 避免使用 UTF-8 with BOM
- 禁止 CP950/Big5: 嚴禁使用繁體中文舊編碼

### 2. 語言規範 (Language Standard)
- 正文: 使用繁體中文
- 程式碼區塊: 保留英文
- 禁止晶晶體: 不得中英夾雜，專有名詞除外

### 3. 格式規範 (Formatting Standard)
- 標題層級: 每個文件僅使用一個 H1
- 列表縮排: 使用 2 或 4 空格縮排
- 程式碼區塊: 必須指定語言標識

## 亂碼偵測與修復 (Mojibake Detection)

### 症狀識別
| 症狀 | 可能原因 |
|------|----------|
| U+FFFD 符號 | 二進位讀取錯誤 |
| 無意義符號連續 | UTF-8 被誤讀為 Latin-1 |
| 無意義中文字 | Big5/CP950 被誤讀為 UTF-8 |

### 修復策略
1. 禁止轉碼: 不嘗試使用工具轉換編碼
2. 重寫優先: 直接以 UTF-8 重新生成檔案內容
3. 來源驗證: 若為自動生成，檢查生成腳本的編碼設定

## 品質檢查清單

- 檔案編碼為 UTF-8
- 無亂碼符號
- 標題層級正確
- 程式碼區塊有語言標識
- 無簡體中文字元洩漏
- 連結與圖片路徑正確

## 最佳實踐

1. 編輯器設定: 確保 VS Code 等編輯器預設使用 UTF-8
2. Git Hooks: 考慮使用 pre-commit hook 自動檢查編碼
3. CI 整合: 將 Lint 檢查加入 GitHub Actions 流程