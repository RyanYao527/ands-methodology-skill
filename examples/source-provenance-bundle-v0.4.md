# Source Provenance Bundle Example

Use this example when you need to publish a desensitized source provenance note for ANDS Nexus materials.

This file is synthetic. It does not include real Obsidian paths, canvas exports, customer records, private screenshots, API output, tenant configuration, or provider transcripts. Non-Scope: no provider-native validation, no API integration, no credential setup, no tenant connectors, no unattended or automated writeback, no benchmark ranking, no best-provider result, and no procurement guidance.

## Purpose

A source provenance bundle explains where a public example came from after sensitive details have been removed. It helps reviewers see the chain of evidence without exposing private source material.

## Minimum Fields

| Field | Example |
|---|---|
| Public asset | `examples/guided-workflow-first-run-v0.4.md` |
| Source class | `synthetic` |
| Desensitization outcome | `PASS` |
| Review owner | `Project Owner` |
| Evidence level | `documentation / local validation / synthetic example` |
| Original source retained? | `No public source file retained` |
| Removed material | `No real names, organizations, repository names, local paths, screenshots, or business metrics` |
| Reuse boundary | `Use as workflow practice material only` |

## Source Chain Template

| Step | Description | Public-safe evidence |
|---|---|---|
| 1 | Draft created from a synthetic workflow scenario. | Scenario uses generic roles and fields. |
| 2 | Reviewer checked for sensitive identifiers. | Redline shows no names, paths, credentials, screenshots, or customer details. |
| 3 | Reviewer assigned desensitization outcome. | `PASS`, `NEEDS_REDACTION`, or `BLOCKED`. |
| 4 | Public package validation ran. | Release validator and public package scan pass before release. |

## Boundary

This bundle is not a replacement for source control history, legal review, security review, or Enterprise approval. If a source item contains real customer data, tenant configuration, credentials, private screenshots, provider outputs, or identifiable business facts that cannot be generalized, mark it `BLOCKED` and keep it out of the public package.
