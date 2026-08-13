$ErrorActionPreference = "Stop"

$scriptDir = Split-Path -Parent $MyInvocation.MyCommand.Path
$generator = Join-Path $scriptDir "new_writeback_note.ps1"

if (-not (Test-Path -LiteralPath $generator)) {
    throw "Missing generator script: $generator"
}

function Assert-Contains {
    param(
        [Parameter(Mandatory = $true)][string]$Text,
        [Parameter(Mandatory = $true)][string]$Expected
    )

    if (-not $Text.Contains($Expected)) {
        throw "Expected generated note to contain: $Expected"
    }
}

function Assert-Fails {
    param(
        [Parameter(Mandatory = $true)][scriptblock]$Block,
        [Parameter(Mandatory = $true)][string]$ExpectedMessage
    )

    $failed = $false
    try {
        & $Block
    }
    catch {
        $failed = $true
        if (-not $_.Exception.Message.Contains($ExpectedMessage)) {
            throw "Expected failure containing '$ExpectedMessage' but got '$($_.Exception.Message)'"
        }
    }

    if (-not $failed) {
        throw "Expected command to fail with: $ExpectedMessage"
    }
}

$content = & $generator `
    -Type "LSN" `
    -Title "LSN-test-writeback" `
    -Domain "Lessons" `
    -Pipeline "Lessons" `
    -Status "draft" `
    -Version "0.2" `
    -Source "test_writeback_mvp" `
    -Summary "Captured lesson from a desensitized internal feedback loop." `
    -Upstream "SPEC-upstream" `
    -Downstream "SPEC-downstream" `
    -Related "RULE-related"

Assert-Contains -Text $content -Expected "---"
Assert-Contains -Text $content -Expected "type: LSN"
Assert-Contains -Text $content -Expected "domain: Lessons"
Assert-Contains -Text $content -Expected "# LSN-test-writeback"
Assert-Contains -Text $content -Expected "Project facts stay in the project first"
Assert-Contains -Text $content -Expected "- Upstream: [[SPEC-upstream]]"
Assert-Contains -Text $content -Expected "- Downstream: [[SPEC-downstream]]"
Assert-Contains -Text $content -Expected "- Related: [[RULE-related]]"

$quotedContent = & $generator `
    -Type "SPEC" `
    -Title "SPEC-test-yaml-quoting" `
    -Domain "Technical" `
    -Pipeline "Knowledge" `
    -Status "draft:internal" `
    -Version "0.2" `
    -Source "review: source" `
    -Summary "Check YAML scalar quoting." `
    -Upstream "SPEC-upstream" `
    -Downstream "SPEC-downstream" `
    -Related "RULE-related"

Assert-Contains -Text $quotedContent -Expected "status: 'draft:internal'"
Assert-Contains -Text $quotedContent -Expected "source: 'review: source'"

$tempDir = Join-Path ([System.IO.Path]::GetTempPath()) ("ands-writeback-test-" + [guid]::NewGuid().ToString("N"))
New-Item -ItemType Directory -Path $tempDir | Out-Null
$outputPath = Join-Path $tempDir "LSN-test-writeback.md"

& $generator `
    -Type "LSN" `
    -Title "LSN-test-writeback" `
    -Domain "Lessons" `
    -Pipeline "Lessons" `
    -Status "draft" `
    -Version "0.2" `
    -Source "test_writeback_mvp" `
    -Summary "Captured lesson from a desensitized internal feedback loop." `
    -Upstream "SPEC-upstream" `
    -Downstream "SPEC-downstream" `
    -Related "RULE-related" `
    -OutputPath $outputPath | Out-Null

if (-not (Test-Path -LiteralPath $outputPath)) {
    throw "Expected generator to write file: $outputPath"
}

$fileContent = Get-Content -Raw -Encoding UTF8 -LiteralPath $outputPath
Assert-Contains -Text $fileContent -Expected "created:"
Assert-Contains -Text $fileContent -Expected "updated:"
Assert-Contains -Text $fileContent -Expected "Captured lesson from a desensitized internal feedback loop."

Assert-Fails -ExpectedMessage "OutputPath already exists" -Block {
    & $generator `
        -Type "LSN" `
        -Title "LSN-test-writeback" `
        -Domain "Lessons" `
        -Pipeline "Lessons" `
        -Status "draft" `
        -Version "0.2" `
        -Source "test_writeback_mvp" `
        -Summary "Attempted overwrite." `
        -Upstream "SPEC-upstream" `
        -Downstream "SPEC-downstream" `
        -Related "RULE-related" `
        -OutputPath $outputPath | Out-Null
}

$txtOutputPath = Join-Path $tempDir "LSN-test-writeback.txt"
Assert-Fails -ExpectedMessage "OutputPath must end with .md" -Block {
    & $generator `
        -Type "LSN" `
        -Title "LSN-test-writeback" `
        -Domain "Lessons" `
        -Pipeline "Lessons" `
        -Status "draft" `
        -Version "0.2" `
        -Source "test_writeback_mvp" `
        -Summary "Non markdown output." `
        -Upstream "SPEC-upstream" `
        -Downstream "SPEC-downstream" `
        -Related "RULE-related" `
        -OutputPath $txtOutputPath | Out-Null
}

Assert-Fails -ExpectedMessage "must be a single line" -Block {
    & $generator `
        -Type "LSN" `
        -Title "LSN-test-writeback" `
        -Domain "Lessons" `
        -Pipeline "Lessons`nInjected" `
        -Status "draft" `
        -Version "0.2" `
        -Source "test_writeback_mvp" `
        -Summary "Invalid pipeline." `
        -Upstream "SPEC-upstream" `
        -Downstream "SPEC-downstream" `
        -Related "RULE-related" | Out-Null
}

Assert-Fails -ExpectedMessage "must be a single line" -Block {
    & $generator `
        -Type "LSN" `
        -Title "LSN-test-writeback" `
        -Domain "Lessons" `
        -Pipeline "Lessons" `
        -Status "draft" `
        -Version "0.2" `
        -Source "source`nstatus: active" `
        -Summary "Invalid source." `
        -Upstream "SPEC-upstream" `
        -Downstream "SPEC-downstream" `
        -Related "RULE-related" | Out-Null
}

Remove-Item -LiteralPath $tempDir -Recurse -Force

Write-Host "PASS test_writeback_mvp"
