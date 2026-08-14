param(
    [string]$SkillRoot = (Resolve-Path (Join-Path $PSScriptRoot "..")).Path
)

$ErrorActionPreference = "Stop"

$templatesRoot = Join-Path $SkillRoot "assets/templates"
$requiredTemplates = @(
    "ands-t-template.md",
    "adr-template.md",
    "gate-checklist.md",
    "track-decision-card.md",
    "agent-matrix-template.md",
    "lessons-template.md",
    "writeback-note-template.md",
    "30-day-pilot-template.md",
    "capability-matrix-template.md",
    "agent-model-adapter-card.md"
)

$missing = @()
foreach ($template in $requiredTemplates) {
    $templatePath = Join-Path $templatesRoot $template
    if (-not (Test-Path -LiteralPath $templatePath -PathType Leaf)) {
        $missing += $template
    }
}

if ($missing.Count -gt 0) {
    Write-Host "Missing required template files:"
    foreach ($template in $missing) {
        Write-Host " - $template"
    }
    exit 1
}

Write-Host "All required template files are present."
exit 0
