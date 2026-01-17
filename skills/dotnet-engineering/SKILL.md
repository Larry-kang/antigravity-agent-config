---
name: dotnet-engineering
description: .NET 專案工程化工具 (Build, Test, Nuget)
version: 1.0.0
---

# .NET Engineering Skill

此技能提供 C# / .NET 專案的標準建置與測試流程。

## 依賴需求 (Dependencies)
- .NET SDK (6.0, 7.0, or 8.0)
- PowerShell

## 提供的指令 (Commands)

### 1. Build Solution (建置專案)
編譯方案檔 (.sln)，確保沒有語法錯誤。

```powershell
dotnet build --configuration Release
```

### 2. Run Tests (執行測試)
掃描專案中的測試專案並執行。輸出詳細結果。

```powershell
dotnet test --verbosity normal
```

### 3. Restore Packages (還原套件)
還原 NuGet 相依套件。通常在剛 clone 專案時執行。

```powershell
dotnet restore
```

### 4. Clean Artifacts (清理暫存)
清理 `bin/` 和 `obj/` 資料夾，解決奇特的編譯快取問題。

```powershell
dotnet clean
```

## 最佳實踐 (Best Practices)
1.  **Treat Warnings as Errors**: 保持編譯輸出乾淨。
2.  **Separate Test Projects**: 每個核心專案應對應一個測試專案 (例如 `Core.Tests`)。
3.  **Use launchSettings.json**: 管理本地開發的環境變數。
