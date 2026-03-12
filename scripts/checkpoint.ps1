[CmdletBinding()]
param(
    [Parameter(Mandatory = $true)]
    [ValidateSet("init", "docs", "plan", "feat", "fix", "refactor", "release", "chore")]
    [string]$Type,

    [Parameter(Mandatory = $true)]
    [string]$Summary,

    [Parameter(Mandatory = $true)]
    [string]$Next,

    [string]$Focus,

    [switch]$Commit,

    [switch]$CreateTag
)

Set-StrictMode -Version Latest
$ErrorActionPreference = "Stop"

function Get-MarkedBlock {
    param(
        [string]$Path,
        [string]$StartMarker,
        [string]$EndMarker
    )

    $content = Get-Content -Path $Path -Raw
    $startIndex = $content.IndexOf($StartMarker)
    if ($startIndex -lt 0) {
        throw "Missing marker '$StartMarker' in $Path"
    }

    $endIndex = $content.IndexOf($EndMarker, $startIndex + $StartMarker.Length)
    if ($endIndex -lt 0) {
        throw "Missing marker '$EndMarker' in $Path"
    }

    $blockStart = $startIndex + $StartMarker.Length
    return $content.Substring($blockStart, $endIndex - $blockStart)
}

function Set-MarkedBlock {
    param(
        [string]$Path,
        [string]$StartMarker,
        [string]$EndMarker,
        [string[]]$Lines
    )

    $content = Get-Content -Path $Path -Raw
    $startIndex = $content.IndexOf($StartMarker)
    if ($startIndex -lt 0) {
        throw "Missing marker '$StartMarker' in $Path"
    }

    $endIndex = $content.IndexOf($EndMarker, $startIndex + $StartMarker.Length)
    if ($endIndex -lt 0) {
        throw "Missing marker '$EndMarker' in $Path"
    }

    $before = $content.Substring(0, $startIndex + $StartMarker.Length)
    $after = $content.Substring($endIndex)
    $replacement = "`r`n" + ($Lines -join "`r`n") + "`r`n"
    [System.IO.File]::WriteAllText($Path, $before + $replacement + $after)
}

function Get-GitExecutable {
    $command = Get-Command git -ErrorAction SilentlyContinue
    if ($command) {
        return $command.Source
    }

    $candidates = @(
        "C:\Program Files\Git\cmd\git.exe",
        "C:\Program Files\Git\bin\git.exe",
        "C:\Program Files (x86)\Git\cmd\git.exe",
        "C:\Program Files (x86)\Git\bin\git.exe"
    )

    foreach ($candidate in $candidates) {
        if (Test-Path $candidate) {
            return $candidate
        }
    }

    return $null
}

function ConvertTo-Slug {
    param([string]$Value)

    $normalized = $Value.ToLowerInvariant()
    $normalized = [regex]::Replace($normalized, "[^a-z0-9]+", "-")
    $normalized = $normalized.Trim("-")

    if ([string]::IsNullOrWhiteSpace($normalized)) {
        return "checkpoint"
    }

    if ($normalized.Length -gt 32) {
        return $normalized.Substring(0, 32).Trim("-")
    }

    return $normalized
}

function Get-NextCheckpointTag {
    param(
        [string]$GitExe,
        [string]$RepoRoot,
        [string]$Type,
        [string]$Summary
    )

    $tags = (& $GitExe -C $RepoRoot tag --list "cp-*")
    $numbers = foreach ($tag in $tags) {
        if ($tag -match "^cp-(\d+)-") {
            [int]$matches[1]
        }
    }

    $nextNumber = if ($numbers) { (($numbers | Measure-Object -Maximum).Maximum + 1) } else { 1 }
    $slug = ConvertTo-Slug -Value $Summary
    return ("cp-{0:D2}-{1}-{2}" -f $nextNumber, $Type, $slug)
}

$repoRoot = Split-Path $PSScriptRoot -Parent
$readmePath = Join-Path $repoRoot "README.md"
$changelogPath = Join-Path $repoRoot "CHANGELOG.md"
$focusText = if ([string]::IsNullOrWhiteSpace($Focus)) { $Summary.Trim() } else { $Focus.Trim() }
$summaryText = $Summary.Trim()
$nextText = $Next.Trim()
$timestamp = Get-Date -Format "yyyy-MM-dd HH:mm"
$commitMessage = "${Type}: $summaryText"

$statusLines = @(
    "- Current stage: $Type",
    "- Current focus: $focusText",
    "- Last checkpoint: $timestamp | $commitMessage",
    "- Next action: $nextText"
)

Set-MarkedBlock -Path $readmePath -StartMarker "<!-- STATUS:START -->" -EndMarker "<!-- STATUS:END -->" -Lines $statusLines

$existingEntries = (Get-MarkedBlock -Path $changelogPath -StartMarker "<!-- CHECKPOINTS:START -->" -EndMarker "<!-- CHECKPOINTS:END -->").Trim()
$entryLines = @("- $timestamp | $Type | $summaryText | next: $nextText")

if (-not [string]::IsNullOrWhiteSpace($existingEntries)) {
    $entryLines += ($existingEntries -split "(`r`n|`n|`r)" | Where-Object { -not [string]::IsNullOrWhiteSpace($_) })
}

Set-MarkedBlock -Path $changelogPath -StartMarker "<!-- CHECKPOINTS:START -->" -EndMarker "<!-- CHECKPOINTS:END -->" -Lines $entryLines

Write-Host "Updated README.md and CHANGELOG.md"
Write-Host "Reminder: make sure docs/tasks.md reflects what moved before you commit."

if (-not $Commit) {
    Write-Host "Suggested commit message: $commitMessage"
    return
}

$gitExe = Get-GitExecutable
if (-not $gitExe) {
    throw "Git CLI was not found. The docs were updated, but no commit was created."
}

if (-not (Test-Path (Join-Path $repoRoot ".git"))) {
    throw "This folder is not a Git repository: $repoRoot"
}

& $gitExe -C $repoRoot add -A
& $gitExe -C $repoRoot commit -m $commitMessage

if ($CreateTag) {
    $tagName = Get-NextCheckpointTag -GitExe $gitExe -RepoRoot $repoRoot -Type $Type -Summary $summaryText
    & $gitExe -C $repoRoot tag $tagName
    Write-Host "Created checkpoint tag: $tagName"
}
