# Resume fork consolidation with smart conflict resolution
# Wizden fork consolidation - continues from last successful merge

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

Write-Host "Starting fork consolidation with smart conflict resolution..." -ForegroundColor Green
Write-Host "Current branch: $(git rev-parse --abbrev-ref HEAD)"
Write-Host ""

$successCount = 0
$failCount = 0
$skippedCount = 0

foreach ($fork in $forks) {
    $progress = [math]::Round(($forks.IndexOf($fork) / $forks.Count * 100), 1)
    Write-Host "[$progress%] Merging $fork..." -ForegroundColor Yellow
    
    # Attempt merge with prefer-ours strategy
    git merge "$fork/master" --no-edit -X ours -q 2>$null
    $mergeExit = $LASTEXITCODE
    
    if ($mergeExit -eq 0) {
        Write-Host "Successfully merged $fork" -ForegroundColor Green
        $successCount++
    }
    elseif ($mergeExit -eq 1) {
        # Merge conflict occurred - resolve using ours for conflicted files
        Write-Host "Conflict in $fork - resolving with WizDen preference..." -ForegroundColor Cyan
        
        # Get list of conflicted files
        $conflicts = git diff --name-only --diff-filter=U
        
        if ($conflicts) {
            # For each conflicted file, prefer WizDen code
            $conflicts | ForEach-Object {
                # Check if file exists in our branch (wasn't deleted)
                $fileExists = (git ls-files -s | Select-String $_) -ne $null
                
                if ($fileExists) {
                    git checkout --ours $_ 2>$null
                } else {
                    # File was deleted in ours, so add the deletion
                    git rm $_ 2>$null
                }
            }
            
            # Complete the merge
            git add -A 2>$null
            git commit --no-edit -q 2>$null
            
            Write-Host "Merged $fork with conflict resolution" -ForegroundColor Green
            $successCount++
        } else {
            Write-Host "Merged $fork" -ForegroundColor Green
            $successCount++
        }
    } else {
        Write-Host "Error merging $fork" -ForegroundColor Red
        $failCount++
        # Abort the failed merge and continue
        git merge --abort 2>$null
    }
}

Write-Host ""
Write-Host "====== Consolidation Summary ======" -ForegroundColor Cyan
Write-Host "Successfully merged: $successCount forks" -ForegroundColor Green
Write-Host "Failed merges: $failCount forks" -ForegroundColor Red
Write-Host "====================================="
Write-Host ""
Write-Host "Current branch status:"
git status --short | Select-Object -First 20
Write-Host ""
Write-Host "Total changes:"
git diff --stat master | Select-Object -Last 5
