$ErrorActionPreference = "Stop"

$scriptDir = Split-Path -Parent $MyInvocation.MyCommand.Path
$validator = Join-Path $scriptDir "validate_release.ps1"
$repoRoot = (Resolve-Path (Join-Path $scriptDir "../..")).Path

if (-not (Test-Path -LiteralPath $validator)) {
    throw "Missing release validator script: $validator"
}

function Assert-Contains {
    param(
        [Parameter(Mandatory = $true)][string]$Text,
        [Parameter(Mandatory = $true)][string]$Expected
    )

    if (-not $Text.Contains($Expected)) {
        throw "Expected output to contain: $Expected"
    }
}

function Assert-NotContains {
    param(
        [Parameter(Mandatory = $true)][string]$Text,
        [Parameter(Mandatory = $true)][string]$Unexpected
    )

    if ($Text.Contains($Unexpected)) {
        throw "Expected output not to contain: $Unexpected"
    }
}

function Assert-Fails {
    param(
        [Parameter(Mandatory = $true)][scriptblock]$Block,
        [Parameter(Mandatory = $true)][string]$ExpectedMessage
    )

    try {
        & $Block
    }
    catch {
        $message = $_.Exception.Message
        if (-not $message.Contains($ExpectedMessage)) {
            throw "Expected failure message to contain '$ExpectedMessage', got: $message"
        }
        return
    }

    throw "Expected command to fail with: $ExpectedMessage"
}

function New-ReleaseValidationRepoFixture {
    param([string]$NamePrefix = "ands-release-validation-fixture")

    $fixtureRoot = Join-Path ([System.IO.Path]::GetTempPath()) ("{0}-{1}" -f $NamePrefix, [guid]::NewGuid().ToString("N"))
    New-Item -ItemType Directory -Path (Join-Path $fixtureRoot "examples") -Force | Out-Null
    New-Item -ItemType Directory -Path (Join-Path $fixtureRoot "ands-nexus/scripts") -Force | Out-Null
    Set-Content -LiteralPath (Join-Path $fixtureRoot "README.md") -Encoding UTF8 -Value @'
# Fixture

https://github.com/RyanYao527/ands-nexus

If you are not using Codex
macOS/Linux
brew install powershell ripgrep
quick_validate.py is external
'@
    Set-Content -LiteralPath (Join-Path $fixtureRoot "START-HERE.md") -Encoding UTF8 -Value @'
# Fixture

Guided Workflow First Run
examples/first-run-prompt-packet-v0.3.1.md
examples/guided-workflow-first-run-v0.4.md
Compact First Run
If you are not using Codex
Core Terms
If a guided answer misses one of the six sections
use a fictional task because this package rehearses the process; it does not connect to your systems
'@
    Set-Content -LiteralPath (Join-Path $fixtureRoot "RELEASE_NOTES.md") -Encoding UTF8 -Value "# Fixture"
    Set-Content -LiteralPath (Join-Path $fixtureRoot "PUBLISHING_CHECKLIST.md") -Encoding UTF8 -Value "# Fixture"

    $requiredExampleFiles = @(
        "INDEX.md",
        "agent-model-adaptation-forward-test-v0.2.2.md",
        "ands-t-task-example.md",
        "demo-trace-guide-example.md",
        "desensitization-notes.md",
        "first-run-prompt-packet-v0.3.1.md",
        "forward-test-scenarios-v0.2.md",
        "gate-checklist-example.md",
        "guided-workflow-first-run-v0.4.md",
        "guided-workflow-regression-v0.4.md",
        "lessons-writeback-example.md",
        "management-rollout-plan.md",
        "post-release-feedback-intake-v0.2.1.md",
        "post-release-feedback-intake-v0.3.1.md",
        "provider-profile-cards-v0.2.2.md",
        "provider-profile-cards-v0.3-internal.md",
        "provider-profile-offline-adoption-packet-v0.3.md",
        "role-routing-regression-scenarios-v0.3.1.md",
        "seed-user-feedback-intake-v0.2.md",
        "seed-user-prompts.md"
    )
    foreach ($exampleFile in $requiredExampleFiles) {
        Set-Content -LiteralPath (Join-Path $fixtureRoot "examples/$exampleFile") -Encoding UTF8 -Value "# Fixture"
    }

    Set-Content -LiteralPath (Join-Path $fixtureRoot "examples/INDEX.md") -Encoding UTF8 -Value @'
# Fixture

post-release-feedback-intake-v0.3.1.md
role-routing-regression-scenarios-v0.3.1.md
guided-workflow-first-run-v0.4.md
guided-workflow-regression-v0.4.md
Installable routed examples are also copied under `ands-nexus/examples/`
'@

    Set-Content -LiteralPath (Join-Path $fixtureRoot "examples/guided-workflow-first-run-v0.4.md") -Encoding UTF8 -Value @'
# Fixture

## Current Artifact
## State Packet
## Gate / Evidence Check
## Owner Decision
## Next Prompt
## Boundary Reminder
- owner_decision: Confirm Standard Track and provide missing evidence
- boundary_flags: Non-Scope: no provider-native validation, no API integration, no credential setup, no tenant connectors, no unattended or automated writeback, no benchmark ranking
- active_role: Validation + Governance
| `active_role` | Validation + Governance |
Gate 2 test evidence; Gate 3 owner acceptance; human review before reuse
do not authorize broader writeback from this prompt
confirmation that no broader writeback is authorized by this prompt
Status legend
Replace `owner_response` with the human owner's actual reply before sending each Step Prompt.
- owner_response: [confirm/revise/escalate/stop before continuing]
- owner_response: <owner reply: confirm/revise/escalate/stop: ...>
'@
    Set-Content -LiteralPath (Join-Path $fixtureRoot "examples/guided-workflow-regression-v0.4.md") -Encoding UTF8 -Value @'
# Fixture

role drift
skipped Gate evidence
missing owner decision
writeback overreach
Enterprise escalation
'@

    return $fixtureRoot
}

function Assert-PublicScanFails {
    param(
        [Parameter(Mandatory = $true)][string]$NamePrefix,
        [Parameter(Mandatory = $true)][string]$ExpectedMessage,
        [Parameter(Mandatory = $true)][scriptblock]$Arrange
    )

    $scanFixtureRoot = New-ReleaseValidationRepoFixture -NamePrefix $NamePrefix
    try {
        & $Arrange $scanFixtureRoot
        Assert-Fails -ExpectedMessage $ExpectedMessage -Block {
            & $validator -SkipWritebackTest -RepoRoot $scanFixtureRoot *>&1 | Out-String | Out-Null
        }
    }
    finally {
        if (Test-Path -LiteralPath $scanFixtureRoot) {
            Remove-Item -LiteralPath $scanFixtureRoot -Recurse -Force
        }
    }
}

$output = & $validator -SkipWritebackTest *>&1 | Out-String

Assert-Contains -Text $output -Expected "PASS validate_templates"
Assert-Contains -Text $output -Expected "SKIP quick_validate (no -QuickValidatePath; external Codex skill-creator tool not in repo)"
Assert-Contains -Text $output -Expected "PASS asset_counts"
Assert-Contains -Text $output -Expected "PASS public_package_scan"
Assert-Contains -Text $output -Expected "PASS validate_release"

$missingRequiredExampleRoot = Join-Path ([System.IO.Path]::GetTempPath()) ("ands-release-manifest-fixture-{0}" -f [guid]::NewGuid().ToString("N"))
try {
    New-Item -ItemType Directory -Path (Join-Path $missingRequiredExampleRoot "examples") -Force | Out-Null
    New-Item -ItemType Directory -Path (Join-Path $missingRequiredExampleRoot "ands-nexus") -Force | Out-Null
    Set-Content -LiteralPath (Join-Path $missingRequiredExampleRoot "README.md") -Encoding UTF8 -Value "# Fixture"
    Set-Content -LiteralPath (Join-Path $missingRequiredExampleRoot "START-HERE.md") -Encoding UTF8 -Value "# Fixture"
    Set-Content -LiteralPath (Join-Path $missingRequiredExampleRoot "RELEASE_NOTES.md") -Encoding UTF8 -Value "# Fixture"
    Set-Content -LiteralPath (Join-Path $missingRequiredExampleRoot "PUBLISHING_CHECKLIST.md") -Encoding UTF8 -Value "# Fixture"

    $manifestExampleFiles = @(
        "INDEX.md",
        "agent-model-adaptation-forward-test-v0.2.2.md",
        "ands-t-task-example.md",
        "demo-trace-guide-example.md",
        "desensitization-notes.md",
        "first-run-prompt-packet-v0.3.1.md",
        "forward-test-scenarios-v0.2.md",
        "gate-checklist-example.md",
        "guided-workflow-first-run-v0.4.md",
        "guided-workflow-regression-v0.4.md",
        "lessons-writeback-example.md",
        "management-rollout-plan.md",
        "post-release-feedback-intake-v0.2.1.md",
        "post-release-feedback-intake-v0.3.1.md",
        "provider-profile-cards-v0.2.2.md",
        "provider-profile-offline-adoption-packet-v0.3.md",
        "release-manifest-placeholder.md",
        "role-routing-regression-scenarios-v0.3.1.md",
        "seed-user-feedback-intake-v0.2.md",
        "seed-user-prompts.md"
    )
    foreach ($exampleFile in $manifestExampleFiles) {
        Set-Content -LiteralPath (Join-Path $missingRequiredExampleRoot "examples/$exampleFile") -Encoding UTF8 -Value "# Fixture"
    }

    Assert-Fails -ExpectedMessage "Missing required example file: provider-profile-cards-v0.3-internal.md" -Block {
        & $validator -SkipWritebackTest -RepoRoot $missingRequiredExampleRoot *>&1 | Out-String | Out-Null
    }
}
finally {
    if (Test-Path -LiteralPath $missingRequiredExampleRoot) {
        Remove-Item -LiteralPath $missingRequiredExampleRoot -Recurse -Force
    }
}

$providerProfiles = Get-Content -Raw -Encoding UTF8 -LiteralPath (Join-Path $repoRoot "examples/provider-profile-cards-v0.2.2.md")
$requiredProviders = @(
    "Codex/OpenAI baseline",
    "KIMI",
    "GLM",
    "MiniMax",
    "Claude",
    "DeepSeek",
    "WorkBuddy"
)
foreach ($provider in $requiredProviders) {
    Assert-Contains -Text $providerProfiles -Expected $provider
}

$forwardTestSuite = Get-Content -Raw -Encoding UTF8 -LiteralPath (Join-Path $repoRoot "examples/agent-model-adaptation-forward-test-v0.2.2.md")
$adapterCard = Get-Content -Raw -Encoding UTF8 -LiteralPath (Join-Path $repoRoot "ands-nexus/assets/templates/agent-model-adapter-card.md")
$adaptationReference = Get-Content -Raw -Encoding UTF8 -LiteralPath (Join-Path $repoRoot "ands-nexus/references/multi-agent-model-adaptation.md")

Assert-Contains -Text $forwardTestSuite -Expected "Execution boundary: return only the requested documentation deliverable, assumptions, evidence, and handoff notes."
Assert-Contains -Text $forwardTestSuite -Expected "Validation boundary: map every Gate Checklist item to status, evidence, missing evidence, and requested fix."
Assert-Contains -Text $forwardTestSuite -Expected "Writeback boundary: produce candidate-only Lessons and reusable-rule candidates. Draft generation to an explicit path is allowed only when explicitly requested in an authorized local/project context."

Assert-Contains -Text $adapterCard -Expected "Before answering, restate the active role, active Gate, non-goals, and forbidden expansions."
Assert-Contains -Text $adapterCard -Expected "For Validation Agent work, map every Gate Checklist item to status, evidence, missing evidence, and requested fix."
Assert-Contains -Text $adapterCard -Expected "For Writeback Agent work, return candidate-only Lessons and reusable-rule candidates. Do not persist unless the human explicitly requested draft generation to a specific allowed path in the current project context; never perform unattended persistence, Vault scans, GitHub sync, provider workspace writes, or enterprise-system updates."

Assert-Contains -Text $adaptationReference -Expected "Execution boundary: produce only the requested deliverable, assumptions, evidence, caveats, and handoff notes."
Assert-Contains -Text $adaptationReference -Expected "Validation boundary: itemize every Gate Checklist row with status, evidence, missing evidence, and requested fix."
Assert-Contains -Text $adaptationReference -Expected "Writeback boundary: produce candidate-only Lessons and reusable-rule candidates. If a human explicitly requests draft generation to a specific local path, keep it project-local and explicit-path only; do not scan or bulk-modify knowledge bases, sync GitHub, write provider workspaces, or update enterprise systems."

$startHere = Get-Content -Raw -Encoding UTF8 -LiteralPath (Join-Path $repoRoot "START-HERE.md")
$examplesIndex = Get-Content -Raw -Encoding UTF8 -LiteralPath (Join-Path $repoRoot "examples/INDEX.md")
$skillDefinition = Get-Content -Raw -Encoding UTF8 -LiteralPath (Join-Path $repoRoot "ands-nexus/SKILL.md")
$firstRunPacket = Get-Content -Raw -Encoding UTF8 -LiteralPath (Join-Path $repoRoot "examples/first-run-prompt-packet-v0.3.1.md")
$postReleaseFeedback = Get-Content -Raw -Encoding UTF8 -LiteralPath (Join-Path $repoRoot "examples/post-release-feedback-intake-v0.3.1.md")
$roleRoutingRegression = Get-Content -Raw -Encoding UTF8 -LiteralPath (Join-Path $repoRoot "examples/role-routing-regression-scenarios-v0.3.1.md")
$guidedReference = Get-Content -Raw -Encoding UTF8 -LiteralPath (Join-Path $repoRoot "ands-nexus/references/guided-workflow-mvp.md")
$glossaryReferencePath = Join-Path $repoRoot "ands-nexus/references/glossary.md"
$guidedStatePacket = Get-Content -Raw -Encoding UTF8 -LiteralPath (Join-Path $repoRoot "ands-nexus/assets/templates/guided-workflow-state-packet.md")
$guidedFirstRun = Get-Content -Raw -Encoding UTF8 -LiteralPath (Join-Path $repoRoot "examples/guided-workflow-first-run-v0.4.md")
$guidedRegression = Get-Content -Raw -Encoding UTF8 -LiteralPath (Join-Path $repoRoot "examples/guided-workflow-regression-v0.4.md")
$gateChecklist = Get-Content -Raw -Encoding UTF8 -LiteralPath (Join-Path $repoRoot "ands-nexus/assets/templates/gate-checklist.md")
$trackDecisionCard = Get-Content -Raw -Encoding UTF8 -LiteralPath (Join-Path $repoRoot "ands-nexus/assets/templates/track-decision-card.md")

if (-not (Test-Path -LiteralPath $glossaryReferencePath -PathType Leaf)) {
    throw "Missing v0.4.1 glossary reference: $glossaryReferencePath"
}
$glossaryReference = Get-Content -Raw -Encoding UTF8 -LiteralPath $glossaryReferencePath

Assert-Contains -Text $startHere -Expected "Guided Workflow First Run"
Assert-Contains -Text $startHere -Expected "examples/first-run-prompt-packet-v0.3.1.md"
Assert-Contains -Text $startHere -Expected "examples/guided-workflow-first-run-v0.4.md"
Assert-Contains -Text $startHere -Expected "Compact First Run"
Assert-Contains -Text $startHere -Expected "If you are not using Codex"
Assert-Contains -Text $startHere -Expected "Core Terms"
Assert-Contains -Text $startHere -Expected "If a guided answer misses one of the six sections"
Assert-Contains -Text $startHere -Expected "use a fictional task because this package rehearses the process; it does not connect to your systems"
Assert-Contains -Text $examplesIndex -Expected "post-release-feedback-intake-v0.3.1.md"
Assert-Contains -Text $examplesIndex -Expected "role-routing-regression-scenarios-v0.3.1.md"
Assert-Contains -Text $examplesIndex -Expected "guided-workflow-first-run-v0.4.md"
Assert-Contains -Text $examplesIndex -Expected "guided-workflow-regression-v0.4.md"
Assert-Contains -Text $examplesIndex -Expected 'Installable routed examples are also copied under `ands-nexus/examples/`'
Assert-Contains -Text $skillDefinition -Expected "Run guided ANDS workflow"
Assert-Contains -Text $skillDefinition -Expected "references/glossary.md"
Assert-Contains -Text $skillDefinition -Expected "assets/templates/ands-t-template.md"
Assert-Contains -Text $skillDefinition -Expected "assets/templates/gate-checklist.md"
Assert-Contains -Text $skillDefinition -Expected "assets/templates/lessons-template.md"
Assert-Contains -Text $skillDefinition -Expected "examples/management-rollout-plan.md"
Assert-Contains -Text $firstRunPacket -Expected "Expected output: a candidate Lessons draft, not an automatic writeback."
Assert-Contains -Text $postReleaseFeedback -Expected 'If any answer is `yes` or `unclear`, route to Enterprise review before changing public guidance.'
Assert-Contains -Text $roleRoutingRegression -Expected "Scenario RR-04: Governance Should Escalate Enterprise Scope"

$routedInstallExamples = @(
    "first-run-prompt-packet-v0.3.1.md",
    "guided-workflow-first-run-v0.4.md",
    "guided-workflow-regression-v0.4.md",
    "management-rollout-plan.md",
    "post-release-feedback-intake-v0.3.1.md",
    "role-routing-regression-scenarios-v0.3.1.md"
)
foreach ($routedExample in $routedInstallExamples) {
    $skillExamplePath = Join-Path $repoRoot "ands-nexus/examples/$routedExample"
    if (-not (Test-Path -LiteralPath $skillExamplePath -PathType Leaf)) {
        throw "Missing installable routed example copy: $routedExample"
    }
}

Assert-Contains -Text $guidedReference -Expected "Intake Snapshot"
Assert-Contains -Text $guidedReference -Expected "ANDS-T Task Card"
Assert-Contains -Text $guidedReference -Expected "Track + Gate Checklist"
Assert-Contains -Text $guidedReference -Expected "Lessons Draft"
Assert-Contains -Text $guidedReference -Expected "Role Boundaries"
Assert-Contains -Text $guidedReference -Expected "Guided Lite To Formal Template Mapping"
Assert-Contains -Text $guidedReference -Expected "Next Prompt embedded state"
Assert-Contains -Text $guidedReference -Expected "no unattended or automated writeback"
Assert-Contains -Text $guidedReference -Expected "user-invoked draft generation to an explicit path is allowed only when explicitly requested"
Assert-Contains -Text $guidedReference -Expected 'such as `confirm: ...`, `revise: ...`, `escalate: ...`, `stop: ...`, or `unfilled`'
Assert-Contains -Text $guidedReference -Expected "Owner response values in examples are format demonstrations only"
Assert-Contains -Text $glossaryReference -Expected "State Packet"
Assert-Contains -Text $glossaryReference -Expected "Gate"
Assert-Contains -Text $glossaryReference -Expected "owner_response"

$guidedStateFields = @(
    "workflow_id",
    "current_step",
    "user_goal",
    "audience",
    "data_class",
    "track",
    "active_role",
    "artifacts_created",
    "missing_evidence",
    "owner_decision",
    "owner_response",
    "next_prompt",
    "boundary_flags"
)
foreach ($field in $guidedStateFields) {
    Assert-Contains -Text $guidedStatePacket -Expected $field
}

Assert-Contains -Text $guidedFirstRun -Expected "Current Artifact"
Assert-Contains -Text $guidedFirstRun -Expected "State Packet"
Assert-Contains -Text $guidedFirstRun -Expected "Gate / Evidence Check"
Assert-Contains -Text $guidedFirstRun -Expected "Owner Decision"
Assert-Contains -Text $guidedFirstRun -Expected "Next Prompt"
Assert-Contains -Text $guidedFirstRun -Expected "Boundary Reminder"
Assert-Contains -Text $guidedFirstRun -Expected "- owner_decision: Confirm Standard Track and provide missing evidence"
Assert-Contains -Text $guidedFirstRun -Expected 'Replace `owner_response` with the human owner''s actual reply before sending each Step Prompt.'
Assert-Contains -Text $guidedFirstRun -Expected "- owner_response: [confirm/revise/escalate/stop before continuing]"
Assert-Contains -Text $guidedFirstRun -Expected "- owner_response: <owner reply: confirm/revise/escalate/stop: ...>"
Assert-NotContains -Text $guidedFirstRun -Unexpected "- owner_response: confirm:"
Assert-Contains -Text $guidedFirstRun -Expected "- boundary_flags: Non-Scope: no provider-native validation, no API integration, no credential setup, no tenant connectors, no unattended or automated writeback, no benchmark ranking"
Assert-Contains -Text $guidedFirstRun -Expected "- active_role: Validation + Governance"
Assert-Contains -Text $guidedFirstRun -Expected '| `active_role` | Validation + Governance |'
Assert-Contains -Text $guidedFirstRun -Expected "Gate 2 test evidence; Gate 3 owner acceptance; human review before reuse"
Assert-Contains -Text $guidedFirstRun -Expected "do not authorize broader writeback from this prompt"
Assert-Contains -Text $guidedFirstRun -Expected "confirmation that no broader writeback is authorized by this prompt"
Assert-Contains -Text $guidedFirstRun -Expected "Status legend"

Assert-Contains -Text $guidedRegression -Expected "role drift"
Assert-Contains -Text $guidedRegression -Expected "skipped Gate evidence"
Assert-Contains -Text $guidedRegression -Expected "missing owner decision"
Assert-Contains -Text $guidedRegression -Expected "writeback overreach"
Assert-Contains -Text $guidedRegression -Expected "Enterprise escalation"
Assert-Contains -Text $gateChecklist -Expected 'Owner: `[人类 Project Owner'
Assert-Contains -Text $gateChecklist -Expected "AI PM 仅准备材料与质检，不作准入决策"
Assert-Contains -Text $trackDecisionCard -Expected "External delivery or contractual impact"

$readmeAsQuickValidate = Join-Path $repoRoot "README.md"
Assert-Fails -ExpectedMessage "quick_validate.py failed" -Block {
    & $validator -SkipWritebackTest -QuickValidatePath $readmeAsQuickValidate *>&1 | Out-String | Out-Null
}

$posixScriptPathFixtureRoot = New-ReleaseValidationRepoFixture -NamePrefix "ands-release-posix-script-path-fixture"
$fakeRgDir = Join-Path ([System.IO.Path]::GetTempPath()) ("ands-release-fake-rg-{0}" -f [guid]::NewGuid().ToString("N"))
try {
    New-Item -ItemType Directory -Path $fakeRgDir -Force | Out-Null
    $fakeRgCounter = Join-Path $fakeRgDir "rg-counter.txt"
    $fakeRgScript = @'
param([Parameter(ValueFromRemainingArguments = $true)][string[]]$Arguments)

$count = 0
if (Test-Path -LiteralPath "__COUNTER_PATH__") {
    $rawCount = Get-Content -Raw -LiteralPath "__COUNTER_PATH__"
    if ($rawCount) {
        $count = [int]$rawCount.Trim()
    }
}
$count += 1
Set-Content -LiteralPath "__COUNTER_PATH__" -Encoding ASCII -Value $count

if ($count -eq 2) {
    Write-Output "README.md:1:https://github.com/RyanYao527/ands-nexus"
    exit 0
}

if ($count -eq 3) {
    Write-Output "ands-nexus/scripts/validate_release.ps1:1:best model"
    exit 0
}

exit 1
'@.Replace("__COUNTER_PATH__", $fakeRgCounter)
    Set-Content -LiteralPath (Join-Path $fakeRgDir "rg.ps1") -Encoding UTF8 -Value $fakeRgScript

    $oldPath = $env:PATH
    $env:PATH = "$fakeRgDir$([System.IO.Path]::PathSeparator)$oldPath"
    try {
        $posixScriptPathOutput = & $validator -SkipWritebackTest -RepoRoot $posixScriptPathFixtureRoot *>&1 | Out-String
        Assert-Contains -Text $posixScriptPathOutput -Expected "PASS public_package_scan"
    }
    finally {
        $env:PATH = $oldPath
    }
}
finally {
    if (Test-Path -LiteralPath $posixScriptPathFixtureRoot) {
        Remove-Item -LiteralPath $posixScriptPathFixtureRoot -Recurse -Force
    }
    if (Test-Path -LiteralPath $fakeRgDir) {
        Remove-Item -LiteralPath $fakeRgDir -Recurse -Force
    }
}

$testScriptSource = Get-Content -Raw -Encoding UTF8 -LiteralPath $MyInvocation.MyCommand.Path
$legacyReleaseExampleFixturePattern = 'Join-Path\s+\$repoRoot\s+\("examples/release-'
if ($testScriptSource -match $legacyReleaseExampleFixturePattern) {
    throw "Negative scan fixtures must use isolated temp repo roots, not the real release repo examples tree"
}

$realReleaseExampleFixtureResidue = @(Get-ChildItem -LiteralPath (Join-Path $repoRoot "examples") -Filter "release-*fixture*" -Force)
if ($realReleaseExampleFixtureResidue.Count -gt 0) {
    throw "Real release repo examples tree contains negative scan fixture residue: $($realReleaseExampleFixtureResidue.Name -join ', ')"
}

Assert-PublicScanFails -NamePrefix "ands-release-scan-fixture" -ExpectedMessage "Potential local path, URL, or IP matches found" -Arrange {
    param([string]$scanFixtureRoot)

    $scanFixture = Join-Path $scanFixtureRoot ("examples/release-scan-fixture-{0}.txt" -f [guid]::NewGuid().ToString("N"))
    $localPath = "C:" + "\Users\example\secret"
    $internalUrl = "https" + "://internal.example.invalid/path"
    Set-Content -LiteralPath $scanFixture -Encoding UTF8 -Value "Do not publish $localPath or $internalUrl"
}

Assert-PublicScanFails -NamePrefix "ands-release-private-workspace-fixture" -ExpectedMessage "Potential local path, URL, or IP matches found" -Arrange {
    param([string]$scanFixtureRoot)

    $privateWorkspaceFixture = Join-Path $scanFixtureRoot ("examples/release-private-workspace-fixture-{0}.txt" -f [guid]::NewGuid().ToString("N"))
    $privateProject = "Projects" + "/ands-nexus"
    $releaseWorkspace = "04-Implementation" + "/repo"
    Set-Content -LiteralPath $privateWorkspaceFixture -Encoding UTF8 -Value "Do not publish $privateProject or $releaseWorkspace"
}

Assert-PublicScanFails -NamePrefix "ands-release-unsupported-integration-fixture" -ExpectedMessage "Potential unsupported integration or benchmark claims found" -Arrange {
    param([string]$scanFixtureRoot)

    $unsupportedIntegrationFixture = Join-Path $scanFixtureRoot ("examples/release-unsupported-integration-fixture-{0}.txt" -f [guid]::NewGuid().ToString("N"))
    $credentialSetup = "credential" + " setup"
    $tenantConnectors = "tenant" + " connectors"
    $automatedWriteback = "automated" + " writeback"
    Set-Content -LiteralPath $unsupportedIntegrationFixture -Encoding UTF8 -Value "This adapter pack includes $credentialSetup, $tenantConnectors, and $automatedWriteback with no extra work."
}

Assert-PublicScanFails -NamePrefix "ands-release-provider-claim-fixture" -ExpectedMessage "Potential unsupported integration or benchmark claims found" -Arrange {
    param([string]$scanFixtureRoot)

    $unsupportedProviderClaimFixture = Join-Path $scanFixtureRoot ("examples/release-provider-claim-fixture-{0}.txt" -f [guid]::NewGuid().ToString("N"))
    $bestModel = "best" + " model"
    $guaranteedCapability = "guaranteed" + " provider capability"
    Set-Content -LiteralPath $unsupportedProviderClaimFixture -Encoding UTF8 -Value "KIMI is the $bestModel for governance and has $guaranteedCapability."
}

Assert-PublicScanFails -NamePrefix "ands-release-tenant-setup-fixture" -ExpectedMessage "Potential unsupported integration or benchmark claims found" -Arrange {
    param([string]$scanFixtureRoot)

    $unsupportedTenantSetupFixture = Join-Path $scanFixtureRoot ("examples/release-tenant-setup-fixture-{0}.txt" -f [guid]::NewGuid().ToString("N"))
    $tenantSetup = "tenant" + " setup"
    Set-Content -LiteralPath $unsupportedTenantSetupFixture -Encoding UTF8 -Value "This adapter pack includes credential or $tenantSetup."
}

Assert-PublicScanFails -NamePrefix "ands-release-mixed-integration-fixture" -ExpectedMessage "Potential unsupported integration or benchmark claims found" -Arrange {
    param([string]$scanFixtureRoot)

    $mixedUnsupportedIntegrationFixture = Join-Path $scanFixtureRoot ("examples/release-mixed-integration-fixture-{0}.txt" -f [guid]::NewGuid().ToString("N"))
    $credentialSetup = "credential" + " setup"
    $tenantConnectors = "tenant" + " connectors"
    Set-Content -LiteralPath $mixedUnsupportedIntegrationFixture -Encoding UTF8 -Value "No $credentialSetup; $tenantConnectors are available."
}

Assert-PublicScanFails -NamePrefix "ands-release-mixed-provider-claim-fixture" -ExpectedMessage "Potential unsupported integration or benchmark claims found" -Arrange {
    param([string]$scanFixtureRoot)

    $mixedUnsupportedProviderClaimFixture = Join-Path $scanFixtureRoot ("examples/release-mixed-provider-claim-fixture-{0}.txt" -f [guid]::NewGuid().ToString("N"))
    $bestModel = "best" + " model"
    Set-Content -LiteralPath $mixedUnsupportedProviderClaimFixture -Encoding UTF8 -Value "Non-Scope: KIMI is the $bestModel for governance."
}

Assert-PublicScanFails -NamePrefix "ands-release-case-variant-claim-fixture" -ExpectedMessage "Potential unsupported integration or benchmark claims found" -Arrange {
    param([string]$scanFixtureRoot)

    $caseVariantProviderClaimFixture = Join-Path $scanFixtureRoot ("examples/release-case-variant-claim-fixture-{0}.txt" -f [guid]::NewGuid().ToString("N"))
    $bestModel = "Best" + " Model"
    $credentialSetup = "Credential" + " Setup"
    Set-Content -LiteralPath $caseVariantProviderClaimFixture -Encoding UTF8 -Value "KIMI is the $bestModel and includes $credentialSetup."
}

Assert-PublicScanFails -NamePrefix "ands-release-script-path-mention-claim-fixture" -ExpectedMessage "Potential unsupported integration or benchmark claims found" -Arrange {
    param([string]$scanFixtureRoot)

    $scriptPathMentionClaimFixture = Join-Path $scanFixtureRoot ("examples/release-script-path-mention-claim-fixture-{0}.txt" -f [guid]::NewGuid().ToString("N"))
    $scriptPath = "ands-nexus" + "\scripts\validate_release.ps1"
    $bestModel = "best" + " model"
    Set-Content -LiteralPath $scriptPathMentionClaimFixture -Encoding UTF8 -Value "This public note mentions $scriptPath and says KIMI is the $bestModel."
}

Assert-PublicScanFails -NamePrefix "ands-release-provider-native-validation-fixture" -ExpectedMessage "Potential unsupported integration or benchmark claims found" -Arrange {
    param([string]$scanFixtureRoot)

    $providerNativeValidationFixture = Join-Path $scanFixtureRoot ("examples/release-provider-native-validation-fixture-{0}.txt" -f [guid]::NewGuid().ToString("N"))
    $providerNativeValidation = "provider-native" + " validation"
    Set-Content -LiteralPath $providerNativeValidationFixture -Encoding UTF8 -Value "This adapter pack includes $providerNativeValidation for external runtimes."
}

Assert-PublicScanFails -NamePrefix "ands-release-generic-api-integration-fixture" -ExpectedMessage "Potential unsupported integration or benchmark claims found" -Arrange {
    param([string]$scanFixtureRoot)

    $genericApiIntegrationFixture = Join-Path $scanFixtureRoot ("examples/release-generic-api-integration-fixture-{0}.txt" -f [guid]::NewGuid().ToString("N"))
    $apiIntegration = "API" + " integration"
    Set-Content -LiteralPath $genericApiIntegrationFixture -Encoding UTF8 -Value "This adapter pack includes $apiIntegration with no extra work."
}

Assert-PublicScanFails -NamePrefix "ands-release-tenant-connector-readiness-fixture" -ExpectedMessage "Potential unsupported integration or benchmark claims found" -Arrange {
    param([string]$scanFixtureRoot)

    $tenantConnectorReadinessFixture = Join-Path $scanFixtureRoot ("examples/release-tenant-connector-readiness-fixture-{0}.txt" -f [guid]::NewGuid().ToString("N"))
    $tenantConnectorReadiness = "tenant" + " connector readiness"
    Set-Content -LiteralPath $tenantConnectorReadinessFixture -Encoding UTF8 -Value "This adapter pack provides $tenantConnectorReadiness."
}

Assert-PublicScanFails -NamePrefix "ands-release-enterprise-trigger-bypass-fixture" -ExpectedMessage "Potential unsupported integration or benchmark claims found" -Arrange {
    param([string]$scanFixtureRoot)

    $enterpriseTriggerBypassFixture = Join-Path $scanFixtureRoot ("examples/release-enterprise-trigger-bypass-fixture-{0}.txt" -f [guid]::NewGuid().ToString("N"))
    $apiIntegration = "API" + " integration"
    Set-Content -LiteralPath $enterpriseTriggerBypassFixture -Encoding UTF8 -Value "Enterprise triggers: $apiIntegration is available with no extra work."
}

$fullOutput = & $validator *>&1 | Out-String
Assert-Contains -Text $fullOutput -Expected "PASS test_writeback_mvp"
Assert-Contains -Text $fullOutput -Expected "PASS validate_release"

Write-Host "PASS test_validate_release"
