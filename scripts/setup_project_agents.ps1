$root = "d:/Dev/GitHub"
$dirs = Get-ChildItem -Path $root -Directory

foreach ($dir in $dirs) {
    if ($dir.Name -eq ".agent") { continue }

    $agentDir = Join-Path $dir.FullName ".agent"
    $rulesDir = Join-Path $agentDir "rules"
    $rulesFile = Join-Path $rulesDir "project_rules.md"

    if (-not (Test-Path $agentDir)) {
        New-Item -ItemType Directory -Path $agentDir -Force | Out-Null
        New-Item -ItemType Directory -Path $rulesDir -Force | Out-Null
        
        $content = @"
# 專案特定規則 (Project Rules)

> **繼承聲明**: 本專案自動繼承 `d:\Dev\GitHub\.agent\rules\global_rules.md` 的所有全域規範。

## 1. 技術堆疊 (Tech Stack)
- 主要語言: [待填寫]
- 框架: [待填寫]

## 2. 專案特規 (Project Specifics)
- (在此定義本專案獨有的開發規範)

"@
        
        # Ensure UTF-8 (No BOM)
        $utf8NoBom = New-Object System.Text.UTF8Encoding $false
        [System.IO.File]::WriteAllText($rulesFile, $content, $utf8NoBom)
        
        Write-Host "? Created .agent for [$($dir.Name)]" -ForegroundColor Green
    }
    else {
        Write-Host "??  Skipping [$($dir.Name)] (Already has .agent)" -ForegroundColor Gray
    }
}
