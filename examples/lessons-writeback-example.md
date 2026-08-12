# Lessons 回写示例：验收标准模糊导致上线延期

> 对应验收 prompt：这次上线延期是因为验收标准写得太模糊，Agent 做完以后业务方说不是他们要的。请按 ANDS 写一次复盘。

## Lesson Meta

- Lesson ID: `LSN-DEMO-001`
- Date: `2026-08-12`
- Related Task: `[[Task/DEMO-FEATURE-001]]`
- Related Release: `[[Release/DEMO-FEATURE-001-延期记录]]`
- Track: `Standard`

## Event

一次 Standard 轨功能在 Gate 3 人验收时未通过。Agent 按原任务完成了交付物，但业务验收角色认为结果不符合真实使用场景，导致上线延期并产生返工。

## Impact

- 业务影响：原计划发布窗口推迟，业务方需要重新确认验收口径。
- 质量影响：Gate 3 不通过，返工一次。
- 成本影响：AI 执行与人审都发生重复投入。
- 知识影响：任务模板中 Acceptance 写法缺少业务场景约束，未形成可复用示例。

## Root Cause

| 根因类别 | 说明 | 证据 |
|---|---|---|
| ANDS-T | Acceptance 只写“功能可用”，没有写清谁使用、在什么条件下、看到什么结果 | `[[Task/DEMO-FEATURE-001]]` 的原任务卡 |
| Gate | Gate 1 需求准入没有拦住模糊 Acceptance；Gate 3 才发现业务目标偏差 | `[[Gate/DEMO-FEATURE-001]]` |
| Agent / Workflow | AI PM 拆解时没有要求补充业务验收样例，执行 Agent 只能按字面理解 | `[[Prompt/AI-PM-拆解记录]]` |
| Knowledge | 缺少“好 Acceptance / 坏 Acceptance”示例，团队没有共同口径 | `[[Lessons/Acceptance-反模式]]` |

## Detection Gate

- First Detected At: `Gate 3`
- Expected Detection Gate: `Gate 1`
- Gap: Gate 1 只检查了任务字段是否存在，没有检查 Acceptance 是否能被业务验收角色直接执行。

## Prevention

- 任务标准改进：Acceptance 必须包含角色、操作、数据范围、可观察结果和至少一个边界场景。
- Gate 改进：Gate 1 增加“业务验收角色能否照着 Acceptance 独立验收”的检查项。
- Agent 改进：AI PM 拆解前必须标记模糊 Acceptance，并向 Project Owner 请求补充。
- 度量改进：新增“Gate 3 因 Acceptance 模糊导致返工次数”作为质量指标。

## Knowledge Domain

- Product：业务验收口径。
- Prompt：AI PM 拆解前的 Acceptance 澄清提示。
- Governance：Gate 1 准入检查项。
- Lessons：本次延期复盘。

回写位置：

- `[[Lessons/LSN-DEMO-001-验收标准模糊导致延期]]`
- `[[Governance/Gate-1-需求准入检查项]]`
- `[[Prompt/AI-PM-任务拆解前检查]]`

## Standard Update

- 是否需要更新标准：是。
- 更新对象：`ANDS-T`、`Gate Checklist`、`AI PM 拆解提示`。
- 建议更新内容：
  - 在 ANDS-T 模板的 Acceptance 说明中加入“角色、操作、数据范围、可观察结果、边界场景”五要素。
  - 在 Gate 1 中加入检查项：“验收人是否可以不看代码、不问 Agent，仅按 Acceptance 判断通过或不通过。”
  - 在 AI PM 拆解 prompt 中加入动作：“如 Acceptance 只写可用、正常、完成、支持等抽象词，先退回澄清。”
- 负责人角色：`Methodology Owner` 和 `AI PM`。

## Follow-up Issue

- Issue Title: `补充 Acceptance 五要素检查与示例`
- Issue Type: `模板修订`
- Priority: `高`
- Acceptance:
  - ANDS-T 模板包含 Acceptance 五要素说明。
  - Gate 1 Checklist 包含可执行验收口径检查。
  - 新增一组“模糊 Acceptance -> 可验收 Acceptance”的脱敏示例。
  - 下一次 Standard 轨任务在 Gate 1 记录该检查结果。

## Obsidian Writeback & Backlinks

- 上游链接：`[[Task/DEMO-FEATURE-001]]`、`[[Gate/DEMO-FEATURE-001]]`
- 下游链接：`[[Issue/补充-Acceptance-五要素检查与示例]]`
- 相关链接：`[[Governance/Gate-1-需求准入检查项]]`、`[[Prompt/AI-PM-任务拆解前检查]]`
- 双链检查：
  - 本 Lesson 链接到任务、Gate 记录和延期记录。
  - 上游任务反向链接到本 Lesson。
  - 后续 Issue 链接本 Lesson。
  - 本 Lesson 不包含真实组织、人员、仓库、网络地址、凭据或业务敏感数据。
