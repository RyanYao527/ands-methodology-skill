# One-Page Glossary Card

Use this card during a first run, feedback review, or manager-path walkthrough when a term needs a quick plain-language check.

This is a readability aid. Non-Scope: no provider-native validation, no API integration, no credential setup, no tenant connectors, no unattended or automated writeback, no benchmark ranking, no best-provider result, and no procurement guidance.

| Term | Plain meaning | First-run action |
|---|---|---|
| ANDS-T | A task card that makes the goal, input, constraints, acceptance, Track, Gate, and handoff explicit. | Use it before asking an agent to execute. |
| Track | The governance weight for the task: Quick, Standard, or Enterprise. | Choose the smallest Track that still covers risk. |
| Gate | A checkpoint for evidence, acceptance, release, or writeback. | Do not let the AI replace the human owner decision. |
| State Packet | The visible state copied between guided prompts. | Keep it current so the workflow does not rely on hidden memory. |
| `owner_response` | The human owner's actual reply: confirm, revise, escalate, or stop. | Replace placeholders before sending the next prompt. |
| `data_class` | What kind of task input/context is being used: synthetic, desensitized, or Enterprise-review material. | Use synthetic material for first runs. |
| `PASS` | The feedback or example is safe enough for public examples or validation after review. | It may be used. |
| `NEEDS_REDACTION` | The learning is useful, but the text still has recognizable context shadows. | Rewrite, then review again. |
| `BLOCKED` | The material contains secrets, customer data, tenant configuration, private screenshots, identifiable paths, or unsafe business facts. | Keep it out of public material. |
| Explicit path | One local draft file path named by the human for this one requested draft. | It does not permit Vault scans, sync, or broader writeback. |
| Vault scan | Reading or changing a whole Obsidian vault or knowledge base. | Out of scope for v0.4.x. |
| Provider-native validation | No provider-native validation in v0.4.x. Plain meaning: a real test on a vendor API, SDK, console, tenant, connector, or tool surface. | Route to Enterprise review before doing it. |
| Tenant connector | A connector that touches a company or customer system through accounts, permissions, tenant settings, or an enterprise workspace. In plain Chinese: connects to a real company/customer system and its platform space/configuration. | Route to Enterprise review before setup or use. |
| Public claim | An external promise, capability statement, provider comparison, contract/compliance statement, or procurement-style recommendation. | Route to Enterprise review before publishing. |

Chinese quick aliases:

| Term | Chinese alias |
|---|---|
| One-Page Boundary Card | 边界速查卡 |
| `PASS` | 可公开使用 |
| `NEEDS_REDACTION` | 需脱敏改写后复核 |
| `BLOCKED` | 禁止进入公开材料 |
| Tenant connector | 接入公司或客户真实系统的连接器 |
| No provider-native validation | 不做厂商官方平台/接口/控制台上的真实测试 |
