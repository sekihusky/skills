[CmdletBinding()] param()
$ErrorActionPreference = 'Stop'
$skillsRoot = Split-Path -Parent $PSScriptRoot
$errors = [System.Collections.Generic.List[string]]::new(); $count = 0

Get-ChildItem -LiteralPath $skillsRoot -Directory | Where-Object {
    Test-Path -LiteralPath (Join-Path $_.FullName 'SKILL.md') -PathType Leaf
} | ForEach-Object {
    $count++; $name = $_.Name; $file = Join-Path $_.FullName 'SKILL.md'
    if ($name -notmatch '^[a-z0-9]+(?:-[a-z0-9]+)*$') { $errors.Add("$name`: invalid directory name") }
    if (-not (Test-Path -LiteralPath $file -PathType Leaf)) { $errors.Add("$name`: missing SKILL.md"); return }
    $content = Get-Content -LiteralPath $file -Raw
    if ($content -notmatch '(?s)^---\r?\nname:\s*([^\r\n]+)\r?\ndescription:\s*([^\r\n]+)\r?\n---') {
        $errors.Add("$name`: invalid frontmatter; require name then description only"); return
    }
    if ($Matches[1].Trim() -ne $name) { $errors.Add("$name`: frontmatter name does not match directory") }
    if ($Matches[2].Trim().Length -lt 40) { $errors.Add("$name`: description is too short") }
    if ($content -match 'TODO|\[TODO') { $errors.Add("$name`: contains TODO placeholder") }
    if (-not (Test-Path -LiteralPath (Join-Path $_.FullName 'agents\openai.yaml') -PathType Leaf)) {
        $errors.Add("$name`: missing agents/openai.yaml")
    }
}
if ($errors.Count -gt 0) { $errors | ForEach-Object { Write-Error $_ }; exit 1 }
Write-Host "Validated $count skills successfully."
