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

$output = & $validator -SkipWritebackTest *>&1 | Out-String

Assert-Contains -Text $output -Expected "PASS validate_templates"
Assert-Contains -Text $output -Expected "PASS asset_counts"
Assert-Contains -Text $output -Expected "PASS public_package_scan"
Assert-Contains -Text $output -Expected "PASS validate_release"

$missingRequiredExampleRoot = Join-Path ([System.IO.Path]::GetTempPath()) ("ands-release-manifest-fixture-{0}" -f [guid]::NewGuid().ToString("N"))
try {
    New-Item -ItemType Directory -Path (Join-Path $missingRequiredExampleRoot "examples") -Force | Out-Null
    New-Item -ItemType Directory -Path (Join-Path $missingRequiredExampleRoot "ands-nexus") -Force | Out-Null
    Set-Content -LiteralPath (Join-Path $missingRequiredExampleRoot "README.md") -Encoding UTF8 -Value "# Fixture"
    Set-Content -LiteralPath (Join-Path $missingRequiredExampleRoot "RELEASE_NOTES.md") -Encoding UTF8 -Value "# Fixture"
    Set-Content -LiteralPath (Join-Path $missingRequiredExampleRoot "PUBLISHING_CHECKLIST.md") -Encoding UTF8 -Value "# Fixture"

    $manifestExampleFiles = @(
        "agent-model-adaptation-forward-test-v0.2.2.md",
        "ands-t-task-example.md",
        "demo-trace-guide-example.md",
        "desensitization-notes.md",
        "forward-test-scenarios-v0.2.md",
        "gate-checklist-example.md",
        "lessons-writeback-example.md",
        "management-rollout-plan.md",
        "post-release-feedback-intake-v0.2.1.md",
        "provider-profile-cards-v0.2.2.md",
        "provider-profile-offline-adoption-packet-v0.3.md",
        "release-manifest-placeholder.md",
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
Assert-Contains -Text $forwardTestSuite -Expected "Writeback boundary: produce candidate-only Lessons and reusable-rule candidates; do not perform persistence."

Assert-Contains -Text $adapterCard -Expected "Before answering, restate the active role, active Gate, non-goals, and forbidden expansions."
Assert-Contains -Text $adapterCard -Expected "For Validation Agent work, map every Gate Checklist item to status, evidence, missing evidence, and requested fix."
Assert-Contains -Text $adapterCard -Expected "For Writeback Agent work, return candidate-only Lessons and reusable-rule candidates; do not perform persistence."

Assert-Contains -Text $adaptationReference -Expected "Execution boundary: produce only the requested deliverable, assumptions, evidence, caveats, and handoff notes."
Assert-Contains -Text $adaptationReference -Expected "Validation boundary: itemize every Gate Checklist row with status, evidence, missing evidence, and requested fix."
Assert-Contains -Text $adaptationReference -Expected "Writeback boundary: produce candidate-only Lessons and reusable-rule candidates unless Enterprise review approves persistence."

$readmeAsQuickValidate = Join-Path $repoRoot "README.md"
Assert-Fails -ExpectedMessage "quick_validate.py failed" -Block {
    & $validator -SkipWritebackTest -QuickValidatePath $readmeAsQuickValidate *>&1 | Out-String | Out-Null
}

$scanFixture = Join-Path $repoRoot ("examples/release-scan-fixture-{0}.txt" -f [guid]::NewGuid().ToString("N"))
try {
    $localPath = "C:" + "\Users\example\secret"
    $internalUrl = "https" + "://internal.example.invalid/path"
    Set-Content -LiteralPath $scanFixture -Encoding UTF8 -Value "Do not publish $localPath or $internalUrl"
    Assert-Fails -ExpectedMessage "Potential local path, URL, or IP matches found" -Block {
        & $validator -SkipWritebackTest *>&1 | Out-String | Out-Null
    }
}
finally {
    if (Test-Path -LiteralPath $scanFixture) {
        Remove-Item -LiteralPath $scanFixture -Force
    }
}

$privateWorkspaceFixture = Join-Path $repoRoot ("examples/release-private-workspace-fixture-{0}.txt" -f [guid]::NewGuid().ToString("N"))
try {
    $privateProject = "Projects" + "/ands-nexus"
    $releaseWorkspace = "04-Implementation" + "/repo"
    Set-Content -LiteralPath $privateWorkspaceFixture -Encoding UTF8 -Value "Do not publish $privateProject or $releaseWorkspace"
    Assert-Fails -ExpectedMessage "Potential local path, URL, or IP matches found" -Block {
        & $validator -SkipWritebackTest *>&1 | Out-String | Out-Null
    }
}
finally {
    if (Test-Path -LiteralPath $privateWorkspaceFixture) {
        Remove-Item -LiteralPath $privateWorkspaceFixture -Force
    }
}

$unsupportedIntegrationFixture = Join-Path $repoRoot ("examples/release-unsupported-integration-fixture-{0}.txt" -f [guid]::NewGuid().ToString("N"))
try {
    $credentialSetup = "credential" + " setup"
    $tenantConnectors = "tenant" + " connectors"
    $automatedWriteback = "automated" + " writeback"
    Set-Content -LiteralPath $unsupportedIntegrationFixture -Encoding UTF8 -Value "This adapter pack includes $credentialSetup, $tenantConnectors, and $automatedWriteback with no extra work."
    Assert-Fails -ExpectedMessage "Potential unsupported integration or benchmark claims found" -Block {
        & $validator -SkipWritebackTest *>&1 | Out-String | Out-Null
    }
}
finally {
    if (Test-Path -LiteralPath $unsupportedIntegrationFixture) {
        Remove-Item -LiteralPath $unsupportedIntegrationFixture -Force
    }
}

$unsupportedProviderClaimFixture = Join-Path $repoRoot ("examples/release-provider-claim-fixture-{0}.txt" -f [guid]::NewGuid().ToString("N"))
try {
    $bestModel = "best" + " model"
    $guaranteedCapability = "guaranteed" + " provider capability"
    Set-Content -LiteralPath $unsupportedProviderClaimFixture -Encoding UTF8 -Value "KIMI is the $bestModel for governance and has $guaranteedCapability."
    Assert-Fails -ExpectedMessage "Potential unsupported integration or benchmark claims found" -Block {
        & $validator -SkipWritebackTest *>&1 | Out-String | Out-Null
    }
}
finally {
    if (Test-Path -LiteralPath $unsupportedProviderClaimFixture) {
        Remove-Item -LiteralPath $unsupportedProviderClaimFixture -Force
    }
}

$unsupportedTenantSetupFixture = Join-Path $repoRoot ("examples/release-tenant-setup-fixture-{0}.txt" -f [guid]::NewGuid().ToString("N"))
try {
    $tenantSetup = "tenant" + " setup"
    Set-Content -LiteralPath $unsupportedTenantSetupFixture -Encoding UTF8 -Value "This adapter pack includes credential or $tenantSetup."
    Assert-Fails -ExpectedMessage "Potential unsupported integration or benchmark claims found" -Block {
        & $validator -SkipWritebackTest *>&1 | Out-String | Out-Null
    }
}
finally {
    if (Test-Path -LiteralPath $unsupportedTenantSetupFixture) {
        Remove-Item -LiteralPath $unsupportedTenantSetupFixture -Force
    }
}

$mixedUnsupportedIntegrationFixture = Join-Path $repoRoot ("examples/release-mixed-integration-fixture-{0}.txt" -f [guid]::NewGuid().ToString("N"))
try {
    $credentialSetup = "credential" + " setup"
    $tenantConnectors = "tenant" + " connectors"
    Set-Content -LiteralPath $mixedUnsupportedIntegrationFixture -Encoding UTF8 -Value "No $credentialSetup; $tenantConnectors are available."
    Assert-Fails -ExpectedMessage "Potential unsupported integration or benchmark claims found" -Block {
        & $validator -SkipWritebackTest *>&1 | Out-String | Out-Null
    }
}
finally {
    if (Test-Path -LiteralPath $mixedUnsupportedIntegrationFixture) {
        Remove-Item -LiteralPath $mixedUnsupportedIntegrationFixture -Force
    }
}

$mixedUnsupportedProviderClaimFixture = Join-Path $repoRoot ("examples/release-mixed-provider-claim-fixture-{0}.txt" -f [guid]::NewGuid().ToString("N"))
try {
    $bestModel = "best" + " model"
    Set-Content -LiteralPath $mixedUnsupportedProviderClaimFixture -Encoding UTF8 -Value "Non-Scope: KIMI is the $bestModel for governance."
    Assert-Fails -ExpectedMessage "Potential unsupported integration or benchmark claims found" -Block {
        & $validator -SkipWritebackTest *>&1 | Out-String | Out-Null
    }
}
finally {
    if (Test-Path -LiteralPath $mixedUnsupportedProviderClaimFixture) {
        Remove-Item -LiteralPath $mixedUnsupportedProviderClaimFixture -Force
    }
}

$caseVariantProviderClaimFixture = Join-Path $repoRoot ("examples/release-case-variant-claim-fixture-{0}.txt" -f [guid]::NewGuid().ToString("N"))
try {
    $bestModel = "Best" + " Model"
    $credentialSetup = "Credential" + " Setup"
    Set-Content -LiteralPath $caseVariantProviderClaimFixture -Encoding UTF8 -Value "KIMI is the $bestModel and includes $credentialSetup."
    Assert-Fails -ExpectedMessage "Potential unsupported integration or benchmark claims found" -Block {
        & $validator -SkipWritebackTest *>&1 | Out-String | Out-Null
    }
}
finally {
    if (Test-Path -LiteralPath $caseVariantProviderClaimFixture) {
        Remove-Item -LiteralPath $caseVariantProviderClaimFixture -Force
    }
}

$scriptPathMentionClaimFixture = Join-Path $repoRoot ("examples/release-script-path-mention-claim-fixture-{0}.txt" -f [guid]::NewGuid().ToString("N"))
try {
    $scriptPath = "ands-nexus" + "\scripts\validate_release.ps1"
    $bestModel = "best" + " model"
    Set-Content -LiteralPath $scriptPathMentionClaimFixture -Encoding UTF8 -Value "This public note mentions $scriptPath and says KIMI is the $bestModel."
    Assert-Fails -ExpectedMessage "Potential unsupported integration or benchmark claims found" -Block {
        & $validator -SkipWritebackTest *>&1 | Out-String | Out-Null
    }
}
finally {
    if (Test-Path -LiteralPath $scriptPathMentionClaimFixture) {
        Remove-Item -LiteralPath $scriptPathMentionClaimFixture -Force
    }
}

$providerNativeValidationFixture = Join-Path $repoRoot ("examples/release-provider-native-validation-fixture-{0}.txt" -f [guid]::NewGuid().ToString("N"))
try {
    $providerNativeValidation = "provider-native" + " validation"
    Set-Content -LiteralPath $providerNativeValidationFixture -Encoding UTF8 -Value "This adapter pack includes $providerNativeValidation for external runtimes."
    Assert-Fails -ExpectedMessage "Potential unsupported integration or benchmark claims found" -Block {
        & $validator -SkipWritebackTest *>&1 | Out-String | Out-Null
    }
}
finally {
    if (Test-Path -LiteralPath $providerNativeValidationFixture) {
        Remove-Item -LiteralPath $providerNativeValidationFixture -Force
    }
}

$genericApiIntegrationFixture = Join-Path $repoRoot ("examples/release-generic-api-integration-fixture-{0}.txt" -f [guid]::NewGuid().ToString("N"))
try {
    $apiIntegration = "API" + " integration"
    Set-Content -LiteralPath $genericApiIntegrationFixture -Encoding UTF8 -Value "This adapter pack includes $apiIntegration with no extra work."
    Assert-Fails -ExpectedMessage "Potential unsupported integration or benchmark claims found" -Block {
        & $validator -SkipWritebackTest *>&1 | Out-String | Out-Null
    }
}
finally {
    if (Test-Path -LiteralPath $genericApiIntegrationFixture) {
        Remove-Item -LiteralPath $genericApiIntegrationFixture -Force
    }
}

$tenantConnectorReadinessFixture = Join-Path $repoRoot ("examples/release-tenant-connector-readiness-fixture-{0}.txt" -f [guid]::NewGuid().ToString("N"))
try {
    $tenantConnectorReadiness = "tenant" + " connector readiness"
    Set-Content -LiteralPath $tenantConnectorReadinessFixture -Encoding UTF8 -Value "This adapter pack provides $tenantConnectorReadiness."
    Assert-Fails -ExpectedMessage "Potential unsupported integration or benchmark claims found" -Block {
        & $validator -SkipWritebackTest *>&1 | Out-String | Out-Null
    }
}
finally {
    if (Test-Path -LiteralPath $tenantConnectorReadinessFixture) {
        Remove-Item -LiteralPath $tenantConnectorReadinessFixture -Force
    }
}

$enterpriseTriggerBypassFixture = Join-Path $repoRoot ("examples/release-enterprise-trigger-bypass-fixture-{0}.txt" -f [guid]::NewGuid().ToString("N"))
try {
    $apiIntegration = "API" + " integration"
    Set-Content -LiteralPath $enterpriseTriggerBypassFixture -Encoding UTF8 -Value "Enterprise triggers: $apiIntegration is available with no extra work."
    Assert-Fails -ExpectedMessage "Potential unsupported integration or benchmark claims found" -Block {
        & $validator -SkipWritebackTest *>&1 | Out-String | Out-Null
    }
}
finally {
    if (Test-Path -LiteralPath $enterpriseTriggerBypassFixture) {
        Remove-Item -LiteralPath $enterpriseTriggerBypassFixture -Force
    }
}

$fullOutput = & $validator *>&1 | Out-String
Assert-Contains -Text $fullOutput -Expected "PASS test_writeback_mvp"
Assert-Contains -Text $fullOutput -Expected "PASS validate_release"

Write-Host "PASS test_validate_release"
