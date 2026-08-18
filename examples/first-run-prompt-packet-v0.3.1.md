# First-Run Prompt Packet v0.3.1

> Goal: let a new user run one small ANDS workflow in about 10 minutes. Use synthetic or desensitized input only.

## Scenario

Use this synthetic task:

`Add a weekly export button to an internal reporting tool so an operations lead can download the previous week's summary as a CSV.`

## Prompt 1: Create The ANDS-T

```text
$ands-nexus

Act as the AI PM / Orchestrator.

Rewrite this request as a concise ANDS-T:

"Add a weekly export button to an internal reporting tool so an operations lead can download the previous week's summary as a CSV."

Return only:
1. Task summary.
2. Track recommendation.
3. Inputs and assumptions.
4. Non-goals.
5. Acceptance criteria.
6. Required Gate checks.
7. Owner decision points.

Use synthetic-only context. Keep Non-Scope: no API integration, no credential setup, no tenant connectors, no automated writeback, and no provider comparison.
```

Expected output: a Standard Track task card unless the answer explains why Quick is enough.

## Prompt 2: Validate With A Gate Checklist

```text
$ands-nexus

Act as the Validation Agent.

Using the ANDS-T from the previous answer, produce a Gate Checklist.

Return a table with:
- Gate.
- Check.
- Status.
- Evidence needed.
- Owner action if missing.

Keep Acceptance, Gate 2 machine quality, and Gate 3 human acceptance separate.
Do not execute tools, touch files, connect systems, or persist anything.
```

Expected output: clear separation between implementation quality evidence and human acceptance evidence.

## Prompt 3: Draft Lessons

```text
$ands-nexus

Act as the Writeback Agent.

Draft a project-local Lessons note for this first run.

Return only:
1. What was reusable.
2. What should stay project-specific.
3. One regression prompt candidate.
4. Suggested writeback target.
5. Items that need human review before reuse.

Do not write to Obsidian, GitHub, files, provider workspaces, or enterprise systems.
```

Expected output: a candidate Lessons draft, not an automatic writeback.

## Pass Criteria

| Check | Pass Signal |
|---|---|
| Track selected | Quick, Standard, or Enterprise is named with a reason. |
| Role is explicit | AI PM, Validation Agent, and Writeback Agent stay separate. |
| Gates are concrete | Each Gate has evidence or a missing-evidence action. |
| Acceptance is separate | Human acceptance is not merged with machine checks. |
| Boundary is preserved | No provider-native validation, no API integration, no credential setup, no tenant connectors, no automated writeback, no benchmark ranking. |

## If It Fails

Use `post-release-feedback-intake-v0.3.1.md` to record the issue. Keep the report synthetic or desensitized.
