param(
    [string]$SkillRoot = (Resolve-Path (Join-Path $PSScriptRoot "..")).Path,
    [string]$RepoRoot = (Resolve-Path (Join-Path $PSScriptRoot "../..")).Path,
    [string]$QuickValidatePath = "",
    [switch]$SkipWritebackTest
)

$ErrorActionPreference = "Stop"

function Invoke-Step {
    param(
        [Parameter(Mandatory = $true)][string]$Name,
        [Parameter(Mandatory = $true)][scriptblock]$Block
    )

    & $Block
    Write-Host "PASS $Name"
}

function Get-FileCount {
    param([Parameter(Mandatory = $true)][string]$Path)

    if (-not (Test-Path -LiteralPath $Path -PathType Container)) {
        throw "Missing directory: $Path"
    }

    return @(Get-ChildItem -LiteralPath $Path -File -Filter "*.md").Count
}

function Assert-Count {
    param(
        [Parameter(Mandatory = $true)][string]$Name,
        [Parameter(Mandatory = $true)][string]$Path,
        [Parameter(Mandatory = $true)][int]$Expected
    )

    $actual = Get-FileCount -Path $Path
    if ($actual -ne $Expected) {
        throw "$Name count mismatch: expected $Expected, got $actual"
    }
}

function Invoke-Rg {
    param(
        [Parameter(Mandatory = $true)][string]$Pattern,
        [Parameter(Mandatory = $true)][string[]]$Targets
    )

    $rg = Get-Command rg -ErrorAction SilentlyContinue
    if (-not $rg) {
        throw "rg is required for release scans"
    }

    $output = & rg -n $Pattern @Targets 2>$null
    $exitCode = $LASTEXITCODE
    if ($exitCode -eq 1) {
        return @()
    }
    if ($exitCode -ne 0) {
        throw "rg failed for pattern: $Pattern"
    }
    return @($output)
}

function Invoke-NativeChecked {
    param(
        [Parameter(Mandatory = $true)][string]$Name,
        [Parameter(Mandatory = $true)][string]$Command,
        [Parameter(Mandatory = $true)][string[]]$Arguments
    )

    $previousErrorActionPreference = $ErrorActionPreference
    $ErrorActionPreference = "Continue"
    try {
        $output = & $Command @Arguments 2>&1
        $exitCode = $LASTEXITCODE
    }
    finally {
        $ErrorActionPreference = $previousErrorActionPreference
    }

    if ($exitCode -ne 0) {
        $message = "$Name failed with exit code $exitCode"
        if ($output) {
            $message = "$message`n$($output -join "`n")"
        }
        throw $message
    }
    if ($output) {
        $output | Out-Host
    }
}

function Remove-AllowedPublicScanMatches {
    param([Parameter(Mandatory = $true)][string[]]$Matches)

    $filtered = @()
    foreach ($match in $Matches) {
        if ($match.Contains("github.com/RyanYao527/ands-methodology-skill")) {
            continue
        }
        if ($match.Contains("rg -n ")) {
            continue
        }
        if ($match.Contains("http[s]?://")) {
            continue
        }
        if ($match.Contains("[A-Za-z]:\\Users\\")) {
            continue
        }
        if ($match.Contains("/Users/|/home/")) {
            continue
        }
        $filtered += $match
    }

    return $filtered
}

function Get-RgMatchPath {
    param([Parameter(Mandatory = $true)][string]$Line)

    $parts = $Line -split ":", 2
    return $parts[0]
}

function Remove-AllowedIntegrationClaimMatches {
    param([Parameter(Mandatory = $true)][string[]]$ScanMatches)

    $filtered = @()
    foreach ($scanMatch in $ScanMatches) {
        $matchPath = Get-RgMatchPath -Line $scanMatch
        if ($matchPath -like "ands-methodology\scripts\*") {
            continue
        }

        if (Test-AllowedIntegrationClaimLine -Line $scanMatch) {
            continue
        }
        $filtered += $scanMatch
    }

    return $filtered
}

function Test-AllowedIntegrationClaimLine {
    param([Parameter(Mandatory = $true)][string]$Line)

    $lower = $Line.ToLowerInvariant()

    if ($lower.Contains("best model") -or $lower.Contains("guaranteed provider capability")) {
        return $false
    }

    $positiveClaimPhrases = @(
        " are available",
        " is available",
        " with no extra work",
        " includes ",
        " provides ",
        " supports ",
        " readiness",
        " validated",
        " validation for"
    )

    if (
        $lower.Contains("enterprise trigger:") -or
        $lower.Contains("enterprise triggers") -or
        $lower.Contains("not fit without enterprise review")
    ) {
        foreach ($positiveClaimPhrase in $positiveClaimPhrases) {
            if ($lower.Contains($positiveClaimPhrase)) {
                return $false
            }
        }
        return $true
    }

    $requirements = @(
        @{
            Patterns = @("provider-native validation")
            Allowed = @("not provider-native validation", "not provider-native capability validation", "no provider-native validation")
        },
        @{
            Patterns = @("native provider validation")
            Allowed = @("not native provider validation", "no native provider validation")
        },
        @{
            Patterns = @("api integration")
            Allowed = @("no live provider api integration", "not an api integration guide", "not api integration", "no api integration")
        },
        @{
            Patterns = @("live provider api integration")
            Allowed = @("no live provider api integration")
        },
        @{
            Patterns = @("credential setup")
            Allowed = @("no credential setup", "no credential or tenant setup")
        },
        @{
            Patterns = @("credential or tenant setup")
            Allowed = @("no credential or tenant setup")
        },
        @{
            Patterns = @("tenant setup")
            Allowed = @("no tenant setup", "no credential or tenant setup")
        },
        @{
            Patterns = @("tenant connectors")
            Allowed = @("no tenant connectors")
        },
        @{
            Patterns = @("tenant connector readiness")
            Allowed = @("no tenant connector readiness", "not tenant connector readiness", "no tenant connectors")
        },
        @{
            Patterns = @("automated writeback")
            Allowed = @("no automated writeback")
        },
        @{
            Patterns = @("api key setup")
            Allowed = @("no api key setup")
        },
        @{
            Patterns = @("oauth setup")
            Allowed = @("no oauth setup")
        },
        @{
            Patterns = @("benchmark ranking")
            Allowed = @("no benchmark ranking", "no public benchmark ranking", "not benchmark rankings")
        }
    )

    foreach ($requirement in $requirements) {
        $hasPattern = $false
        foreach ($pattern in $requirement.Patterns) {
            if ($lower.Contains($pattern)) {
                $hasPattern = $true
                break
            }
        }

        if (-not $hasPattern) {
            continue
        }

        $hasAllowedPhrase = $false
        foreach ($allowed in $requirement.Allowed) {
            if ($lower.Contains($allowed)) {
                $hasAllowedPhrase = $true
                break
            }
        }

        if (-not $hasAllowedPhrase) {
            return $false
        }
    }

    return $true
}

$templatesValidator = Join-Path $PSScriptRoot "validate_templates.ps1"
$writebackTest = Join-Path $PSScriptRoot "test_writeback_mvp.ps1"

Invoke-Step -Name "validate_templates" -Block {
    & $templatesValidator -SkillRoot $SkillRoot | Out-Host
}

if (-not $SkipWritebackTest) {
    Invoke-Step -Name "test_writeback_mvp" -Block {
        & $writebackTest | Out-Host
    }
}

if ($QuickValidatePath) {
    Invoke-Step -Name "quick_validate" -Block {
        if (-not (Test-Path -LiteralPath $QuickValidatePath -PathType Leaf)) {
            throw "Missing quick_validate.py: $QuickValidatePath"
        }
        Invoke-NativeChecked -Name "quick_validate.py" -Command "python" -Arguments @($QuickValidatePath, $SkillRoot)
    }
}

Invoke-Step -Name "asset_counts" -Block {
    Assert-Count -Name "references" -Path (Join-Path $SkillRoot "references") -Expected 8
    Assert-Count -Name "templates" -Path (Join-Path $SkillRoot "assets/templates") -Expected 10
    Assert-Count -Name "examples" -Path (Join-Path $RepoRoot "examples") -Expected 12
}

Invoke-Step -Name "public_package_scan" -Block {
    Push-Location $RepoRoot
    try {
        $targets = @("README.md", "RELEASE_NOTES.md", "PUBLISHING_CHECKLIST.md", "examples", "ands-methodology")
        $secretMatches = Invoke-Rg -Pattern "BEGIN (RSA|OPENSSH|PRIVATE)|AKIA[0-9A-Z]{16}|sk-[A-Za-z0-9]{20,}|gh[opsu]_[A-Za-z0-9_]{20,}" -Targets @(".")
        if ($secretMatches.Count -gt 0) {
            throw "Potential secret-like matches found:`n$($secretMatches -join "`n")"
        }

        $pathMatches = Invoke-Rg -Pattern "([A-Za-z]:\\Users\\|/Users/|/home/|http[s]?://|\b\d{1,3}(\.\d{1,3}){3}\b|Projects[\\/]ands-methodology-skill|04-Implementation[\\/]repo)" -Targets $targets
        $pathMatches = Remove-AllowedPublicScanMatches -Matches $pathMatches
        if ($pathMatches.Count -gt 0) {
            throw "Potential local path, URL, or IP matches found:`n$($pathMatches -join "`n")"
        }

        $claimMatches = Invoke-Rg -Pattern "(?i)provider-native validation|native provider validation|API integration|live provider API integration|credential setup|credential or tenant setup|tenant setup|tenant connectors|tenant connector readiness|automated writeback|API key setup|OAuth setup|benchmark ranking|best model|guaranteed provider capability" -Targets $targets
        $claimMatches = Remove-AllowedIntegrationClaimMatches -ScanMatches $claimMatches
        if ($claimMatches.Count -gt 0) {
            throw "Potential unsupported integration or benchmark claims found:`n$($claimMatches -join "`n")"
        }
    }
    finally {
        Pop-Location
    }
}

Write-Host "PASS validate_release"
