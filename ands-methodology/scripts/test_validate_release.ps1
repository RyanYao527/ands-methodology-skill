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
    $privateProject = "Projects" + "/ands-methodology-skill"
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

$fullOutput = & $validator *>&1 | Out-String
Assert-Contains -Text $fullOutput -Expected "PASS test_writeback_mvp"
Assert-Contains -Text $fullOutput -Expected "PASS validate_release"

Write-Host "PASS test_validate_release"
