---
name: dotnet-engineering
description: Use when designing architecture, writing code, or performing unit tests in .NET projects. Enforces coding standards and architecture patterns.
metadata:
  version: "1.0.0"
---

# .NET Engineering Skill

此技能規範與維護 .NET 專案的開發環境與程式碼品質標準，包含 C# 編碼風格、專案架構與測試自動化。

## 核心規則 (Core Rule)

### 1. 語言版本與選型
- **優先使用**: .NET 8.0 或更高版本。
- **異步程式開發**: 除非庫不支持，否則所有 I/O 密集型操作必須使用 `async/await`。
- **命名規範**: 嚴格遵循 Microsoft C# 命名慣例 (PascalCase for Classes/Members, camelCase for local variables)。

### 2. 編碼強制協定 (UTF-8 Protocol)
- **原始碼編碼**: 所有 `.cs` 與 `.csproj` 檔案必須保存為 **UTF-8 with BOM** (確保 Visual Studio 兼容性) 或純 **UTF-8**。
- **中文處理**: 程式碼註解必須使用繁體中文。若在字串中出現中文，確保專案編碼設定正確，避免執行期亂碼。

### 3. 單元測試 (Unit Testing)
- **測試框架**: xUnit (首選)。
- **DoD (Definition of Done)**: 所有邏輯異動必須具備對應的單元測試，且測試覆蓋率需保持在 80% 以上。

## 常用操作

### 專案編譯 (dotnet CLI)
```powershell
dotnet build
```

### 執行單元測試
```powershell
dotnet test
```

### 建立新遷移 (Entity Framework Core)
```powershell
dotnet ef migrations add [MigrationName]
```
