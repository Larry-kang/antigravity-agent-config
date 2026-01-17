$root = "d:/Dev/GitHub"
$repos = Get-ChildItem -Path $root -Directory

Write-Host "Starting Git Audit for $root...`n" -ForegroundColor Cyan

foreach ($repo in $repos) {
    if ($repo.Name -eq ".agent" -or $repo.Name -eq "GAS_Cloud_Boilerplate") {
        # Skip known non-git or special folders if desired, but script logic handles them.
    }

    $gitPath = Join-Path $repo.FullName ".git"
    if (Test-Path $gitPath) {
        Push-Location $repo.FullName
        try {
            $remote = git remote
            if ($null -ne $remote) {
                git fetch --all --quiet 2>&1 | Out-Null
                
                $branch = git rev-parse --abbrev-ref HEAD
                $upstream = git rev-parse --abbrev-ref "@{u}" 2>$null
                
                $statusMsg = ""
                
                if ($upstream) {
                    # Use explicit strings for git arguments to avoid PS parsing issues
                    $behindArgs = "HEAD..$upstream"
                    $aheadArgs = "$upstream..HEAD"
                    
                    $behind = git rev-list --count $behindArgs 2>$null
                    $ahead = git rev-list --count $aheadArgs 2>$null
                    
                    if ($behind -eq 0 -and $ahead -eq 0) { $statusMsg = "? Synced" }
                    elseif ($behind -gt 0 -and $ahead -gt 0) { $statusMsg = "?? Diverged (-$behind/+$ahead)" }
                    elseif ($behind -gt 0) { $statusMsg = "?? Behind by $behind" }
                    elseif ($ahead -gt 0) { $statusMsg = "?? Ahead by $ahead" }
                }
                else {
                    $statusMsg = "?? No Upstream"
                }

                $dirty = git status --porcelain
                if ($dirty) { $statusMsg += " | ? Dirty (Uncommitted changes)" }
                
                Write-Host "[$($repo.Name)] ($branch)" -NoNewline -ForegroundColor Yellow
                Write-Host " -> $statusMsg"
            }
            else {
                Write-Host "[$($repo.Name)]" -NoNewline -ForegroundColor Yellow
                Write-Host " -> ?? No Remote Configured" -ForegroundColor Gray
            }
        }
        catch {
            Write-Host "[$($repo.Name)] -> Error: $($_.Exception.Message)" -ForegroundColor Red
        }
        Pop-Location
    }
    else {
        Write-Host "[$($repo.Name)] -> ? Not a Git Repository" -ForegroundColor DarkGray
    }
}
