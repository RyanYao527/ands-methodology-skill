# Capability Matrix Template

> Use this template to compare how different agent/model runtimes execute the same ANDS workflow. Do not include secrets, real organization names, repositories, domains, IPs, local paths, credentials, or sensitive business data.

## Matrix Meta

| Field | Value |
|---|---|
| Matrix ID | `[desensitized id]` |
| Task Type | `[adoption / ANDS-T / validation / governance / writeback]` |
| Date | `[YYYY-MM-DD]` |
| Evaluator Role | `[role, not real name]` |

## Runtime Rows

| Runtime | Context Handling | Tool Use | File / Write Behavior | Chinese / English Handling | Structured Output | Governance Behavior | Validation Behavior | Knowledge Writeback | Failure Modes |
|---|---|---|---|---|---|---|---|---|---|
| Codex/OpenAI baseline | `[observe]` | `[observe]` | `[observe]` | `[observe]` | `[observe]` | `[observe]` | `[observe]` | `[observe]` | `[observe]` |
| KIMI | `[observe]` | `[observe]` | `[observe]` | `[observe]` | `[observe]` | `[observe]` | `[observe]` | `[observe]` | `[observe]` |
| GLM | `[observe]` | `[observe]` | `[observe]` | `[observe]` | `[observe]` | `[observe]` | `[observe]` | `[observe]` | `[observe]` |
| MiniMax | `[observe]` | `[observe]` | `[observe]` | `[observe]` | `[observe]` | `[observe]` | `[observe]` | `[observe]` | `[observe]` |
| Claude | `[observe]` | `[observe]` | `[observe]` | `[observe]` | `[observe]` | `[observe]` | `[observe]` | `[observe]` | `[observe]` |
| DeepSeek | `[observe]` | `[observe]` | `[observe]` | `[observe]` | `[observe]` | `[observe]` | `[observe]` | `[observe]` | `[observe]` |
| WorkBuddy | `[observe]` | `[observe]` | `[observe]` | `[observe]` | `[observe]` | `[observe]` | `[observe]` | `[observe]` | `[observe]` |

## Decision

- Observed fit for AI PM / Orchestration in this trial: `[runtime + reason]`
- Observed fit for Execution in this trial: `[runtime + reason]`
- Observed fit for Validation in this trial: `[runtime + reason]`
- Observed fit for Governance Review in this trial: `[runtime + reason]`
- Observed fit for Writeback in this trial: `[runtime + reason]`
- Escalation needed: `[none / Standard / Enterprise + reason]`

## Evidence Notes

- Keep observations comparative and evidence-backed.
- Mark unknowns as `unknown`, not as runtime weaknesses.
- Do not publish benchmark-style claims from a single informal trial.
