[CmdletBinding()]
param(
    [Parameter(Position = 0)][string]$ProjectPath,
    [Parameter(Position = 1)][string]$Ide,
    [Parameter(Position = 2, ValueFromRemainingArguments = $true)][string[]]$Skills,
    [switch]$Yes
)

$ErrorActionPreference = 'Stop'
$ideOptions = [ordered]@{
    'antigravity'    = @{ Label = 'Antigravity';    Path = '.agents\skills' }
    'codex'          = @{ Label = 'Codex';          Path = '.agents\skills' }
    'cursor'         = @{ Label = 'Cursor';         Path = '.agents\skills' }
    'gemini-cli'     = @{ Label = 'Gemini CLI';     Path = '.agents\skills' }
    'github-copilot' = @{ Label = 'GitHub Copilot'; Path = '.agents\skills' }
    'claude-code'    = @{ Label = 'Claude Code';    Path = '.claude\skills' }
    'kiro'           = @{ Label = 'Kiro';           Path = '.kiro\skills' }
    'windsurf'       = @{ Label = 'Windsurf';       Path = '.windsurf\skills' }
    'custom'         = @{ Label = 'Custom path';    Path = $null }
}

function Select-Ide {
    Write-Host 'Select AI IDE:'
    $keys = @($ideOptions.Keys)
    for ($i = 0; $i -lt $keys.Count; $i++) {
        $item = $ideOptions[$keys[$i]]
        $path = if ($item.Path) { " -> $($item.Path)" } else { '' }
        Write-Host "  $($i + 1). $($item.Label)$path"
    }
    $answer = Read-Host 'IDE number or name'
    if ($answer -match '^\d+$' -and [int]$answer -ge 1 -and [int]$answer -le $keys.Count) {
        return $keys[[int]$answer - 1]
    }
    return $answer.Trim().ToLowerInvariant()
}

function Resolve-Skills([object[]]$Available, [string[]]$Requested) {
    if (-not $Requested -or $Requested.Count -eq 0) {
        Write-Host 'Available skills:'
        for ($i = 0; $i -lt $Available.Count; $i++) { Write-Host "  $($i + 1). $($Available[$i].Name)" }
        $answer = Read-Host "Enter all, skill names, or numbers (comma/space separated)"
        if ([string]::IsNullOrWhiteSpace($answer)) { $answer = 'all' }
        $Requested = @($answer -split '[,\s]+' | Where-Object { $_ })
    }
    if ($Requested -contains '*' -or $Requested -contains 'all') { return @($Available) }

    $names = [System.Collections.Generic.List[string]]::new()
    foreach ($item in $Requested) {
        if ($item -match '^\d+$' -and [int]$item -ge 1 -and [int]$item -le $Available.Count) {
            $names.Add($Available[[int]$item - 1].Name)
        } else {
            $names.Add($item)
        }
    }
    $unique = @($names | Select-Object -Unique)
    $missing = @($unique | Where-Object { $_ -notin $Available.Name })
    if ($missing.Count) { throw "Unknown skill(s): $($missing -join ', ')" }
    return @($Available | Where-Object { $_.Name -in $unique })
}

if ([string]::IsNullOrWhiteSpace($ProjectPath)) { $ProjectPath = Read-Host 'Project path' }
if ([string]::IsNullOrWhiteSpace($ProjectPath)) { throw 'Project path is required.' }
$projectRoot = [System.IO.Path]::GetFullPath($ProjectPath)
if (-not (Test-Path -LiteralPath $projectRoot -PathType Container)) { throw "Project directory does not exist: $projectRoot" }

if ([string]::IsNullOrWhiteSpace($Ide)) { $Ide = Select-Ide }
$Ide = $Ide.Trim().ToLowerInvariant()
if (-not $ideOptions.Contains($Ide)) { throw "Unknown IDE: $Ide" }

$relativePath = $ideOptions[$Ide].Path
if ($Ide -eq 'custom') {
    $relativePath = Read-Host 'Skills directory relative to project root'
    if ([string]::IsNullOrWhiteSpace($relativePath)) { throw 'Custom skills directory is required.' }
    if ([System.IO.Path]::IsPathRooted($relativePath)) { throw 'Custom path must be relative to the project root.' }
}

$repoRoot = Split-Path -Parent $PSScriptRoot
$available = @(Get-ChildItem -LiteralPath $repoRoot -Directory | Where-Object {
    Test-Path -LiteralPath (Join-Path $_.FullName 'SKILL.md') -PathType Leaf
} | Sort-Object Name)
$selected = @(Resolve-Skills $available $Skills)
if ($selected.Count -eq 0) { throw 'Select at least one skill.' }
$destinationRoot = [System.IO.Path]::GetFullPath((Join-Path $projectRoot $relativePath))
$projectPrefix = $projectRoot.TrimEnd([char[]]@('\', '/')) + [System.IO.Path]::DirectorySeparatorChar
if (-not $destinationRoot.StartsWith($projectPrefix, [System.StringComparison]::OrdinalIgnoreCase)) {
    throw 'Resolved destination is outside the project root.'
}

Write-Host ''
Write-Host "IDE:         $($ideOptions[$Ide].Label)"
Write-Host "Project:     $projectRoot"
Write-Host "Destination: $destinationRoot"
Write-Host "Skills:      $($selected.Name -join ', ')"
if (-not $Yes) {
    $confirm = Read-Host 'Install? [y/N]'
    if ($confirm -notmatch '^(y|yes)$') { Write-Host 'Cancelled.'; exit 0 }
}

New-Item -ItemType Directory -Force -Path $destinationRoot | Out-Null
foreach ($skill in $selected) {
    $destination = Join-Path $destinationRoot $skill.Name
    New-Item -ItemType Directory -Force -Path $destination | Out-Null
    Get-ChildItem -LiteralPath $skill.FullName -Force | ForEach-Object {
        Copy-Item -LiteralPath $_.FullName -Destination $destination -Recurse -Force
    }
    Write-Host "Installed: $($skill.Name)"
}
Write-Host "Installed $($selected.Count) skill(s) to $destinationRoot"
