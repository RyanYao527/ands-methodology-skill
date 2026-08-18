# Guided Workflow First Run v0.4

> Goal: run one four-step guided ANDS workflow with synthetic material only. This example is a v0.4 candidate asset and does not indicate a public v0.4.0 release.

## Scenario

Use this synthetic task:

`Add a weekly export button to an internal reporting tool so an operations lead can download the previous week's summary as a CSV.`

## Step 1 Prompt: Intake Snapshot

```text
$ands-nexus

Run guided ANDS workflow for this synthetic task:
"Add a weekly export button to an internal reporting tool so an operations lead can download the previous week's summary as a CSV."

Return the first step only. Include Current Artifact, State Packet, Gate / Evidence Check, Owner Decision, Next Prompt, and Boundary Reminder.
```

Expected output:

## Current Artifact

Intake Snapshot:

| Field | Draft |
|---|---|
| Goal | Add a weekly CSV export button for an internal reporting page |
| Audience | PM and engineer |
| Data class | Synthetic |
| Track candidate | Standard |
| Main uncertainty | Export fields, file naming, owner acceptance, and failure behavior |

## State Packet

| Field | Value |
|---|---|
| `workflow_id` | `GW-SYN-001` |
| `current_step` | `Intake` |
| `user_goal` | Add a weekly CSV export button to an internal reporting page |
| `audience` | PM and engineer |
| `data_class` | synthetic |
| `track` | Standard |
| `active_role` | AI PM |
| `artifacts_created` | Intake Snapshot |
| `missing_evidence` | export fields, filename convention, acceptance owner |
| `owner_decision` | Confirm Standard Track and provide missing evidence |
| `next_prompt` | Continue this guided workflow from Intake to ANDS-T using workflow_id GW-SYN-001. Preserve synthetic-only context and include the missing evidence list. |
| `boundary_flags` | Non-Scope: no provider-native validation, no API integration, no credential setup, no tenant connectors, no automated writeback, no benchmark ranking |

## Gate / Evidence Check

Gate 1 is incomplete until the owner confirms fields, naming, and acceptance owner. No implementation should start yet.

## Owner Decision

Continue as Standard Track, revise scope, or escalate if real data or tenant systems enter the task.

## Next Prompt

```text
$ands-nexus

Continue this guided workflow from Intake to ANDS-T.

State:
- workflow_id: GW-SYN-001
- current_step: Intake
- user_goal: Add a weekly CSV export button to an internal reporting page.
- audience: PM and engineer
- data_class: synthetic
- track: Standard
- active_role: AI PM
- artifacts_created: Intake Snapshot
- missing_evidence: export fields, filename convention, acceptance owner
- owner_decision: Confirm Standard Track and provide missing evidence
- next_prompt: Continue this guided workflow from Intake to ANDS-T using workflow_id GW-SYN-001.
- boundary_flags: Non-Scope: no provider-native validation, no API integration, no credential setup, no tenant connectors, no automated writeback, no benchmark ranking

Return the ANDS-T step only with Current Artifact, State Packet, Gate / Evidence Check, Owner Decision, Next Prompt, and Boundary Reminder.
```

## Boundary Reminder

Use synthetic or desensitized context only. Non-Scope: no provider-native validation, no API integration, no credential setup, no tenant connectors, no automated writeback, no benchmark ranking.

## Step 2 Prompt: ANDS-T Task Card

```text
$ands-nexus

Continue this guided workflow from Intake to ANDS-T.

State:
- workflow_id: GW-SYN-001
- current_step: Intake
- user_goal: Add a weekly CSV export button to an internal reporting page.
- audience: PM and engineer
- data_class: synthetic
- track: Standard
- active_role: AI PM
- artifacts_created: Intake Snapshot
- missing_evidence: export fields, filename convention, acceptance owner
- owner_decision: Confirm Standard Track and provide missing evidence
- next_prompt: Continue this guided workflow from Intake to ANDS-T using workflow_id GW-SYN-001.
- boundary_flags: Non-Scope: no provider-native validation, no API integration, no credential setup, no tenant connectors, no automated writeback, no benchmark ranking

Return the ANDS-T step only with Current Artifact, State Packet, Gate / Evidence Check, Owner Decision, Next Prompt, and Boundary Reminder.
```

Expected output:

## Current Artifact

ANDS-T Task Card:

| Section | Draft |
|---|---|
| Goal | Add a weekly CSV export button for a synthetic internal reporting page |
| Inputs | Existing report table, synthetic weekly summary fields, target filename convention |
| Non-goals | No provider trials, no tenant connectors, no persistence automation |
| Acceptance | Downloaded CSV contains approved fields, covers previous week, opens in a spreadsheet, and shows a clear empty-state message when no rows exist |
| Owner | Product or operations owner confirms fields and acceptance |
| Track | Standard because it changes an internal workflow and needs human acceptance |

## State Packet

| Field | Value |
|---|---|
| `workflow_id` | `GW-SYN-001` |
| `current_step` | `ANDS-T` |
| `user_goal` | Add a weekly CSV export button to an internal reporting page |
| `audience` | PM and engineer |
| `data_class` | synthetic |
| `track` | Standard |
| `active_role` | AI PM |
| `artifacts_created` | Intake Snapshot; ANDS-T Task Card |
| `missing_evidence` | approved export fields; owner acceptance record; Gate 2 test evidence |
| `owner_decision` | Approve or revise the ANDS-T before execution |
| `next_prompt` | Continue this guided workflow from ANDS-T to Track + Gate Checklist for workflow_id GW-SYN-001. |
| `boundary_flags` | Non-Scope: no provider-native validation, no API integration, no credential setup, no tenant connectors, no automated writeback, no benchmark ranking |

## Gate / Evidence Check

Gate 1 can pass only after the owner confirms the export fields and acceptance owner. Gate 2 and Gate 3 evidence are not yet available.

## Owner Decision

Approve the ANDS-T for execution, request edits, or stop.

## Next Prompt

```text
$ands-nexus

Continue this guided workflow from ANDS-T to Track + Gate Checklist.

State:
- workflow_id: GW-SYN-001
- current_step: ANDS-T
- user_goal: Add a weekly CSV export button to an internal reporting page.
- audience: PM and engineer
- data_class: synthetic
- track: Standard
- active_role: Validation + Governance
- artifacts_created: Intake Snapshot; ANDS-T Task Card
- missing_evidence: approved export fields; owner acceptance record; Gate 2 test evidence
- owner_decision: Approve or revise the ANDS-T before execution
- next_prompt: Continue this guided workflow from ANDS-T to Track + Gate Checklist for workflow_id GW-SYN-001.
- boundary_flags: Non-Scope: no provider-native validation, no API integration, no credential setup, no tenant connectors, no automated writeback, no benchmark ranking

Return the Gate step only with Current Artifact, State Packet, Gate / Evidence Check, Owner Decision, Next Prompt, and Boundary Reminder.
```

## Boundary Reminder

Do not treat the ANDS-T as implementation or approval. Non-Scope: no provider-native validation, no API integration, no credential setup, no tenant connectors, no automated writeback, no benchmark ranking.

## Step 3 Prompt: Track + Gate Checklist

```text
$ands-nexus

Continue this guided workflow from ANDS-T to Track + Gate Checklist.

State:
- workflow_id: GW-SYN-001
- current_step: ANDS-T
- user_goal: Add a weekly CSV export button to an internal reporting page.
- audience: PM and engineer
- data_class: synthetic
- track: Standard
- active_role: Validation + Governance
- artifacts_created: Intake Snapshot; ANDS-T Task Card
- missing_evidence: approved export fields; owner acceptance record; Gate 2 test evidence
- owner_decision: Approve or revise the ANDS-T before execution
- next_prompt: Continue this guided workflow from ANDS-T to Track + Gate Checklist for workflow_id GW-SYN-001.
- boundary_flags: Non-Scope: no provider-native validation, no API integration, no credential setup, no tenant connectors, no automated writeback, no benchmark ranking

Return the Gate step only with Current Artifact, State Packet, Gate / Evidence Check, Owner Decision, Next Prompt, and Boundary Reminder.
```

Expected output:

## Current Artifact

Track + Gate Checklist:

| Gate | Status | Evidence | Missing Evidence | Owner Action |
|---|---|---|---|---|
| Gate 1 Intake | Conditional | Synthetic task and ANDS-T exist | Field list and acceptance owner | Owner confirms or revises |
| Gate 2 Machine Quality | Missing | None yet | Tests or equivalent checks for export behavior | Execution produces evidence |
| Gate 3 Human Acceptance | Missing | None yet | Owner confirms CSV fields and usability | Owner reviews after Gate 2 |
| Gate 4 Release Approval | Not ready | Scope is internal and Standard Track | Release note or rollout note if needed | Decide whether release approval is needed |
| Gate 5 Lessons | Not ready | Candidate prompt exists | Final outcome | Draft after review |

## State Packet

| Field | Value |
|---|---|
| `workflow_id` | `GW-SYN-001` |
| `current_step` | `Gate` |
| `user_goal` | Add a weekly CSV export button to an internal reporting page |
| `audience` | PM and engineer |
| `data_class` | synthetic |
| `track` | Standard |
| `active_role` | Validation + Governance |
| `artifacts_created` | Intake Snapshot; ANDS-T Task Card; Gate Checklist |
| `missing_evidence` | Gate 2 test evidence; Gate 3 owner acceptance; Gate 5 final outcome |
| `owner_decision` | Decide whether evidence is sufficient to proceed or request fixes before continuing |
| `next_prompt` | Continue this guided workflow from Gate Checklist to Lessons for workflow_id GW-SYN-001. |
| `boundary_flags` | Non-Scope: no provider-native validation, no API integration, no credential setup, no tenant connectors, no automated writeback, no benchmark ranking |

## Gate / Evidence Check

Gate 2 machine quality and Gate 3 human acceptance remain separate. Missing evidence must stay marked as missing.

## Owner Decision

Request execution evidence, approve the evidence plan, or escalate if sensitive data or tenant systems appear.

## Next Prompt

```text
$ands-nexus

Continue this guided workflow from Gate Checklist to Lessons.

State:
- workflow_id: GW-SYN-001
- current_step: Gate
- user_goal: Add a weekly CSV export button to an internal reporting page.
- audience: PM and engineer
- data_class: synthetic
- track: Standard
- active_role: Writeback
- artifacts_created: Intake Snapshot; ANDS-T Task Card; Gate Checklist
- missing_evidence: Gate 2 test evidence; Gate 3 owner acceptance; Gate 5 final outcome
- owner_decision: Request execution evidence, approve the evidence plan, or escalate before Lessons if evidence is missing
- next_prompt: Draft candidate Lessons only for workflow_id GW-SYN-001.
- boundary_flags: Candidate-only writeback; Non-Scope: no provider-native validation, no API integration, no credential setup, no tenant connectors, no automated writeback, no benchmark ranking

Draft candidate Lessons only. Do not write to files, Obsidian, GitHub, provider workspaces, or enterprise systems.
```

## Boundary Reminder

Gate 2 passing cannot replace Gate 3 owner acceptance. Non-Scope: no provider-native validation, no API integration, no credential setup, no tenant connectors, no automated writeback, no benchmark ranking.

## Step 4 Prompt: Lessons Draft

```text
$ands-nexus

Continue this guided workflow from Gate Checklist to Lessons.

State:
- workflow_id: GW-SYN-001
- current_step: Gate
- user_goal: Add a weekly CSV export button to an internal reporting page.
- audience: PM and engineer
- data_class: synthetic
- track: Standard
- active_role: Writeback
- artifacts_created: Intake Snapshot; ANDS-T Task Card; Gate Checklist
- missing_evidence: Gate 2 test evidence; Gate 3 owner acceptance; Gate 5 final outcome
- owner_decision: Request execution evidence, approve the evidence plan, or escalate before Lessons if evidence is missing
- next_prompt: Draft candidate Lessons only for workflow_id GW-SYN-001.
- boundary_flags: Candidate-only writeback; Non-Scope: no provider-native validation, no API integration, no credential setup, no tenant connectors, no automated writeback, no benchmark ranking

Draft candidate Lessons only. Do not write to files, Obsidian, GitHub, provider workspaces, or enterprise systems.
```

Expected output:

## Current Artifact

Lessons Draft:

| Section | Candidate |
|---|---|
| Reusable lesson | A guided first run should keep the next prompt and state packet visible at every step |
| Project-specific context | Weekly CSV export field names and owner acceptance details |
| Regression prompt | Ask the agent to continue from Gate to Lessons while refusing automatic writeback |
| Suggested target | Project-local Lessons draft after human review |

## State Packet

| Field | Value |
|---|---|
| `workflow_id` | `GW-SYN-001` |
| `current_step` | `Lessons` |
| `user_goal` | Add a weekly CSV export button to an internal reporting page |
| `audience` | PM and engineer |
| `data_class` | synthetic |
| `track` | Standard |
| `active_role` | Writeback |
| `artifacts_created` | Intake Snapshot; ANDS-T Task Card; Gate Checklist; Lessons Draft |
| `missing_evidence` | Gate 2 test evidence; Gate 3 owner acceptance; human review before reuse |
| `owner_decision` | Approve, revise, or decline the Lessons candidate; do not authorize broader writeback from this prompt |
| `next_prompt` | If approved, keep this candidate project-local; create no broader writeback unless a separate explicit approval exists. |
| `boundary_flags` | Candidate-only writeback; Non-Scope: no provider-native validation, no API integration, no credential setup, no tenant connectors, no automated writeback, no benchmark ranking |

## Gate / Evidence Check

Gate 5 remains open until a human reviews whether the lesson is reusable and whether any project-specific context should stay local.

## Owner Decision

Approve the candidate, request edits, or mark no writeback needed.

## Next Prompt

```text
$ands-nexus

Review this candidate Lessons draft for workflow_id GW-SYN-001.

State:
- workflow_id: GW-SYN-001
- current_step: Lessons
- user_goal: Add a weekly CSV export button to an internal reporting page.
- audience: PM and engineer
- data_class: synthetic
- track: Standard
- active_role: Writeback
- artifacts_created: Intake Snapshot; ANDS-T Task Card; Gate Checklist; Lessons Draft
- missing_evidence: Gate 2 test evidence; Gate 3 owner acceptance; human review before reuse
- owner_decision: Candidate review only; no broader writeback from this prompt
- next_prompt: Close or revise this candidate after human review.
- boundary_flags: Candidate-only writeback; Non-Scope: no provider-native validation, no API integration, no credential setup, no tenant connectors, no automated writeback, no benchmark ranking

Return only:
1. reusable lesson;
2. project-local details to remove;
3. final owner decision required;
4. confirmation that no broader writeback is authorized by this prompt.

Do not write to files, Obsidian, GitHub, provider workspaces, or enterprise systems.
```

## Boundary Reminder

This is candidate-only. Do not persist to files, Obsidian, GitHub, provider workspaces, or enterprise systems without explicit approval.

## Pass Criteria

| Check | Pass Signal |
|---|---|
| Step control | Each prompt returns the current step only |
| State continuity | The state packet carries all required fields |
| Role separation | AI PM, Validation, Governance, and Writeback stay within their authority |
| Gate clarity | Gate 2 machine quality and Gate 3 human acceptance stay separate |
| Boundary control | Enterprise triggers stop unsafe expansion |
