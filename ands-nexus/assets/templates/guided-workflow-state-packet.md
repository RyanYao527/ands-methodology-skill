# Guided Workflow State Packet Template

Use this template to carry visible workflow state between guided ANDS prompts. Copy the filled packet into the next prompt; do not rely on hidden state or tool memory.

## Copy Rules

- Keep field names unchanged.
- Use synthetic or desensitized identifiers.
- Mark unknown values as `unclear` instead of inventing evidence.
- Keep owner decisions explicit.
- Carry the human `owner_response` separately from the required `owner_decision`.
- Preserve boundary flags when moving to the next step.
- Use the Markdown table for review and the bullet-list state block inside `Next Prompt` for copying.

## State Packet

| Field | Value | Fill Note |
|---|---|---|
| `workflow_id` | `[GW-SYN-001]` | Use a synthetic run identifier |
| `current_step` | `[Intake / ANDS-T / Gate / Lessons / unclear]` | Name the step being returned |
| `user_goal` | `[one-sentence goal]` | Keep it short enough to repeat |
| `audience` | `[manager / PM / engineer / governance reviewer / mixed / unclear]` | Name who will read or approve the work |
| `data_class` | `[synthetic / desensitized / requires Enterprise review / unclear]` | Escalate if real data or sensitive material appears |
| `track` | `[Quick / Standard / Enterprise / unclear]` | Include the reason in the current artifact |
| `active_role` | `[AI PM / Execution / Validation / Governance / Validation + Governance / Writeback / unclear]` | In the returned State Packet, name the role for the step just produced; in Next Prompt embedded state, pre-set the next role |
| `artifacts_created` | `[list produced artifacts]` | Example: Intake Snapshot, ANDS-T, Gate Checklist |
| `missing_evidence` | `[list missing evidence or none]` | Missing evidence is not approval |
| `owner_decision` | `[decision required from human owner]` | Continue, revise, escalate, approve, or stop |
| `owner_response` | `[unfilled / confirm: ... / revise: ... / escalate: ... / stop: ...]` | The human owner's actual reply; do not invent it |
| `next_prompt` | `[copy-ready prompt for next step]` | Include enough state for the next turn |
| `boundary_flags` | `[Enterprise triggers; Non-Scope: no provider-native validation, no API integration, no credential setup, no tenant connectors, no unattended or automated writeback, no benchmark ranking]` | Repeat if scope pressure appears |

## State Timing

- The returned `State Packet` describes the step just produced.
- The `Next Prompt embedded state` may pre-set `active_role` for the next step so the next agent turn activates the right responsibility.
- `owner_response` must be copied from the human reply. If the human has not replied, keep it `unfilled` and keep related evidence missing.

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

Non-Scope: no provider-native validation, no API integration, no credential setup, no tenant connectors, no unattended or automated writeback, no benchmark ranking.
```
