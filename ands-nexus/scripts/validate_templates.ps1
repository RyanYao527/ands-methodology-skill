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
    "agent-model-adapter-card.md",
    "guided-workflow-state-packet.md"
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

function Assert-FileContains {
    param(
        [Parameter(Mandatory = $true)][string]$Path,
        [Parameter(Mandatory = $true)][string[]]$ExpectedStrings
    )

    $text = Get-Content -Raw -Encoding UTF8 -LiteralPath $Path
    foreach ($expected in $ExpectedStrings) {
        if (-not $text.Contains($expected)) {
            throw "Template content assertion failed for $(Split-Path -Leaf $Path): missing '$expected'"
        }
    }
}

Assert-FileContains -Path (Join-Path $templatesRoot "ands-t-template.md") -ExpectedStrings @(
    "## Goal",
    "## Input",
    "## Constraint",
    "## Acceptance",
    "## Gate Requirement",
    "## Handoff Notes"
)

Assert-FileContains -Path (Join-Path $templatesRoot "gate-checklist.md") -ExpectedStrings @(
    "## Gate 1",
    "## Gate 2",
    "## Gate 3",
    "## Gate 4",
    "## Gate 5",
    "Acceptance"
)

Assert-FileContains -Path (Join-Path $templatesRoot "lessons-template.md") -ExpectedStrings @(
    "## Root Cause",
    "## Detection Gate",
    "## Prevention",
    "## Knowledge Domain",
    "## Follow-up Issue"
)

Assert-FileContains -Path (Join-Path $templatesRoot "guided-workflow-state-packet.md") -ExpectedStrings @(
    "workflow_id",
    "current_step",
    "active_role",
    "owner_response",
    "boundary_flags"
)

Write-Host "All required template files are present and core fields are intact."
exit 0
