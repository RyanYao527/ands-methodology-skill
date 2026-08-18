# ANDS Nexus Glossary

Use this page when a first-time user asks what the guided workflow terms mean. Keep explanations short and operational.

| Term | Meaning |
|---|---|
| ANDS | AI-Native Development System: a way to turn AI-assisted work into tasks, roles, evidence, acceptance, and reusable lessons. |
| ANDS-T | The task card standard: Goal, Input, Constraint, Output, Acceptance, Track, Gate requirements, and handoff notes. |
| Track | Governance weight for a task: Quick, Standard, or Enterprise. Higher risk means stronger evidence and approval. |
| Gate | A decision or evidence checkpoint. Gate 1 is intake, Gate 2 is machine quality, Gate 3 is human acceptance, Gate 4 is release approval, and Gate 5 is lessons / writeback review. |
| State Packet | The visible state block copied between guided prompts so the workflow does not rely on hidden memory. |
| `owner_decision` | The human decision needed at the current step, such as continue, revise, escalate, approve, or stop. |
| `owner_response` | The human's actual reply to the decision prompt, such as `confirm: ...`, `revise: ...`, or `escalate: ...`. |
| `data_class` | Whether the task uses synthetic, desensitized, or Enterprise-review material. Use synthetic material for first runs. |
| Writeback | Turning a reusable lesson or rule into a project-local knowledge note after human review. |
| Regression prompt | A reusable prompt that checks whether a past confusion or failure stays fixed. |

First-run rule: use a fictional task because this package rehearses the process; it does not connect to your systems.
