# Final fork consolidation - merge all 28 forks into EVERYTHING branch
# This will merge each fork sequentially with WizDen code taking precedence on conflicts

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

Write-Host "Starting final fork consolidation..." -ForegroundColor Green
Write-Host "Target: EVERYTHING branch with WizDen preference on conflicts"
Write-Host "Total forks to merge: $($forks.Count)" -ForegroundColor Yellow
Write-Host ""

$successCount = 0
$failCount = 0
$merged_list = @()

for ($i = 0; $i -lt $forks.Count; $i++) {
    $fork = $forks[$i]
    $percent = [math]::Round(($i / $forks.Count * 100), 1)
    $remaining = $forks.Count - $i
    
    Write-Host "[$percent%] [$i/$($forks.Count)] Merging $fork... " -NoNewline -ForegroundColor Cyan
    
    try {
        # Attempt merge with prefer-ours strategy
        $output = git merge "$fork/master" --no-edit -X ours -q 2>&1
        $exit_code = $LASTEXITCODE
        
        if ($exit_code -eq 0) {
            Write-Host "OK" -ForegroundColor Green
            $successCount++
            $merged_list += $fork
        }
        else {
            # Get conflicted files
            $conflicts = git diff --name-only --diff-filter=U
            $conflict_count = ($conflicts | Measure-Object -Line).Lines
            
            Write-Host "CONFLICT ($conflict_count files)" -ForegroundColor Yellow
            
            if ($conflicts) {
                # Resolve all conflicts using ours
                $conflicts | ForEach-Object {
                    git checkout --ours $_ -q 2>$null
                }
                
                git add -A -q 2>$null
                git commit --no-edit -q 2>$null
                
                Write-Host "  -> Resolved with WizDen preference" -ForegroundColor Green
                $successCount++
                $merged_list += $fork
            }
            else {
                Write-Host "  -> Completed" -ForegroundColor Green
                $successCount++
                $merged_list += $fork
            }
        }
    }
    catch {
        Write-Host "ERROR" -ForegroundColor Red
        Write-Host "  Exception: $_" -ForegroundColor Red
        $failCount++
        git merge --abort 2>$null
    }
}

Write-Host ""
Write-Host "======================================" -ForegroundColor Cyan
Write-Host "Consolidation Complete!" -ForegroundColor Green
Write-Host "Successfully merged: $successCount / $($forks.Count)" -ForegroundColor Green
if ($failCount -gt 0) {
    Write-Host "Failed: $failCount" -ForegroundColor Red
}
Write-Host "======================================" -ForegroundColor Cyan
Write-Host ""

if ($successCount -gt 0) {
    Write-Host "Merged forks:" -ForegroundColor Yellow
    $merged_list | ForEach-Object { Write-Host "  - $_" -ForegroundColor Green }
}

Write-Host ""
Write-Host "Checking final state:" -ForegroundColor Cyan
Write-Host ""
Write-Host "Current branch: $(git rev-parse --abbrev-ref HEAD)" -ForegroundColor Yellow
Write-Host ""
Write-Host "Statistics:"
$stat = git diff --stat master EVERYTHING | Select-Object -Last 1
Write-Host $stat -ForegroundColor Yellow
Write-Host ""
Write-Host "Total commits ahead of master:"
$ahead = git rev-list --count master..EVERYTHING
Write-Host "$ahead commits" -ForegroundColor Cyan
