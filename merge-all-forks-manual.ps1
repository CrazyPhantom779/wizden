# Merge all forks with manual conflict handling
# Goal: Get ALL fork content, preserve everything, manually resolve to keep features

$forks = @(
    "starlight",
    "far-horizons", 
    "nyanotrasen",
    "deltav",
    "parkstation",
    "einstein-engines",
    "hullrot",
    "frontier",
    "monolith",
    "crystal-edge",
    "impstation",
    "goob-station",
    "goob-station-piras314",
    "nuclear-14",
    "white-dream",
    "cosmatic-drift",
    "hardlight",
    "emberfall",
    "moff-station",
    "space-syndicate",
    "deep-station",
    "harmony-station",
    "rmc-14",
    "sunrise-station",
    "lust-station",
    "fire-station",
    "polonium-station",
    "trieste-port"
)

$currentDir = "c:\Users\Izayus\Documents\GitHub\wizden"
Set-Location $currentDir

Write-Host "Starting fork content consolidation (manual conflict resolution)" -ForegroundColor Green
Write-Host "Strategy: Merge all forks, preserve all content, handle conflicts manually" -ForegroundColor Yellow
Write-Host "Total forks to merge: $($forks.Count)" -ForegroundColor Cyan
Write-Host ""

$mergedCount = 0
$conflictCount = 0

foreach ($fork in $forks) {
    $index = $forks.IndexOf($fork) + 1
    $percent = [math]::Round(($index / $forks.Count * 100), 1)
    
    Write-Host "[$percent%] [$index/$($forks.Count)] Merging $fork... " -NoNewline -ForegroundColor Cyan
    
    # Attempt merge without any conflict resolution strategy
    git merge "$fork/master" --no-edit -q 2>&1
    $exitCode = $LASTEXITCODE
    
    if ($exitCode -eq 0) {
        # Merge completed cleanly
        Write-Host "MERGED" -ForegroundColor Green
        $mergedCount++
    }
    else {
        # Merge has conflicts - stop and let user handle them
        $conflicts = git diff --name-only --diff-filter=U
        $conflictFiles = ($conflicts | Measure-Object -Line).Lines
        
        Write-Host "CONFLICTS ($conflictFiles files)" -ForegroundColor Yellow
        Write-Host ""
        Write-Host "=== MERGE PAUSED ===" -ForegroundColor Yellow
        Write-Host "Fork: $fork" -ForegroundColor Cyan
        Write-Host "Conflicted files: $conflictFiles" -ForegroundColor Yellow
        Write-Host ""
        Write-Host "To resolve:" -ForegroundColor Yellow
        Write-Host "  1. Edit conflicted files (marked with <<<<<<, ======, >>>>>>)" -ForegroundColor Gray
        Write-Host "  2. Keep content from BOTH sections where features differ" -ForegroundColor Gray
        Write-Host "  3. Run: git add -A && git commit -m 'Merge $fork'" -ForegroundColor Gray
        Write-Host "  4. Run: .\merge-all-forks-manual.ps1 to continue" -ForegroundColor Gray
        Write-Host ""
        Write-Host "First 20 conflicted files:" -ForegroundColor Yellow
        $conflicts | Select-Object -First 20 | ForEach-Object { Write-Host "  - $_" -ForegroundColor Red }
        
        exit 1
    }
}

Write-Host ""
Write-Host "========================================" -ForegroundColor Green
Write-Host "All forks merged successfully!" -ForegroundColor Green
Write-Host "Total merged without conflicts: $mergedCount / $($forks.Count)" -ForegroundColor Cyan
Write-Host "========================================" -ForegroundColor Green
Write-Host ""

Write-Host "Summary:"
git log --oneline master..EVERYTHING -3
Write-Host ""
Write-Host "Files changed:"
git diff --stat master EVERYTHING | tail -3
