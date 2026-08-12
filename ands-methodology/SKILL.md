---
name: ands-methodology
description: "Use when helping teams adopt or practice AI-Native Development System (ANDS): organization-level AI-native software development standards, ANDS-K/T/A/W/G, AI-as-employee operating model, Obsidian knowledge systems, GitHub execution database, AI Agent matrices, AI Gateway concepts, ANDS-T task writing, Track selection, Gate governance, release asset snapshots, Lessons writeback, metrics, internal rollout plans, workshops, and management briefings."
---

# ANDS Methodology

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
| Explain ANDS | `references/overview.md` | One-page explanation with fit / non-fit boundaries |
| Plan team adoption | `references/adoption-playbook.md`, `references/governance-and-metrics.md` | 30/60/90-day rollout, pilot plan, risks |
| Draft ANDS standards | `references/standards-k-t-a-w-g.md` | ANDS-K/T/A/W/G draft or review |
| Rewrite a task as ANDS-T | `references/standards-k-t-a-w-g.md`, `assets/templates/ands-t-template.md` | ANDS-T task card |
| Design Agent roles | `references/methodology-10-models.md`, `references/platform-5-components.md`, `assets/templates/agent-matrix-template.md` | L1/L2/L3 Agent matrix and AI PM prompt |
| Design governance | `references/governance-and-metrics.md`, `assets/templates/gate-checklist.md`, `assets/templates/track-decision-card.md` | Track decision and Gate checklist |
| Review a delivery or incident | `references/demo-trace-guide.md`, `references/governance-and-metrics.md`, `assets/templates/lessons-template.md` | Lessons, follow-up issue, standard update |
| Prepare internal training | `references/overview.md`, `references/demo-trace-guide.md`, `references/adoption-playbook.md` | Briefing outline or workshop script |

If a referenced file or template is missing, state the missing artifact and proceed with the best available concise structure.

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
