# Multi-Agent / Multi-Model Adaptation

## Purpose

Use this reference when adapting ANDS workflows to another agent or model runtime. The goal is to keep ANDS-T, Track, Gate, validation, and writeback behavior comparable across runtimes.

This reference supports Codex/OpenAI baseline, KIMI, GLM, MiniMax, Claude, DeepSeek, and WorkBuddy as runtime labels for profile and forward-test work.

## Boundary

This is methodology and prompt-level guidance.

It does not provide:

- no live provider API integration.
- Non-Scope: no credential or tenant setup.
- SDK code.
- no automated writeback from non-Codex runtimes.
- no public benchmark ranking or claims about provider capability.

Enterprise trigger: escalate when real data, credentials, tenant integration, automated writeback, or public benchmark claims enter scope.

## v0.3 Provider Profile Boundary

v0.3 provider profile material is example-only prompt/profile proxy guidance. It is not provider-native evidence and it carries no live API authorization, no credential or tenant setup, no connectors, no tools, no transcripts, no automated writeback, no rankings, no procurement guidance, no release copy, and no public capability claims.

Use provider labels as routing hypotheses for offline trials. Do not treat a label as proof of runtime behavior.

## Adapter Contract

An ANDS-compatible runtime must preserve:

| Capability | Requirement |
|---|---|
| Task framing | Restate goal, scope, constraints, inputs, outputs, acceptance, and non-goals |
| Role discipline | Stay inside AI PM, Execution Agent, Validation Agent, Governance Reviewer, or Writeback Agent |
| Gate reasoning | Identify the active Gate and required evidence |
| Track selection | Classify Quick / Standard / Enterprise and explain escalation triggers |
| Evidence output | Return validation evidence, caveats, and next-step recommendations |
| Desensitization | Avoid real names, organizations, repositories, domains, IPs, local paths, credentials, and sensitive business data |
| Writeback boundary | Distinguish project-local facts, package assets, and cross-project reusable methodology rules |
| Evidence class | Label provider profile observations as `proxy` unless a later approved trial records stronger evidence |
| Secret class | Use S0/S1 only; do not ask for real keys, tokens, OAuth credentials, or secret-like values |
| Tenant class | Use T0/T1 only; do not use real provider projects, workspaces, orgs, endpoints, consoles, or enterprise tenants |
| Connector class | Keep tools, MCP, browser, shell, desktop, local files, WeCom, QQ, and enterprise connectors disabled unless approved |
| Claim boundary | Record observations only; no scores, ranks, winners, public capability claims, or procurement guidance |

## Runtime Roles

| ANDS Role | Runtime Requirement |
|---|---|
| AI PM / Orchestrator | Decompose work, assign roles, preserve Track and Gate state |
| Execution Agent | Produce scoped deliverables and evidence without expanding scope |
| Validation Agent | Verify acceptance and classify result |
| Governance Reviewer | Inspect risk, desensitization, release boundary, and escalation |
| Writeback Agent | Produce project-local Lessons and reusable-rule candidates |

## Role-Specific Boundaries

- Execution boundary: produce only the requested deliverable, assumptions, evidence, caveats, and handoff notes.
- Validation boundary: itemize every Gate Checklist row with status, evidence, missing evidence, and requested fix.
- Writeback boundary: produce candidate-only Lessons and reusable-rule candidates unless Enterprise review approves persistence.

## Context Packet

Give every runtime the same packet before comparing outputs:

1. ANDS-T task card.
2. Track Decision Card.
3. Gate Checklist.
4. Agent role assignment.
5. Desensitization boundary.
6. Required output format.
7. Validation rubric.

Change one runtime variable at a time. Keep task, context, and scoring stable.

## Standard Runtime Prompt

```text
You are operating as [role] under AI-Native Development System (ANDS).
Use the provided ANDS-T, Track Decision Card, Gate Checklist, and output format.
Before answering, restate the active role, active Gate, non-goals, and forbidden expansions.
Do not invent missing project facts.
Do not expose real names, organizations, repositories, domains, IPs, local paths, credentials, or sensitive business data.
Return evidence, caveats, and next-step recommendations.
Classify any validation result as PASS, PASS_WITH_NOTE, PASS_WITH_FIXES, or FAIL.
For Execution Agent work, return only the requested deliverable, assumptions, evidence, and handoff notes.
For Validation Agent work, map every Gate Checklist item to status, evidence, missing evidence, and requested fix.
For Writeback Agent work, return candidate-only Lessons and reusable-rule candidates; do not perform persistence.
```

## Runtime Selection

Use provider profiles to choose a runtime for a role. Do not choose based on unsupported claims. Prefer forward-test evidence and record unknowns as unknown.

| Question | Use |
|---|---|
| Can the runtime follow role and Gate constraints? | role assignment |
| Can it preserve frontmatter, tables, and checklists? | structured-output work |
| Can it state uncertainty without inventing facts? | governance and validation |
| Can it produce reusable Lessons without leaking project facts? | writeback |

## Offline Provider Routing Hypotheses

These are starting hypotheses for offline prompt/profile trials, not provider selection advice.

| Request pattern | Starting role | Offline profile hypothesis | Required handoff | Stop condition |
|---|---|---|---|---|
| Convert unclear request into ANDS-T, Track, roles, and next actions | AI PM / Orchestrator | GLM / Z.AI | ANDS-T summary, Track, Gate, role map, acceptance checklist | Any claim of live API, tenant, tool, or public capability |
| Produce a strict markdown deliverable from a supplied packet | Execution Agent | MiniMax | Deliverable only, preserved tables, exact requested sections | File, MCP, multimodal, tool, API, or extra-section expansion |
| Produce bilingual Chinese/English execution output | Execution Agent | KIMI / Moonshot | Deliverable, assumptions, evidence, caveats, preserved bilingual wording | Endpoint, tool, long-context, retention, or live provider claim |
| Review boundaries, risks, stop conditions, and governance fixes | Governance Reviewer | Claude / Anthropic | Critical / Important / Advisory findings with evidence references | Procurement, ranking, workspace, retention, or public capability claim |
| Check acceptance criteria, evidence gaps, and correction requests | Validation Agent | DeepSeek | Acceptance criterion, evidence found, gap, correction request table | Behavior-parity, tool-call, API, or public capability claim |
| Plan enterprise connector workflow and no-go triggers | AI PM / Enterprise Integration Reviewer | WorkBuddy / Tencent Cloud | Workflow observations, connector risks, blocked live actions | Install/open/connect/configure/authenticate/local/tenant/QQ/WeCom/writeback action |

## Failure Modes And Guardrails

| Failure Mode | Guardrail |
|---|---|
| Role drift | Re-state role and active Gate before each major output |
| Over-broad scope | Require non-goals and Track before execution |
| Execution expansion | Return only the requested deliverable, assumptions, evidence, and handoff notes |
| Unsupported integration claim | Place live provider API work in future Enterprise scope |
| Weak desensitization | Run explicit red-line scan before sharing or writeback |
| Vague validation | Require PASS / PASS_WITH_NOTE / PASS_WITH_FIXES / FAIL plus per-item Gate evidence |
| Accidental persistence | Keep writeback as candidate-only unless Enterprise review approves persistence |
| Benchmark overreach | Record observations, not rankings |

## Provider Profile Handoff

When handing off provider profile work for validation, include:

1. Provider label.
2. Active role.
3. Active Gate.
4. Evidence level, normally `proxy`.
5. Data class, normally synthetic-only.
6. Secret, tenant, connector, and writeback classes.
7. Routing reason.
8. Packet used.
9. Output to validate.
10. Escalation boundary for API, secret, tenant, connector, tool, local operation, writeback, public claim, benchmark, or provider behavior claim.

## Enterprise Escalation

Escalate when any of these enter scope:

- live provider API calls.
- Enterprise trigger: credentials, tokens, tenant setup, or private connectors.
- real project data sent to an external runtime.
- Enterprise trigger: automated writeback into Obsidian, GitHub, or enterprise knowledge systems.
- public comparative benchmark claims.

## Gate 5 Writeback

Write back only reusable ANDS rules after human review. Keep provider-specific trial notes in project-local validation records until they have enough evidence to become general guidance.
