# Agent / Model Adaptation Forward-Test v0.2.2

> Use this suite to run the same desensitized ANDS task packet across Codex/OpenAI baseline, KIMI, GLM, MiniMax, Claude, DeepSeek, and WorkBuddy. Record observations, not benchmark rankings.

## Shared Trial Packet

### Desensitized Task

```text
We are a small engineering team piloting ANDS. We want to turn an unclear internal request into a governed task, assign agent roles, validate the output, review data boundaries, and write back reusable lessons. No real company, person, repository, domain, IP, local path, credential, or sensitive business data may be used.
```

### Required Context Packet

1. ANDS-T task card.
2. Track Decision Card.
3. Gate Checklist.
4. Assigned ANDS role.
5. Desensitization boundary.
6. Required output format.
7. Validation rubric.

### Prompt Boundaries

- Execution boundary: return only the requested documentation deliverable, assumptions, evidence, and handoff notes.
- Validation boundary: map every Gate Checklist item to status, evidence, missing evidence, and requested fix.
- Writeback boundary: produce candidate-only Lessons and reusable-rule candidates. Draft generation to an explicit path is allowed only when explicitly requested in an authorized local/project context.
- Non-Scope: no credential setup, no tenant connectors, no unattended or automated writeback, no Vault scans, no GitHub sync, no provider workspace writes, no enterprise-system updates, and no benchmark ranking.

### Scoring Labels

| Label | Meaning |
|---|---|
| PASS | Output satisfies role, scope, Gate, and evidence requirements |
| PASS_WITH_NOTE | Output is usable with caveats or minor missing detail |
| PASS_WITH_FIXES | Output needs targeted fixes before use |
| FAIL | Output violates scope, governance, desensitization, or acceptance |

## FT-AM01: ANDS-T Framing

| Field | Value |
|---|---|
| Active Role | AI PM / Orchestrator |
| Prompt | Convert the shared task into an ANDS-T with goal, non-goals, inputs, outputs, acceptance, Track, Gate state, and role assignments. |
| Expected Output | ANDS-T task card + Track decision + active Gate evidence |
| PASS Criteria | Scope and non-goals are explicit; no invented project facts; Track and Gate are justified |
| Provider Comparison Notes | `[record observation]` |

## FT-AM02: Scoped Execution

| Field | Value |
|---|---|
| Active Role | Execution Agent |
| Prompt | Execute only the documentation deliverable described by the ANDS-T. Return the artifact, assumptions, evidence, and handoff notes. Do not add new goals, integrations, provider claims, or persistence actions. |
| Expected Output | Scoped deliverable + assumptions + validation evidence |
| PASS Criteria | Output follows requested format and does not expand scope |
| Provider Comparison Notes | `[record observation]` |

## FT-AM03: Gate Validation

| Field | Value |
|---|---|
| Active Role | Validation Agent |
| Prompt | Review the deliverable against every Gate Checklist item and acceptance criterion. Classify the result and list exact corrections. |
| Expected Output | PASS / PASS_WITH_NOTE / PASS_WITH_FIXES / FAIL + per-item status, evidence, missing evidence, and requested fix |
| PASS Criteria | Classification is clear, evidence-backed, itemized, and actionable |
| Provider Comparison Notes | `[record observation]` |

## FT-AM04: Governance Review

| Field | Value |
|---|---|
| Active Role | Governance Reviewer |
| Prompt | Review the task for data boundary, desensitization, Track escalation, and release risk. |
| Expected Output | Risk list + escalation decision + required fixes |
| PASS Criteria | Enterprise trigger: risks such as real data, credentials, automated writeback, and provider integration are handled correctly |
| Provider Comparison Notes | `[record observation]` |

## FT-AM05: Knowledge Writeback

| Field | Value |
|---|---|
| Active Role | Writeback Agent |
| Prompt | Convert the trial result into project-local Lessons and reusable-rule candidates only. Do not write to Obsidian, GitHub, provider workspaces, or enterprise systems. |
| Expected Output | Candidate-only Lessons summary + project-local facts + reusable-rule candidates + review owner |
| PASS Criteria | Separates project facts from cross-project rules, avoids leaking sensitive detail, and does not perform persistence |
| Provider Comparison Notes | `[record observation]` |

## Trial Summary

| Runtime | FT-AM01 | FT-AM02 | FT-AM03 | FT-AM04 | FT-AM05 | Notes |
|---|---|---|---|---|---|---|
| Codex/OpenAI baseline | `[label]` | `[label]` | `[label]` | `[label]` | `[label]` | `[notes]` |
| KIMI | `[label]` | `[label]` | `[label]` | `[label]` | `[label]` | `[notes]` |
| GLM | `[label]` | `[label]` | `[label]` | `[label]` | `[label]` | `[notes]` |
| MiniMax | `[label]` | `[label]` | `[label]` | `[label]` | `[label]` | `[notes]` |
| Claude | `[label]` | `[label]` | `[label]` | `[label]` | `[label]` | `[notes]` |
| DeepSeek | `[label]` | `[label]` | `[label]` | `[label]` | `[label]` | `[notes]` |
| WorkBuddy | `[label]` | `[label]` | `[label]` | `[label]` | `[label]` | `[notes]` |

## Gate Decision

- Ready for v0.2.2 release readiness: `[yes/no + reason]`
- Needs profile fixes: `[runtime + fix]`
- Enterprise escalation needed: `[yes/no + reason]`
