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

## If you are not using Codex

`$ands-nexus` is the Codex skill trigger. If you are not using Codex, load `ands-nexus/SKILL.md` as the main instruction and attach or paste only the mapped reference/template files listed in its Task Routing table.

For a first guided run, use `ands-nexus/references/guided-workflow-mvp.md`, `ands-nexus/references/glossary.md`, `ands-nexus/assets/templates/guided-workflow-state-packet.md`, and `examples/guided-workflow-first-run-v0.4.md`.

## Core Terms

Read `ands-nexus/references/glossary.md` first if State Packet, Gate, Track, ANDS-T, Writeback, `data_class`, or `owner_response` is unfamiliar.

## Guided Workflow First Run

1. Open `examples/guided-workflow-first-run-v0.4.md`.
2. Copy the first prompt into Codex with `$ands-nexus` enabled, or follow the non-Codex loading path above.
3. Use a synthetic or desensitized task, such as: "add a weekly export to an internal reporting tool." First-run users should use a fictional task because this package rehearses the process; it does not connect to your systems.
4. Run one step at a time: Intake Snapshot, ANDS-T Task Card, Track + Gate Checklist, and Lessons Draft.
5. Check whether each answer includes Current Artifact, State Packet, Gate / Evidence Check, Owner Decision, Next Prompt, and Boundary Reminder.

If a guided answer misses one of the six sections, reply: "Your output is missing [section name]. Please return the current guided workflow step again with Current Artifact, State Packet, Gate / Evidence Check, Owner Decision, Next Prompt, and Boundary Reminder."

Expected result: a small, reviewable workflow packet that a human owner can approve, reject, or revise.

## Compact First Run

For the older compact path, open `examples/first-run-prompt-packet-v0.3.1.md`. It returns a shorter ANDS-T + Gate + Lessons packet without the full visible state loop.

## Choose A Track

| Track | Use When | Keep It Small By |
|---|---|---|
| Quick | Low-risk writing, planning, or explanation; no sensitive data, no external delivery, low blast radius, quick rollback | One output, Track reason, Gate 2 or equivalent check |
| Standard | Internal workflow, reusable template, agent handoff, or low-risk external-visible delivery without sensitive data, customer commitment, or real customer impact | Explicit owner, Gate checklist, validation evidence, stronger Gate 4 review when externally visible |
| Enterprise | Real customer data, real customer impact, production-critical path, security/compliance risk, hard rollback, cross-team impact, credentials, tenant systems, connectors, live provider work, contractual/customer commitment, or public claims | Require approval, preflight, audit trail, and rollback plan |

External-visible delivery without sensitive data, customer commitment, or real customer impact usually starts as Standard with stronger Gate 4 review unless production-critical, sensitive, hard to rollback, contractual, customer-impacting, or cross-team facts make it Enterprise.

## What To Save

Save reusable output as project-local notes first:

- ANDS-T task card.
- Gate Checklist.
- Track decision.
- Agent Matrix.
- Lessons or regression prompt.

Write back to a broader methodology only after review confirms the lesson is reusable across projects.

## Boundaries

v0.4.3 keeps the same public boundary as v0.3.x:

- no provider-native validation;
- no API integration;
- no credential setup;
- no tenant connectors;
- no unattended or automated writeback;
- no benchmark ranking.

For provider/runtime adaptation, treat labels as routing hypotheses until stronger evidence exists.

Writeback boundary: user-invoked draft generation to an explicit path is allowed only when explicitly requested. It does not authorize unattended persistence, Vault scans, GitHub sync, provider workspace writes, or enterprise-system updates.

Plain-language version: use a fictional or redacted task for the first run. The skill helps you practice the workflow and prepare reviewable drafts; it should not touch real systems, sync knowledge bases, call APIs, or claim one provider is better than another.
