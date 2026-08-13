param(
    [Parameter(Mandatory = $true)]
    [ValidateSet("ADR", "AUDIT", "LSN", "SPEC", "WRB")]
    [string]$Type,

    [Parameter(Mandatory = $true)]
    [string]$Title,

    [Parameter(Mandatory = $true)]
    [ValidateSet("Decision", "Lessons", "Product", "Prompt", "Project", "Technical")]
    [string]$Domain,

    [Parameter(Mandatory = $true)]
    [string]$Pipeline,

    [string]$Status = "draft",
    [string]$Version = "0.1",
    [string]$Source = "ands-methodology writeback MVP",
    [string]$Summary = "Summarize the project-local knowledge here.",
    [string]$Upstream = "Upstream task, ADR, Gate record, or release record",
    [string]$Downstream = "Downstream standard update, template revision, or follow-up issue",
    [string]$Related = "Related lesson, rule, or knowledge domain",
    [string]$OutputPath
)

$ErrorActionPreference = "Stop"

function Convert-ToWikiLink {
    param([Parameter(Mandatory = $true)][string]$Value)

    if ($Value.StartsWith("[[") -and $Value.EndsWith("]]")) {
        return $Value
    }

    return "[[$Value]]"
}

function Assert-SingleLine {
    param(
        [Parameter(Mandatory = $true)][string]$Name,
        [Parameter(Mandatory = $true)][AllowEmptyString()][string]$Value
    )

    if ($Value -match "[`r`n]") {
        throw "$Name must be a single line."
    }
}

function Convert-ToYamlSingleQuoted {
    param([Parameter(Mandatory = $true)][AllowEmptyString()][string]$Value)

    return "'" + ($Value -replace "'", "''") + "'"
}

Assert-SingleLine -Name "Title" -Value $Title
Assert-SingleLine -Name "Pipeline" -Value $Pipeline
Assert-SingleLine -Name "Status" -Value $Status
Assert-SingleLine -Name "Version" -Value $Version
Assert-SingleLine -Name "Source" -Value $Source
Assert-SingleLine -Name "Summary" -Value $Summary
Assert-SingleLine -Name "Upstream" -Value $Upstream
Assert-SingleLine -Name "Downstream" -Value $Downstream
Assert-SingleLine -Name "Related" -Value $Related

if ($OutputPath -and ([System.IO.Path]::GetExtension($OutputPath) -ne ".md")) {
    throw "OutputPath must end with .md"
}

$today = Get-Date -Format "yyyy-MM-dd"
$upstreamLink = Convert-ToWikiLink -Value $Upstream
$downstreamLink = Convert-ToWikiLink -Value $Downstream
$relatedLink = Convert-ToWikiLink -Value $Related
$yamlPipeline = Convert-ToYamlSingleQuoted -Value $Pipeline
$yamlStatus = Convert-ToYamlSingleQuoted -Value $Status
$yamlVersion = Convert-ToYamlSingleQuoted -Value $Version
$yamlSource = Convert-ToYamlSingleQuoted -Value $Source

$note = @"
---
type: $Type
domain: $Domain
pipeline: $yamlPipeline
status: $yamlStatus
version: $yamlVersion
created: $today
updated: $today
source: $yamlSource
tags:
  - ands
  - writeback
---

# $Title

> Position: $Summary

## Summary

$Summary

## Writeback Boundary

Project facts stay in the project first. Only cross-project ANDS rules, reusable Agent collaboration patterns, reusable knowledge organization rules, or direct ANDS-K/T/A/W/G standard changes should be proposed for the mother methodology knowledge base.

## Evidence

- Source: $Source
- Type: $Type
- Domain: $Domain
- Pipeline: $Pipeline

## Links

- Upstream: $upstreamLink
- Downstream: $downstreamLink
- Related: $relatedLink

## Review Checklist

- [ ] The note contains no real company, person, repository, domain, IP, credential, local path, or sensitive business data.
- [ ] The note belongs in the project directory before any methodology writeback decision.
- [ ] Any proposed mother-methodology writeback is stated as a separate human-reviewed decision.
"@

if ($OutputPath) {
    $fullOutputPath = [System.IO.Path]::GetFullPath($OutputPath)
    $parent = [System.IO.Path]::GetDirectoryName($fullOutputPath)
    if ($parent -and -not (Test-Path -LiteralPath $parent)) {
        [System.IO.Directory]::CreateDirectory($parent) | Out-Null
    }

    $utf8NoBom = New-Object System.Text.UTF8Encoding $false
    $stream = $null
    $writer = $null
    try {
        $stream = [System.IO.File]::Open($fullOutputPath, [System.IO.FileMode]::CreateNew, [System.IO.FileAccess]::Write, [System.IO.FileShare]::None)
        $writer = New-Object System.IO.StreamWriter($stream, $utf8NoBom)
        $writer.Write($note)
        Write-Host "Wrote writeback note: $fullOutputPath"
    }
    catch [System.IO.IOException] {
        throw "OutputPath already exists. Choose a new path or remove the existing file: $fullOutputPath"
    }
    finally {
        if ($writer) {
            $writer.Dispose()
        }
        elseif ($stream) {
            $stream.Dispose()
        }
    }
}
else {
    Write-Output $note
}
