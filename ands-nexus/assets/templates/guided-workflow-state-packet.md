# Guided Workflow State Packet Template

Use this template to carry visible workflow state between guided ANDS prompts. Copy the filled packet into the next prompt; do not rely on hidden state or tool memory.

## Copy Rules

- Keep field names unchanged.
- Use synthetic or desensitized identifiers.
- Mark unknown values as `unclear` instead of inventing evidence.
- Keep owner decisions explicit.
- Preserve boundary flags when moving to the next step.

## State Packet

| Field | Value | Fill Note |
|---|---|---|
| `workflow_id` | `[GW-SYN-001]` | Use a synthetic run identifier |
| `current_step` | `[Intake | ANDS-T | Gate | Lessons]` | Name the step being returned |
| `user_goal` | `[one-sentence goal]` | Keep it short enough to repeat |
| `audience` | `[manager | PM | engineer | governance reviewer | mixed]` | Name who will read or approve the work |
| `data_class` | `[synthetic | desensitized | requires Enterprise review]` | Escalate if real data or sensitive material appears |
| `track` | `[Quick | Standard | Enterprise | unclear]` | Include the reason in the current artifact |
| `active_role` | `[AI PM | Execution | Validation | Governance | Validation + Governance | Writeback]` | Use `Validation + Governance` for Track + Gate Checklist when escalation rules are being checked; do not merge approval authority |
| `artifacts_created` | `[list produced artifacts]` | Example: Intake Snapshot, ANDS-T, Gate Checklist |
| `missing_evidence` | `[list missing evidence or none]` | Missing evidence is not approval |
| `owner_decision` | `[decision required from human owner]` | Continue, revise, escalate, approve, or stop |
| `next_prompt` | `[copy-ready prompt for next step]` | Include enough state for the next turn |
| `boundary_flags` | `[Enterprise triggers; Non-Scope: no provider-native validation, no API integration, no credential setup, no tenant connectors, no automated writeback, no benchmark ranking]` | Repeat if scope pressure appears |

## Minimum Output Shape

```markdown
## Current Artifact

[Current step output]

## State Packet

[Filled table]

## Gate / Evidence Check

[Evidence, missing evidence, or escalation]

## Owner Decision

[Human decision required]

## Next Prompt

[Copy-ready prompt]

## Boundary Reminder

Non-Scope: no provider-native validation, no API integration, no credential setup, no tenant connectors, no automated writeback, no benchmark ranking.
```
