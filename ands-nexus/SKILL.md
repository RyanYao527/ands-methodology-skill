---
name: ands-nexus
description: "Use when helping teams adopt or practice AI-Native Development System (ANDS): organization-level AI-native software development standards, ANDS-K/T/A/W/G, AI-as-employee operating model, Obsidian knowledge systems, GitHub execution database, AI Agent matrices, AI Gateway concepts, ANDS-T task writing, Track selection, Gate governance, release asset snapshots, Lessons writeback, metrics, internal rollout plans, workshops, and management briefings."
---

# ANDS Nexus

Use this skill to help teams understand, adopt, practice, or review AI-Native Development System (ANDS). Keep answers operational: produce decisions, routes, plans, templates, checklists, or review notes instead of long course-style explanations.

## Workflow

1. Identify the user's task type and audience.
2. Read only the mapped reference files or templates needed for that task.
3. Produce a directly usable output matched to the user's role.
4. Check the output against the ANDS principles below.
5. When the work creates a reusable decision, prompt, template, lesson, or governance change, include a Gate 5 / knowledge writeback reminder.

## Task Routing

| User task | Read | Output |
|---|---|---|
| Explain ANDS | `references/overview.md`, `references/glossary.md` | One-page explanation with fit / non-fit boundaries |
| Plan team adoption | `references/adoption-playbook.md`, `references/governance-and-metrics.md`, `assets/templates/30-day-pilot-template.md`, `examples/management-rollout-plan.md` | 30/60/90-day rollout, pilot plan, risks |
| Draft ANDS standards | `references/standards-k-t-a-w-g.md` | ANDS-K/T/A/W/G draft or review |
| Rewrite a task as ANDS-T | `references/standards-k-t-a-w-g.md`, `assets/templates/ands-t-template.md` | ANDS-T task card |
| Design Agent roles | `references/methodology-10-models.md`, `references/platform-5-components.md`, `assets/templates/agent-matrix-template.md` | L1/L2/L3 Agent matrix and AI PM prompt |
| Adapt ANDS to another agent/model runtime | `references/multi-agent-model-adaptation.md`, `assets/templates/agent-model-adapter-card.md`, `assets/templates/capability-matrix-template.md` | Provider profile, runtime prompt packet, forward-test plan |
| Run a first ANDS workflow | `examples/first-run-prompt-packet-v0.3.1.md`, `references/glossary.md`, `assets/templates/ands-t-template.md`, `assets/templates/gate-checklist.md`, `assets/templates/lessons-template.md` | 10-minute ANDS-T, Gate Checklist, and Lessons draft |
| Run guided ANDS workflow | `references/guided-workflow-mvp.md`, `references/glossary.md`, `assets/templates/guided-workflow-state-packet.md`, `assets/templates/ands-t-template.md`, `assets/templates/gate-checklist.md`, `assets/templates/lessons-template.md`, `examples/guided-workflow-first-run-v0.4.md` | Current Artifact, State Packet, Gate / Evidence Check, Owner Decision, Next Prompt, and Boundary Reminder |
| Check role-routing regressions | `examples/role-routing-regression-scenarios-v0.3.1.md`, `references/multi-agent-model-adaptation.md`, `references/governance-and-metrics.md` | Role-routing pass/fail notes and regression prompt candidates |
| Design governance | `references/governance-and-metrics.md`, `assets/templates/gate-checklist.md`, `assets/templates/track-decision-card.md` | Track decision and Gate checklist |
| Review a delivery or incident | `references/demo-trace-guide.md`, `references/governance-and-metrics.md`, `assets/templates/lessons-template.md` | Lessons, follow-up issue, standard update |
| Prepare internal training | `references/overview.md`, `references/demo-trace-guide.md`, `references/adoption-playbook.md` | Briefing outline or workshop script |
| Triage seed-user feedback | `references/adoption-playbook.md`, `references/governance-and-metrics.md` | Desensitized feedback classification and regression prompt |
| Triage post-release feedback | `examples/post-release-feedback-intake-v0.3.1.md`, `references/governance-and-metrics.md` | Desensitized feedback intake, Track decision, regression prompt |
| Review ANDS anti-patterns | `references/adoption-playbook.md`, `references/governance-and-metrics.md` | Anti-pattern diagnosis and corrected Track/Gate guidance |
| Draft Obsidian writeback | `references/governance-and-metrics.md`, `assets/templates/writeback-note-template.md` | Project-local writeback draft with backlinks |

If a referenced file or template is missing, state the missing artifact and proceed with the best available concise structure.

If a request matches multiple routing rows, choose the row matching the user's primary ask first, then include only the extra mapped files needed to satisfy explicit secondary asks. Keep non-scope wording explicit when declining expansions: no live provider API integration, no tenant connectors, no unattended or automated writeback, and no benchmark ranking.

## Output Level

For managers:

- Lead with the conclusion and decision points.
- Prefer roadmaps, decision tables, risk lists, ownership, effort, governance, and metrics.
- Keep tool details secondary unless they affect adoption risk or cost.

For practitioners:

- Lead with the requested template or working artifact.
- Prefer ANDS-T, ADR, Gate, Track, Lessons, Agent matrix, and concrete next steps.
- Make acceptance and handoff criteria explicit.

## ANDS Principle Check

Before answering, verify that the output:

- Keeps human = decision + validation, AI = execution + assisted analysis.
- Treats knowledge assets and standards as the durable advantage, not just tools.
- Distinguishes AI PM decision-level orchestration from AI Gateway mechanical routing.
- Distinguishes Acceptance, Gate 2 machine quality, and Gate 3 human acceptance.
- Uses Quick / Standard / Enterprise Track to scale governance effort.
- Treats metrics as input to review and standards iteration, not only reporting.

## Gate 5 / Knowledge Writeback

When the answer produces reusable knowledge, suggest where it should be written back: Technical, Prompt, Product, Decision, or Lessons. Do not modify a knowledge base unless the user explicitly asks.

For Obsidian writeback drafts, keep project facts in the project first. Boundary wording: no unattended or automated writeback; user-invoked draft generation to an explicit path is allowed only when explicitly requested. If script automation is appropriate, use `scripts/new_writeback_note.ps1` only to generate a draft or write an explicitly provided output path; do not scan or bulk-modify a Vault.
