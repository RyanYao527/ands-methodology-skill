# Agent / Model Adapter Card

> Use this card to adapt ANDS workflows to a specific agent or model runtime. This is prompt-level guidance, not an API integration guide.

## Runtime Meta

| Field | Value |
|---|---|
| Runtime Label | `[Codex/OpenAI baseline / KIMI / GLM / MiniMax / Claude / DeepSeek / WorkBuddy]` |
| Adapter Version | `[v0.2.2]` |
| Evaluation Track | `[Standard unless API/data/security integration triggers Enterprise]` |
| Evidence Source | `[manual trial / seed-user trial / self-review / docs review]` |

## Fit Summary

- Candidate roles to test: `[AI PM / Execution / Validation / Governance / Writeback]`
- Use with caution: `[role or workflow]`
- Not fit without Enterprise review: `[API integration / real data / unattended or automated writeback / connector writes / benchmark claims]`

## Context Packet

Provide this runtime with:

1. ANDS-T task card.
2. Track Decision Card.
3. Gate Checklist.
4. Agent role assignment.
5. Desensitization boundary.
6. Required output format.

## Runtime Prompt Packet

```text
You are operating as [role] under AI-Native Development System (ANDS).
Use the provided ANDS-T, Track, Gate Checklist, and output format.
Before answering, restate the active role, active Gate, non-goals, and forbidden expansions.
Do not invent missing project facts.
Do not expose real names, organizations, repositories, domains, IPs, local paths, credentials, or sensitive business data.
Return evidence, caveats, and next-step recommendations.
For Execution Agent work, return only the requested deliverable, assumptions, evidence, and handoff notes.
For Validation Agent work, map every Gate Checklist item to status, evidence, missing evidence, and requested fix.
For Writeback Agent work, return candidate-only Lessons and reusable-rule candidates. Do not persist unless the human explicitly requested draft generation to a specific allowed path in the current project context; never perform unattended persistence, Vault scans, GitHub sync, provider workspace writes, or enterprise-system updates.
```

## Validation Prompt

```text
Review the output against the active Gate and acceptance criteria.
Classify the result as PASS, PASS_WITH_NOTE, PASS_WITH_FIXES, or FAIL.
List every Gate Checklist item with status, evidence, missing evidence, requested fix, and whether Enterprise escalation is required.
```

## Known Failure Modes

| Failure Mode | Guardrail |
|---|---|
| Role drift | Re-state role and active Gate before each major output |
| Execution expansion | Return only the requested deliverable, assumptions, evidence, and handoff notes |
| Unsupported API claim | Mark API/runtime integration as future Enterprise scope |
| Weak desensitization | Require explicit red-line scan before sharing or writeback |
| Vague validation | Require PASS / PASS_WITH_NOTE / PASS_WITH_FIXES / FAIL plus per-item Gate evidence |
| Accidental persistence | Keep writeback candidate-only unless a human explicitly requests draft generation to one allowed local path |

## Gate 5 Note

If the adapter card produces reusable runtime guidance, write back only the generic rule after human review. Keep provider-specific trial facts in the project until they are reviewed, and do not authorize connector, provider workspace, GitHub, or enterprise-system writeback from this card.
