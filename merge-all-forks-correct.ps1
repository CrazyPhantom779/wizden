# Merge all forks using their correct default branches
# This version does NOT auto-resolve conflicts - conflicts are left for manual review

$ErrorActionPreference = "Stop"

# Fork remotes and their correct default branches (from git branch -r HEAD ->)
$forkMap = @{
    "cosmatic-drift" = "cosmatic-drift/master"
    "crystal-edge" = "crystal-edge/master"
    "deep-station" = "deep-station/master"
    "deltav" = "deltav/master"
    "einstein-engines" = "einstein-engines/master"
    "emberfall" = "emberfall/master"
    "far-horizons" = "far-horizons/Far-Horizons"
    "fire-station" = "fire-station/master"
    "frontier" = "frontier/master"
    "goob-station" = "goob-station/master"
    "hardlight" = "hardlight/master"
    "harmony-station" = "harmony-station/master"
    "hullrot" = "hullrot/master"
    "impstation" = "impstation/master"
    "lust-station" = "lust-station/master"
    "moff-station" = "moff-station/master"
    "monolith" = "monolith/main"
    "nuclear-14" = "nuclear-14/master"
    "nyanotrasen" = "nyanotrasen/master"
    "parkstation" = "parkstation/master"
    "polonium-station" = "polonium-station/master"
    "rmc-14" = "rmc-14/master"
    "space-syndicate" = "space-syndicate/master"
    "starlight" = "starlight/starlight-dev"
    "sunrise-station" = "sunrise-station/master"
    "trieste-port" = "trieste-port/master"
    "white-dream" = "white-dream/master"
}

$totalForks = $forkMap.Count
$mergedCount = 0
$conflictCount = 0
$errorCount = 0
$forksList = $forkMap.Keys | Sort-Object

Write-Host "Starting fork consolidation..." -ForegroundColor Green
Write-Host "Total forks to merge: $totalForks"
Write-Host ""

foreach ($fork in $forksList) {
    $mergedCount++
    $percent = [math]::Round(($mergedCount / $totalForks) * 100)
    $branchRef = $forkMap[$fork]
    
    Write-Host "[$percent`%] [$mergedCount/$totalForks] Merging $fork from $branchRef... " -NoNewline -ForegroundColor Cyan
    
    # Attempt merge WITHOUT conflict auto-resolution
    # This will leave conflicts for manual review
    $output = git merge "$branchRef" --no-edit 2>&1
    $exitCode = $LASTEXITCODE
    
    if ($exitCode -eq 0) {
        Write-Host "OK - Merged" -ForegroundColor Green
    } elseif ($exitCode -eq 1) {
        # Exit code 1 = conflicts
        $conflictFiles = git diff --name-only --diff-filter=U
        $conflictFileCount = ($conflictFiles | Measure-Object -Line).Lines
        
        Write-Host "CONFLICTS ($conflictFileCount files)" -ForegroundColor Yellow
        Write-Host ""
        Write-Host "Conflicted files:" -ForegroundColor Yellow
        $conflictFiles | ForEach-Object { Write-Host "  - $_" -ForegroundColor Yellow }
        Write-Host ""
        Write-Host "To resolve conflicts:" -ForegroundColor Yellow
        Write-Host "  1. Edit the conflicted files above" -ForegroundColor Yellow
        Write-Host "  2. Remove merge markers: <<<<<<<, =======, >>>>>>>" -ForegroundColor Yellow
        Write-Host "  3. Keep content from both sides if they do not contradict" -ForegroundColor Yellow
        Write-Host "  4. Run: git add -A" -ForegroundColor Yellow
        Write-Host "  5. Run: git commit -m 'Merge $fork'" -ForegroundColor Yellow
        Write-Host "  6. Run this script again to continue with next fork" -ForegroundColor Yellow
        Write-Host ""
        
        $conflictCount++
        Write-Host "Pausing merge process. Please resolve conflicts above." -ForegroundColor Red
        exit 1
    } else {
        Write-Host "ERROR" -ForegroundColor Red
        Write-Host "Output: $output" -ForegroundColor Red
        $errorCount++
    }
}

Write-Host ""
Write-Host "Merge consolidation complete!" -ForegroundColor Green
Write-Host "  Merged: $($totalForks - $errorCount)/$totalForks"
Write-Host "  Conflicts encountered: $conflictCount"
Write-Host "  Errors: $errorCount"
