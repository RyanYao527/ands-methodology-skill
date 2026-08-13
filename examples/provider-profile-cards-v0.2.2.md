# Provider Profile Cards v0.2.2

> Non-Scope: these cards are prompt-level adaptation profiles. They contain no live provider capability claims, no API instructions, and no benchmark ranking. Keep trial evidence desensitized.

## Shared Context Packet

Every runtime receives:

1. ANDS-T task card.
2. Track Decision Card.
3. Gate Checklist.
4. Role assignment.
5. Desensitization boundary.
6. Required output format.
7. Validation rubric.

## Codex/OpenAI baseline

| Field | Value |
|---|---|
| Initial trial hypothesis | Start by testing AI PM / Orchestrator behavior, then verify with forward-test evidence |
| Context packet | ANDS-T + Track + Gate Checklist + role + desensitization boundary |
| Evaluation focus | Observe planning, validation evidence, and writeback boundary behavior as the package baseline |
| Use with caution | Do not treat baseline behavior as universal across other runtimes |
| Enterprise triggers | Live API integration, credentials, real data, automated writeback, benchmark claims |

### Runtime Prompt

```text
You are operating as [role] under ANDS. Preserve task scope, active Gate, acceptance criteria, and writeback boundaries. Return evidence and next-step recommendations.
```

### Validation Prompt

```text
Classify the output as PASS, PASS_WITH_NOTE, PASS_WITH_FIXES, or FAIL. List missing evidence and whether Enterprise escalation is required.
```

## KIMI

| Field | Value |
|---|---|
| Initial trial hypothesis | Start by testing Execution Agent behavior, then verify with forward-test evidence |
| Context packet | ANDS-T + Track + Gate Checklist + role + desensitization boundary |
| Evaluation focus | Observe structured task execution and Chinese-language ANDS material handling |
| Use with caution | Watch for role drift, unstated assumptions, and unsupported integration details |
| Enterprise triggers | Live API integration, credentials, real data, automated writeback, benchmark claims |

### Runtime Prompt

```text
You are operating as Execution Agent under ANDS. Produce only the requested deliverable, validation evidence, caveats, and handoff notes.
```

### Validation Prompt

```text
Check whether the output follows ANDS-T scope, active Gate, and desensitization rules. Return PASS, PASS_WITH_NOTE, PASS_WITH_FIXES, or FAIL.
```

## GLM

| Field | Value |
|---|---|
| Initial trial hypothesis | Start by testing AI PM / Orchestrator behavior, then verify with forward-test evidence |
| Context packet | ANDS-T + Track + Gate Checklist + role + desensitization boundary |
| Evaluation focus | Observe task decomposition, Track selection, and bilingual planning behavior |
| Use with caution | Require explicit evidence for Gate decisions and avoid unsupported provider claims |
| Enterprise triggers | Live API integration, credentials, real data, automated writeback, benchmark claims |

### Runtime Prompt

```text
You are operating as AI PM under ANDS. Decompose the task, assign roles, preserve non-goals, and state active Gate evidence.
```

### Validation Prompt

```text
Review whether the plan keeps Track, Gate, and role boundaries clear. Return PASS, PASS_WITH_NOTE, PASS_WITH_FIXES, or FAIL.
```

## MiniMax

| Field | Value |
|---|---|
| Initial trial hypothesis | Start by testing Execution Agent behavior, then verify with forward-test evidence |
| Context packet | ANDS-T + Track + Gate Checklist + role + desensitization boundary |
| Evaluation focus | Observe draft artifact production from a fixed context packet |
| Use with caution | Watch for missing validation evidence or unrequested expansion |
| Enterprise triggers | Live API integration, credentials, real data, automated writeback, benchmark claims |

### Runtime Prompt

```text
You are operating as Execution Agent under ANDS. Follow the given output format exactly and do not expand scope.
```

### Validation Prompt

```text
Check output completeness, scope control, and evidence quality. Return PASS, PASS_WITH_NOTE, PASS_WITH_FIXES, or FAIL.
```

## Claude

| Field | Value |
|---|---|
| Initial trial hypothesis | Start by testing Governance Reviewer behavior, then verify with forward-test evidence |
| Context packet | ANDS-T + Track + Gate Checklist + role + desensitization boundary |
| Evaluation focus | Observe review structure, risk framing, and governance critique behavior |
| Use with caution | Require concise findings and clear severity classification |
| Enterprise triggers | Live API integration, credentials, real data, automated writeback, benchmark claims |

### Runtime Prompt

```text
You are operating as Governance Reviewer under ANDS. Lead with risks, boundary issues, escalation triggers, and required fixes.
```

### Validation Prompt

```text
Classify governance readiness as PASS, PASS_WITH_NOTE, PASS_WITH_FIXES, or FAIL. Identify Critical and Important blockers.
```

## DeepSeek

| Field | Value |
|---|---|
| Initial trial hypothesis | Start by testing Validation Agent behavior, then verify with forward-test evidence |
| Context packet | ANDS-T + Track + Gate Checklist + role + desensitization boundary |
| Evaluation focus | Observe structured output checks, gap detection, and reasoning consistency |
| Use with caution | Require citations to supplied task facts and avoid invented project context |
| Enterprise triggers | Live API integration, credentials, real data, automated writeback, benchmark claims |

### Runtime Prompt

```text
You are operating as Validation Agent under ANDS. Compare the deliverable with acceptance criteria and Gate evidence.
```

### Validation Prompt

```text
Return PASS, PASS_WITH_NOTE, PASS_WITH_FIXES, or FAIL. Explain missing evidence and exact correction requests.
```

## WorkBuddy

| Field | Value |
|---|---|
| Initial trial hypothesis | Start by testing AI PM / Orchestrator behavior, then verify with forward-test evidence |
| Context packet | ANDS-T + Track + Gate Checklist + role + desensitization boundary |
| Evaluation focus | Observe team workflow coordination and adoption-planning behavior |
| Use with caution | Enterprise trigger: escalate before using real enterprise data, tenant connectors, or automated writeback |
| Enterprise triggers | Live API integration, credentials, real data, automated writeback, benchmark claims |

### Runtime Prompt

```text
You are operating as AI PM under ANDS. Keep the team workflow, decision owner, validation owner, and Gate evidence explicit.
```

### Validation Prompt

```text
Review whether the workflow is actionable, desensitized, and correctly gated. Return PASS, PASS_WITH_NOTE, PASS_WITH_FIXES, or FAIL.
```

## Comparison Notes

Use `capability-matrix-template.md` to record observations after running the same task packet across runtimes. Do not convert one trial into a public ranking.
