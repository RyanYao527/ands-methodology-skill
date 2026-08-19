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
| `owner_response` | The human's actual reply to the decision prompt, such as `confirm: ...`, `revise: ...`, `escalate: ...`, or `stop: ...`. |
| `data_class` | Whether the task uses synthetic, desensitized, or Enterprise-review material. Use synthetic material for first runs. Desensitized means the remaining text cannot identify a person, organization, repository, tenant, credential, local machine, or sensitive business fact. |
| Runtime workflow role | The active job assigned to an AI runtime for this step, such as AI PM, Execution, Validation, Governance, or Writeback. This is a workflow assignment, not proof of model capability. |
| ANDS-A L1/L2/L3 | The Agent architecture layers: L1 is role family, L2 is functional division of work, and L3 is a concrete model, tool, or agent instance. Runtime workflow roles usually map to L2 responsibilities while the actual model session is L3. |
| Writeback | Turning a reusable lesson or rule into a project-local knowledge note after human review. Draft generation to an explicit path is allowed only when explicitly requested; unattended writeback, Vault scans, GitHub sync, provider workspace writes, and enterprise-system updates are out of scope. |
| Provider-runtime evidence | Evidence from an approved live provider surface, such as an API, SDK, console, tenant, connector, or tool run. v0.4.x examples do not provide this. |
| No benchmark ranking | Do not make public or procurement-style provider comparison claims from offline/profile examples. Record observations only. |
| Regression prompt | A reusable prompt that checks whether a past confusion or failure stays fixed. |

First-run rule: use a fictional task because this package rehearses the process; it does not connect to your systems, call APIs, write to provider workspaces, or automatically update knowledge bases.
