# Track Decision Card 模板

> 使用方式：复制本卡，为每个 ANDS-T 任务选择一个 Track。Track 只能是 `Quick`、`Standard`、`Enterprise`。
> 原则：治理强度随风险变化，不默认所有任务都走完整重流程。

## Basic Info

- Task ID: `[填写脱敏编号]`
- Title: `[填写任务标题]`
- Decision Date: `[YYYY-MM-DD]`
- Decider Role: `[填写决策角色，不写真实姓名]`

## Track Decision

- Selected Track: `[Quick | Standard | Enterprise]`
- Decision Summary: `[用 1-2 句话说明为什么选择该 Track]`

## Risk Questions

- Reversibility: `[可快速回滚 / 可回滚但有成本 / 难回滚]`
- Data Sensitivity: `[无敏感数据 / 内部数据 / 权限、隐私、合规或生产数据]`
- User Impact: `[个人或小范围 / 单团队 / 跨团队或外部用户]`
- External delivery or contractual impact: `[无 / 外部可见但无敏感数据和客户承诺 / 有合同、合规、客户承诺或真实客户影响]`
- Production Path: `[不影响 / 间接影响 / 关键路径]`
- Human Validation Owner: `[有明确角色 / 待确认 / 无]`
- Failure Action: `[返修 / 回滚 / 暂停发布 / 升级 Track / 人工接管]`

## Quick 判定

适用条件：

- [ ] 低风险。
- [ ] 小范围。
- [ ] 可快速回滚。
- [ ] 不处理敏感数据。
- [ ] 不影响生产关键路径。
- [ ] 不跨团队改变流程或接口契约。
- [ ] 无外部交付、合同影响、客户承诺或公开声明。
- [ ] 有明确失败动作，且失败不会造成不可恢复影响。

默认治理裁剪：

- Gate 2 必选。
- Gate 1 / Gate 3 / Gate 4 / Gate 5 可裁剪，但裁剪理由必须写入本卡。
- Gate 2 发现风险不匹配时，必须升级到 Standard 或 Enterprise。

## Standard 判定

适用条件：

- [ ] 常规业务需求。
- [ ] 有明确业务 Acceptance。
- [ ] 需要 CI 或自动化检查。
- [ ] 需要人按 Acceptance 验收。
- [ ] 影响范围可控，且有基本回滚路径。
- [ ] 有明确 Gate 3 人验收角色。
- [ ] 失败动作能在当前团队内闭环。
- [ ] 外部可见但低风险，且不涉及敏感数据、真实客户影响、生产关键路径、跨团队接口、合同义务、客户承诺或难回滚时，默认 Standard，并加强 Gate 4 审查。

默认治理范围：

- Gate 1-5 默认执行。
- Gate 2 负责工程质量。
- Gate 3 负责人验收业务结果。

## Enterprise 判定

适用条件：

- [ ] 影响生产关键路径。
- [ ] 涉及安全、隐私、权限或合规。
- [ ] 不可轻易回滚。
- [ ] 跨团队、跨系统或影响外部用户。
- [ ] 外部交付涉及合同、合规、真实客户数据、真实客户影响、生产关键路径、客户承诺或难回滚承诺。
- [ ] 涉及重大架构决策或长期标准变更。
- [ ] 涉及自动化批量改写、公开发布或未脱敏真实材料。

默认治理加强：

- Gate 1-5 必选。
- Gate 1 需要更完整的 ANDS-T 与 ADR。
- Gate 3 需要指定验收角色或双人确认。
- Gate 4 需要发布审批、灰度或回滚演练。
- Gate 5 必须形成 Lessons 或标准更新判断。

## Upgrade Conditions

出现任一情况时升级 Track：

- [ ] 任务范围扩大，影响对象超过原声明。
- [ ] 新增敏感数据、权限、资金、合规或审计要求。
- [ ] Gate 2 失败多次，说明任务复杂度被低估。
- [ ] Gate 3 人验收发现 Acceptance 模糊或业务目标偏差。
- [ ] 发现不可回滚或回滚成本明显高于预期。
- [ ] 同一变更影响多个团队、系统或关键流程。
- [ ] 发现真实材料脱敏不足或自动化权限边界不清。
- [ ] 外部交付从低风险展示变成合同、客户承诺、公开声明或真实客户影响。

升级结果：

- Original Track: `[Quick | Standard | Enterprise]`
- New Track: `[Standard | Enterprise]`
- Upgrade Reason: `[填写升级原因]`
- Required Gate Changes: `[填写新增或加强的 Gate]`

## Governance Tailoring

| Gate | 保留 / 裁剪 / 加强 | 理由 |
|---|---|---|
| Gate 1 需求准入 | `[保留/裁剪/加强]` | `[填写理由]` |
| Gate 2 机器质量 | `[保留/加强]` | `[Gate 2 通常不裁剪；如无法执行需说明替代检查]` |
| Gate 3 人验收 | `[保留/裁剪/加强]` | `[填写理由]` |
| Gate 4 发布审批 | `[保留/裁剪/加强]` | `[填写理由]` |
| Gate 5 复盘审计 | `[保留/裁剪/加强]` | `[填写理由]` |

## Decision Record

- Final Decision: `[采用所选 Track / 升级 Track / 降级 Track]`
- Open Questions: `[列出未决问题；无则写“无”]`
- Related ANDS-T: `[[填写任务卡链接]]`
- Related ADR: `[[填写 ADR 链接；无则写“无”]]`
