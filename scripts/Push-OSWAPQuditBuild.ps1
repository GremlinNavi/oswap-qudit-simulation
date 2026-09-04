[CmdletBinding()]
param(
    [switch]$Publish
)

Set-StrictMode -Version Latest
$ErrorActionPreference = 'Stop'

$RepoRoot = (Resolve-Path (Join-Path $PSScriptRoot '..')).Path
Push-Location $RepoRoot

try {
    if (-not (Test-Path '.git')) {
        throw 'This script must run from the OSWAP Qudit Simulation Git repository.'
    }

    $Branch = (git branch --show-current).Trim()
    if (-not $Branch) {
        throw 'Unable to resolve the current Git branch.'
    }

    $Commit = (git rev-parse HEAD).Trim()
    $Status = git status --porcelain

    if ($Status) {
        throw 'Working tree is not clean. Commit or stash changes before publication.'
    }

    $Targets = @('github', 'gitlab')
    $ResolvedTargets = @()

    foreach ($Target in $Targets) {
        $Url = (git remote get-url $Target 2>$null)
        if (-not $Url) {
            throw "Required remote '$Target' is not configured."
        }

        $ResolvedTargets += [pscustomobject]@{
            Name = $Target
            Url  = $Url.Trim()
        }
    }

    Write-Host ''
    Write-Host 'OSWAP Qudit Simulation publication preflight'
    Write-Host '-------------------------------------------'
    Write-Host "Branch : $Branch"
    Write-Host "Commit : $Commit"
    Write-Host 'Targets:'
    $ResolvedTargets | ForEach-Object { Write-Host "  $($_.Name) -> $($_.Url)" }
    Write-Host ''

    if (-not $Publish) {
        Write-Host 'Preflight only. No remote changes were made.'
        Write-Host 'Re-run with -Publish after reviewing the targets.'
        return
    }

    foreach ($Target in $Targets) {
        Write-Host "Publishing $Commit to $Target/$Branch ..."
        git push $Target "HEAD:$Branch"
        if ($LASTEXITCODE -ne 0) {
            throw "Push to '$Target' failed. Remaining targets were not force-updated."
        }
    }

    Write-Host 'Publication completed without force-push.'
}
finally {
    Pop-Location
}
