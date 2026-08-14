# 30-Day ANDS Pilot Template

> 使用方式：复制本模板，为一个团队设计 30 天 ANDS 试点。所有材料必须脱敏；不要写真实公司、人员、仓库、域名、IP、凭据或业务敏感数据。

## Pilot Meta

- Pilot ID: `[填写试点编号]`
- Team Size: `[填写人数范围，例如 10-25 人]`
- Owner Role: `[填写负责角色，不写真实姓名]`
- Track: `[Standard | Enterprise if public/security/compliance risk exists]`
- Dates: `[YYYY-MM-DD 至 YYYY-MM-DD]`

## Goal

`[用一句话说明试点要验证的管理或交付假设。]`

## Fit / Non-Fit

| 判断项 | 结论 | 说明 |
|---|---|---|
| 是否有 2-4 周内可闭环的小需求 | `[是/否]` | `[说明候选需求]` |
| 是否涉及敏感数据或生产关键路径 | `[是/否]` | `[如是，升级 Enterprise]` |
| 是否已有最小 AI 使用基础 | `[是/否]` | `[例如 Codex / Cursor / GitHub]` |
| 是否有业务验收角色 | `[是/否]` | `[明确 Gate 3 责任]` |

## Pilot Scope

- 试点主线：`[例如内部周报导出、文档治理、低风险后台功能]`
- 不做范围：`[例如不建设 AI Gateway、不改生产发布流程、不批量迁移知识库]`
- 试点资产：`ANDS-T`、`Agent Matrix`、`Gate Checklist`、`Lessons`、`Feedback Intake`

## 30-Day Plan

| 阶段 | 时间 | 目标 | 输出 | Gate |
|---|---|---|---|---|
| Week 1 | Day 1-7 | 建立最小标准 | 试点 ANDS-T、Track 判定、Agent Matrix | Gate 1 / Gate 2 |
| Week 2 | Day 8-14 | 跑第一个任务闭环 | 交付记录、机器检查、业务验收记录 | Gate 2 / Gate 3 |
| Week 3 | Day 15-21 | 扩展到第二个任务或同类变体 | 更新模板、补 regression prompt | Gate 3 / Gate 4 |
| Week 4 | Day 22-30 | 复盘和是否扩围决策 | Lessons、指标、后续 Issue、扩围建议 | Gate 5 |

## Minimum Agent Matrix

| 角色 | 职责 | 输入 | 输出 |
|---|---|---|---|
| AI PM / Orchestrator | 拆任务、控 Track、集成 Gate 证据 | 试点目标、约束、反馈 | ANDS-T、分派计划、状态摘要 |
| Execution Agent | 完成具体交付或文档资产 | ANDS-T、上下文、模板 | 交付物、测试结果、变更摘要 |
| Validation Agent | 验证 Acceptance / Gate 2 / Gate 3 | 交付物、验收标准 | PASS/FAIL、返修建议 |
| Governance Reviewer | 审查风险、脱敏和升级条件 | Track、发布范围、反馈材料 | Go/No-Go 或升级建议 |

## Metrics

| 指标 | 起点 | 30 天目标 | 数据源 |
|---|---|---|---|
| Gate 一次通过率 | `[填写或未知]` | `[填写目标]` | Gate 记录 |
| 返工次数 | `[填写或未知]` | `[填写目标]` | Lessons / issue |
| Lead Time | `[填写或未知]` | `[填写目标]` | GitHub / 任务记录 |
| 知识回写及时率 | `[填写或未知]` | `[填写目标]` | Obsidian / Gate 5 |
| 人类评审负载 | `[填写或未知]` | `[填写目标]` | Review 记录 |

## Feedback Intake

- 使用 `examples/post-release-feedback-intake-v0.2.1.md` 记录公开发布后的反馈。
- 真实反馈先脱敏，再转为修订任务、regression prompt 或 Lessons。
- 只把跨项目可复用规则候选回写到方法论母体。

## Gate 5 Closeout

- [ ] 是否记录试点事实、影响、问题和根因。
- [ ] 是否更新相关模板或 reference。
- [ ] 是否创建后续 issue：继续、扩围、暂停或人工接管。
- [ ] 是否把可复用规则候选交给 Project Owner 审查。
- [ ] 是否明确下一轮 Track：Quick / Standard / Enterprise。
