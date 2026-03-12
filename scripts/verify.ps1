[CmdletBinding()]
param()

Set-StrictMode -Version Latest
$ErrorActionPreference = "Stop"

function Add-Result {
    param(
        [System.Collections.Generic.List[string]]$Bucket,
        [string]$Message
    )

    $Bucket.Add($Message) | Out-Null
}

function Test-FileContains {
    param(
        [string]$Path,
        [string[]]$Needles
    )

    $content = Get-Content -Path $Path -Raw
    foreach ($needle in $Needles) {
        if ($content.IndexOf($needle) -lt 0) {
            return $false
        }
    }

    return $true
}

$repoRoot = Split-Path $PSScriptRoot -Parent
$requiredFiles = @(
    "README.md",
    "CHANGELOG.md",
    "docs\brief.md",
    "docs\architecture.md",
    "docs\tasks.md",
    "docs\decisions.md",
    "docs\operating-rules.md",
    "scripts\checkpoint.ps1",
    "scripts\verify.ps1"
)

$failures = [System.Collections.Generic.List[string]]::new()
$passes = [System.Collections.Generic.List[string]]::new()

foreach ($relativePath in $requiredFiles) {
    $fullPath = Join-Path $repoRoot $relativePath
    if (Test-Path $fullPath) {
        Add-Result -Bucket $passes -Message "found $relativePath"
    }
    else {
        Add-Result -Bucket $failures -Message "missing required file: $relativePath"
    }
}

$readmePath = Join-Path $repoRoot "README.md"
$changelogPath = Join-Path $repoRoot "CHANGELOG.md"
$tasksPath = Join-Path $repoRoot "docs\tasks.md"

if (Test-Path $readmePath) {
    if (Test-FileContains -Path $readmePath -Needles @("<!-- STATUS:START -->", "<!-- STATUS:END -->", "<!-- VERIFY:START -->", "<!-- VERIFY:END -->")) {
        Add-Result -Bucket $passes -Message "README markers are present"
    }
    else {
        Add-Result -Bucket $failures -Message "README is missing one or more required marker blocks"
    }
}

if (Test-Path $changelogPath) {
    if (Test-FileContains -Path $changelogPath -Needles @("<!-- CHECKPOINTS:START -->", "<!-- CHECKPOINTS:END -->")) {
        Add-Result -Bucket $passes -Message "CHANGELOG markers are present"
    }
    else {
        Add-Result -Bucket $failures -Message "CHANGELOG is missing one or more checkpoint markers"
    }
}

if (Test-Path $tasksPath) {
    if (Test-FileContains -Path $tasksPath -Needles @("## Now", "## Next", "## Later", "## Done")) {
        Add-Result -Bucket $passes -Message "tasks queue sections are present"
    }
    else {
        Add-Result -Bucket $failures -Message "docs/tasks.md is missing one or more required sections"
    }
}

$scriptFiles = Get-ChildItem -Path (Join-Path $repoRoot "scripts") -Filter *.ps1 -File
foreach ($script in $scriptFiles) {
    $tokens = $null
    $errors = $null
    [System.Management.Automation.Language.Parser]::ParseFile($script.FullName, [ref]$tokens, [ref]$errors) | Out-Null

    if ($errors -and $errors.Count -gt 0) {
        foreach ($error in $errors) {
            Add-Result -Bucket $failures -Message "parse error in $($script.Name): $($error.Message)"
        }
    }
    else {
        Add-Result -Bucket $passes -Message "parsed $($script.Name)"
    }
}

Write-Host "Verification summary"
foreach ($pass in $passes) {
    Write-Host "[pass] $pass"
}

if ($failures.Count -gt 0) {
    foreach ($failure in $failures) {
        Write-Host "[fail] $failure"
    }

    throw "Repository verification failed with $($failures.Count) issue(s)."
}

Write-Host "Repository contract is valid."
