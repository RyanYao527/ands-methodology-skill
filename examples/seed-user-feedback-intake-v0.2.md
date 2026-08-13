# Seed-User Feedback Intake v0.2

> 用途：把内部试用反馈转成可分派、可脱敏、可回归的 v0.2 改进输入。真实材料进入本文件前必须泛化。

## Intake Record

- Feedback ID: `[FB-v0.2-001]`
- Source Type: `[manager | practitioner | reviewer | seed-user session]`
- User Role: `[Project Owner | AI PM | practitioner | governance reviewer | other role]`
- Original Material Status: `[synthetic | desensitized real material]`
- Prompt / Situation: `[写脱敏后的用户式 prompt 或场景]`
- Observed Issue: `[用户遇到的误解、缺口或失败表现]`
- Desired Outcome: `[用户希望 skill 输出什么]`
- Classification: `[concept | template | governance | documentation | validation | example | writeback]`
- Affected Artifact: `[SKILL.md | reference | template | example | README | validation prompt | script]`
- Sensitivity Review: `[PASS | NEEDS_REDACTION | BLOCKED]`
- Proposed Task: `[T01 | T02 | T03 | T04 | T05 | T06 | T07 | T08]`
- Regression Prompt: `[把反馈转成一条可重复测试的用户式 prompt]`
- Gate Impact: `[Gate 1 | Gate 2 | Gate 3 | Gate 4 | Gate 5 | none]`
- Track Impact: `[Quick | Standard | Enterprise upgrade needed]`

## Classification Guide

| Classification | When to use | Typical owner |
|---|---|---|
| concept | ANDS-K/T/A/W/G、AI PM、Gateway、Track、Gate 口径被误解 | Methodology Architect |
| template | 字段缺失、填写提示不清、Acceptance 与 Gate 混淆 | Template Asset |
| governance | Track 选择、Gate 裁剪、失败动作或审查责任不清 | Governance Reviewer |
| documentation | README、安装、Windows UTF-8、试用说明不清 | Documentation & Publishing |
| validation | 缺少可复现 prompt、expected observation 或测试记录 | Validation & Test |
| example | 示例不够贴近真实使用，或 trace 不好教学 | Example & Demo Trace |
| writeback | 回写位置、frontmatter、双链或项目/母体边界不清 | Knowledge Writeback |

## Desensitized Example

- Feedback ID: `FB-v0.2-001`
- Source Type: `practitioner`
- User Role: `AI PM`
- Original Material Status: `desensitized real material`
- Prompt / Situation: `用户要求把一个内部导出功能写成 ANDS-T，但把“测试通过”和“业务验收通过”都写进 Acceptance。`
- Observed Issue: `Acceptance、Gate 2 和 Gate 3 混淆。`
- Desired Outcome: `skill 应提醒 Acceptance 只写业务可验证结果，工程质量放 Gate 2，人验收放 Gate 3。`
- Classification: `governance`
- Affected Artifact: `governance-and-metrics.md; gate-checklist.md; ands-t-template.md`
- Sensitivity Review: `PASS`
- Proposed Task: `T05`
- Regression Prompt: `请检查这张 ANDS-T：Acceptance 写了“lint 通过、单测通过、业务方确认能导出周报”。哪些内容应该移到 Gate 2 或 Gate 3？`
- Gate Impact: `Gate 1; Gate 2; Gate 3`
- Track Impact: `Standard`

## Desensitization Checklist

- [ ] 真实组织名已替换为团队、组织、内部系统或试点项目。
- [ ] 真实人员已替换为角色。
- [ ] 真实仓库、分支、PR、域名、IP、本地路径、凭据已删除。
- [ ] 业务数据只保留字段类别和规则口径。
- [ ] 原始反馈中带有情绪或指责的内容已改成事实描述。
- [ ] 已把反馈转成一条可回归的用户式 prompt。

