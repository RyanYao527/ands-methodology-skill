# Start Here

This is the shortest path for trying `ands-nexus` after installation.

Use this file when you want to run one small ANDS workflow without reading the full reference set first.

## What This Skill Is For

`ands-nexus` helps teams turn AI-assisted work into clearer tasks, roles, evidence, acceptance, and reusable lessons.

It is most useful when a team needs to answer:

- What exactly should the AI agent do?
- Which human owns the decision and acceptance?
- Which Gate or Track is appropriate?
- What evidence is enough to move forward?
- What should be written back as reusable knowledge?

## Guided Workflow First Run

1. Open `examples/guided-workflow-first-run-v0.4.md`.
2. Copy the first prompt into Codex with `$ands-nexus` enabled.
3. Use a synthetic or desensitized task, such as: "add a weekly export to an internal reporting tool."
4. Run one step at a time: Intake Snapshot, ANDS-T Task Card, Track + Gate Checklist, and Lessons Draft.
5. Check whether each answer includes Current Artifact, State Packet, Gate / Evidence Check, Owner Decision, Next Prompt, and Boundary Reminder.

Expected result: a small, reviewable workflow packet that a human owner can approve, reject, or revise.

## Compact First Run

For the older compact path, open `examples/first-run-prompt-packet-v0.3.1.md`. It returns a shorter ANDS-T + Gate + Lessons packet without the full visible state loop.

## Choose A Track

| Track | Use When | Keep It Small By |
|---|---|---|
| Quick | Low-risk writing, planning, or explanation | One output, light checklist |
| Standard | Internal workflow, reusable template, or agent handoff | Explicit owner, Gate checklist, validation evidence |
| Enterprise | Real customer data, credentials, tenant systems, connectors, live provider work, or public claims | Require approval, preflight, audit trail, and rollback plan |

## What To Save

Save reusable output as project-local notes first:

- ANDS-T task card.
- Gate Checklist.
- Track decision.
- Agent Matrix.
- Lessons or regression prompt.

Write back to a broader methodology only after review confirms the lesson is reusable across projects.

## Boundaries

v0.4.0 keeps the same public boundary as v0.3.x:

- no provider-native validation;
- no API integration;
- no credential setup;
- no tenant connectors;
- no automated writeback;
- no benchmark ranking.

For provider/runtime adaptation, treat labels as routing hypotheses until stronger evidence exists.
