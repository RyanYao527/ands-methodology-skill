# Guided Workflow MVP

Use this reference when a user asks to be guided through ANDS step by step, or when a first-time user needs a small workflow that carries state across Intake, ANDS-T, Gate, and Lessons.

The guided workflow MVP is documentation-first. It uses prompts, templates, examples, and explicit state packets. It does not require hidden tool state or a hosted workflow engine.

If the user is new to ANDS terms, read `references/glossary.md` before running the first prompt.

## Read When

- The user asks to "guide me through ANDS" or "run a guided workflow".
- The user has a vague task and needs a first ANDS-T, Gate Checklist, and Lessons draft.
- The user is new and should not have to read every reference before starting.
- The task is internal, synthetic, or desensitized and can stay in Quick or Standard Track.
- The task mentions real data, credentials, provider-native work, connectors, automated persistence, or public provider claims and needs Enterprise escalation.

## Four-Step Workflow

| Step | Active Role | Current Artifact | Gate / Evidence Focus | Owner Decision |
|---|---|---|---|---|
| 1. Intake Snapshot | AI PM / Orchestrator | Intake summary, audience, data class, Track candidate | Confirm scope, data class, missing inputs, and Enterprise triggers | Continue, revise scope, or escalate |
| 2. ANDS-T Task Card | AI PM / Orchestrator | ANDS-T with goal, inputs, non-goals, acceptance, owner, and Gate notes | Confirm task clarity and owner acceptance criteria | Approve task card, revise, or stop |
| 3. Track + Gate Checklist | Validation Agent + Governance Reviewer | Gate table with status, evidence, missing evidence, and failure action | Separate Gate 2 machine quality from Gate 3 human acceptance | Approve evidence plan, request fixes, or escalate |
| 4. Lessons Draft | Writeback Agent | Candidate Lessons note and regression prompt | Keep reusable lessons separate from project-local facts | Approve candidate, revise, or decline writeback |

## Interaction Contract

Each guided step returns exactly these reader-facing sections:

1. `Current Artifact`.
2. `State Packet`.
3. `Gate / Evidence Check`.
4. `Owner Decision`.
5. `Next Prompt`.
6. `Boundary Reminder`.

The answer should include only the current step unless the user explicitly asks for the full chain. The `Next Prompt` should be copy-ready and should include enough prior state for the next agent turn.

## State Packet Fields

Every guided step should carry these fields. Values may be short, but the field names should remain stable so the packet can be copied between prompts.

| Field | Required Use |
|---|---|
| `workflow_id` | Synthetic identifier for the run |
| `current_step` | Intake, ANDS-T, Gate, or Lessons |
| `user_goal` | Short task goal |
| `audience` | Manager, PM, engineer, governance reviewer, or mixed |
| `data_class` | Synthetic, desensitized, or requires Enterprise review |
| `track` | Quick, Standard, Enterprise, or unclear |
| `active_role` | AI PM, Execution, Validation, Governance, Validation + Governance, or Writeback |
| `artifacts_created` | List of produced artifacts |
| `missing_evidence` | Evidence needed before approval |
| `owner_decision` | Human decision required |
| `owner_response` | The human owner's actual reply, such as `confirm: ...`, `revise: ...`, `escalate: ...`, `stop: ...`, or `unfilled` |
| `next_prompt` | The exact next prompt to run |
| `boundary_flags` | Enterprise triggers or Non-Scope reminders |

State timing rule: the returned `State Packet` describes the step just produced. The `Next Prompt embedded state` may pre-set `active_role` for the next step so the next turn activates the right responsibility. Never invent `owner_response`; copy it from the human reply or keep it `unfilled`.

Owner response values in examples are format demonstrations only. Prompt blocks must use placeholders unless the human owner has already replied; never paste a prefilled sample as the human's decision.

## Guided Lite To Formal Template Mapping

The first-run example uses compact "guided lite" artifacts so a new user can finish one run quickly. For team records, map them to the formal templates before execution or release.

| Guided Output | Formal Template | Minimum Mapping |
|---|---|---|
| Intake Snapshot | `assets/templates/ands-t-template.md` | Goal, Input assumptions, Constraint, Track candidate, owner questions |
| ANDS-T Task Card | `assets/templates/ands-t-template.md` | Goal, Input, Constraint, Output, Acceptance, Track, Gate Requirement, Handoff Notes |
| Track + Gate Checklist | `assets/templates/gate-checklist.md` | Gate 1-5 status, evidence, missing evidence, owner, and failure action |
| Lessons Draft | `assets/templates/lessons-template.md` | Event, Impact, Root Cause, Detection Gate, Prevention, Knowledge Domain, Follow-up Issue |

## Role Boundaries

| Role | Does | Does Not |
|---|---|---|
| AI PM / Orchestrator | Clarifies scope, writes ANDS-T, chooses Track candidate, and names owner decisions | Does not implement, self-validate, close Gates, or write back |
| Execution | Produces the requested deliverable and implementation evidence when a task is ready | Does not approve Gate 3, publish releases, or broaden scope |
| Validation | Checks claims against evidence and records missing evidence | Does not rewrite the implementation, invent evidence, or accept without owner review |
| Governance | Applies Track, Gate, risk, and Enterprise escalation rules | Does not run provider trials, create public comparisons, or bypass approval |
| Writeback | Drafts candidate Lessons, reusable rules, and regression prompts | Does not persist unless the human explicitly requests draft generation to one allowed local path; never scans or syncs files, GitHub, provider workspaces, or enterprise systems |

## Enterprise Triggers

Escalate before continuing when a task involves:

- real customer data, private company data, or sensitive project material;
- secrets, credentials, API keys, OAuth, or tenant configuration;
- Enterprise trigger: no provider-native validation or live provider calls without explicit Enterprise approval;
- enterprise connectors or WorkBuddy tenant operations;
- unattended or automatic persistence to Obsidian, GitHub, provider workspaces, or enterprise knowledge bases;
- public provider capability claims, best-provider statements, procurement guidance, or benchmark results.

## Non-Scope Boundary

Non-Scope: no provider-native validation, no API integration, no credential setup, no tenant connectors, no unattended or automated writeback, no benchmark ranking.

Writeback boundary: no unattended or automated writeback. user-invoked draft generation to an explicit path is allowed only when explicitly requested; it is still a draft and does not authorize broader methodology or enterprise-system persistence.

This boundary is part of the guided workflow output. It should appear in the `Boundary Reminder` whenever the user asks for real data, provider trials, automated persistence, or public provider comparison.

## Prompt Pattern

```text
$ands-nexus

Run guided ANDS workflow for this synthetic task:
"[task]"

Return the current step only. Include:
1. Current Artifact.
2. State Packet.
3. Gate / Evidence Check.
4. Owner Decision.
5. Next Prompt.
6. Boundary Reminder.
```

## Pass Signals

| Check | Pass Signal |
|---|---|
| First-run clarity | The answer gives one current step and one copy-ready next prompt |
| State continuity | The State Packet can be copied into the next prompt without hidden state |
| Role separation | AI PM, Execution, Validation, Governance, and Writeback do not absorb each other's authority |
| Gate fit | Track is named with a reason and missing evidence is not treated as approval |
| Boundary control | Enterprise triggers are named before any unsafe expansion |
