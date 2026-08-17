# Provider Profile Offline Adoption Packet v0.3

> Non-Scope: this packet is a synthetic, offline prompt/profile proxy example. It carries no live provider runtime authorization, no API calls, no keys, no credential or tenant setup, no connectors, no transcripts, no automated writeback, no rankings, no procurement guidance, no release copy, and no public capability claims.

## Required Inputs

| Input | Package path |
|---|---|
| Provider profile cards | `examples/provider-profile-cards-v0.3-internal.md` |
| Multi-agent adaptation reference | `ands-nexus/references/multi-agent-model-adaptation.md` |
| Capability matrix template | `ands-nexus/assets/templates/capability-matrix-template.md` |
| Agent model adapter card | `ands-nexus/assets/templates/agent-model-adapter-card.md` |

## Fixed Synthetic Scenario

```text
We are a synthetic team trying to adopt ANDS for a small internal documentation task.
The request is unclear:
"Please organize this messy request, assign the right AI roles, check whether anything is risky, and tell us what can be reused later."
Use only synthetic examples. Do not use real company, person, repository, domain, IP, local path, credential, tenant, private endpoint, source code, customer data, regulated data, or sensitive business material.
```

## Run Steps

1. Select one provider profile from `provider-profile-cards-v0.3-internal.md`.
2. Select the matching starting role from the routing hypotheses in `multi-agent-model-adaptation.md`.
3. Copy the fixed synthetic scenario into the selected runtime prompt.
4. Produce only the offline deliverable requested by the active role.
5. Complete the handoff template.
6. Validate with a non-ranking rubric.
7. Record one qualitative label.
8. List profile wording fixes only.
9. Do not claim provider capability.

## Example Offline Adoption Result

This sample uses the GLM / Z.AI profile hypothesis because the scenario asks for orchestration. It is not a provider recommendation.

```markdown
# Offline Provider Profile Adoption Result

## Scope

| Item | Value |
|---|---|
| Provider label | GLM / Z.AI |
| Active role | AI PM / Orchestrator |
| Active Gate | Gate 1 intake and Gate 4 offline validation |
| Evidence level | proxy |
| Data class | synthetic only |
| Secret / tenant / connector / writeback | S0/S1, T0/T1, C0, W0/W1 candidate-only |

## Offline Deliverable

| ANDS-T field | Synthetic output |
|---|---|
| Goal | Turn an unclear internal documentation request into a governed ANDS task. |
| Inputs | Synthetic messy request; ANDS routing references. |
| Constraints | Synthetic-only; no provider API; no secrets; no tenant; no connector; no writeback. |
| Output | ANDS-T summary, role map, risk check, reusable lesson candidates. |
| Acceptance | Scope, roles, Gate, risks, and reusable candidates are explicit. |
| Non-goals | No live runtime test, no provider ranking, no public claim. |

## Role Map

| Role | Task |
|---|---|
| AI PM / Orchestrator | Clarify task, Track, Gate, and agent handoff. |
| Execution Agent | Draft the documentation artifact from the approved packet. |
| Validation Agent | Check acceptance criteria and Gate evidence. |
| Governance Reviewer | Check data, secret, tenant, connector, and claim boundaries. |
| Writeback Agent | Propose reusable lesson candidates only. |

## Risk Check

| Boundary | Status | Notes |
|---|---|---|
| No live API | PASS | Scenario is offline and synthetic. |
| No secret | PASS | No credential-like value is present. |
| No tenant | PASS | No provider project or enterprise workspace is used. |
| No connector/tool/writeback | PASS | No connector, tool, local operation, or persistence occurs. |
| No ranking/public claim | PASS | Output is role-routing evidence only. |

## Acceptance Checklist

| Check | Status |
|---|---|
| ANDS-T fields are visible | PASS |
| Active roles are assigned | PASS |
| Risks are separated from execution | PASS |
| Reusable lessons are candidate-only | PASS |
| Evidence remains proxy | PASS |

## Result Label

`OBSERVED_FIT_WITH_NOTES`

## Profile Fix Candidates

| Candidate | Reason | Provider profile |
|---|---|---|
| Keep acceptance checklist short | Prevent orchestration output from becoming a full validation report. | GLM / Z.AI |
```

## Blank Output Template

```markdown
# Offline Provider Profile Adoption Result

## Scope

| Item | Value |
|---|---|
| Provider label |  |
| Active role |  |
| Active Gate |  |
| Evidence level | proxy |
| Data class | synthetic only |
| Secret / tenant / connector / writeback | S0/S1, T0/T1, C0/design-only, W0/W1 |

## Offline Deliverable

<role-specific output>

## Validation

| Check | Result | Evidence |
|---|---|---|
| Uses synthetic-only input |  |  |
| Preserves active role |  |  |
| Preserves Gate evidence |  |  |
| Avoids API / secret / tenant / connector / writeback |  |  |
| Avoids ranking and public claims |  |  |

## Result Label

`OBSERVED_FIT / OBSERVED_FIT_WITH_NOTES / NEEDS_PACKET_FIXES / BLOCKED_BY_EVIDENCE / OUT_OF_SCOPE / NO_GO_EVALUATION_BOUNDARY`

## Profile Fix Candidates

| Candidate | Reason | Provider profile |
|---|---|---|
|  |  |  |
```

## Completion Criteria

| Criterion | Pass condition |
|---|---|
| One provider profile selected | Provider label is present. |
| One role used | Active role is present and not merged with all roles. |
| No live execution occurred | No API, key, tenant, connector, tool, local operation, transcript, or writeback is referenced as used. |
| Evidence remains `proxy` | Output label and validation notes preserve evidence level. |
| Feedback is actionable | Any fix candidate is phrased as a profile wording change. |
