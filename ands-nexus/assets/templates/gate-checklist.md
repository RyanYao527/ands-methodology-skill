# Gate Checklist 模板

> 使用方式：复制本模板，为一个任务或发布批次选择对应 Track 后填写。失败动作必须可执行，不写“继续观察”这类空动作。
> 边界：Gate 2 是机器质量检查；Gate 3 是人按 Acceptance 做业务验收。不要把二者混在一起。

## Basic Info

- Task / Release ID: `[填写脱敏编号]`
- Title: `[填写标题]`
- Track: `[Quick | Standard | Enterprise]`
- Owner Role: `[填写负责角色，不写真实姓名]`
- Date: `[YYYY-MM-DD]`

## Track Scope

| Track | 默认 Gate 范围 | 裁剪说明 |
|---|---|---|
| Quick | Gate 2 必选，其他 Gate 可裁剪 | 仅限低风险、可回滚、小范围、无敏感数据、无外部交付、无公开声明或合同影响任务 |
| Standard | Gate 1-5 默认执行 | 常规业务需求，或外部可见但低风险且不涉及敏感数据、真实客户影响、客户承诺、公开声明、provider 对比、采购建议或生产关键路径的交付；需要 CI、人验收和必要的 Gate 4 说明 |
| Enterprise | Gate 1-5 + 加强审查 | 生产关键路径、安全敏感、合规相关、跨团队、难回滚、合同/客户承诺、真实客户影响、公开声明、provider 对比、采购建议或连接器任务 |

## Tailoring Questions

- Risk Level: `[低 / 中 / 高]`
- Reversibility: `[可快速回滚 / 可回滚但有成本 / 难回滚]`
- Data Sensitivity: `[无敏感数据 / 内部数据 / 权限、隐私、合规或生产数据]`
- External delivery or contractual impact: `[无 / 外部可见但低风险且无公开声明 / 有公开声明、合同、合规、客户承诺、provider 对比、采购建议或真实客户影响]`
- Human Validation Owner: `[填写角色；无则不能进入 Standard/Enterprise Gate 3]`
- Failure Action: `[返修 / 回滚 / 暂停发布 / 升级 Track / 人工接管]`
- Tailoring Rationale: `[说明为什么保留、裁剪或加强对应 Gate]`

## Gate 1：需求准入

- Owner: `[人类 Project Owner；AI PM 仅准备材料与质检，不作准入决策]`
- 进入条件：
  - [ ] Goal 明确，且能说明业务目标。
  - [ ] Input 引用真实上下文，不只复述需求。
  - [ ] Constraint 写明红线、技术、安全和范围限制。
  - [ ] Acceptance 只包含业务可验证结果。
  - [ ] Track 为 `Quick`、`Standard`、`Enterprise` 三选一。
  - [ ] 风险、可回滚性、敏感数据、外部交付/合同影响、验收人和失败动作已声明。
  - [ ] 需要 ADR 的决策已经记录或标记为待补。
- 通过结论：`[通过 / 不通过 / 裁剪]`
- 失败动作：`[退回补充 ANDS-T；必要时升级 Track；不进入执行阶段]`

## Gate 2：机器质量

- Owner: `[AI / CI / 自动化检查]`
- 检查项：
  - [ ] 自动化测试通过。
  - [ ] Lint 无阻断错误。
  - [ ] 类型检查或等价静态检查通过。
  - [ ] 构建或打包通过。
  - [ ] 安全扫描或依赖检查无阻断项。
  - [ ] Track 声明与变更风险、外部交付/合同影响匹配，未把高风险任务误标为 Quick 或 Standard。
- 通过结论：`[通过 / 不通过 / 裁剪]`
- 失败动作：`[修复后重跑 Gate 2；不提交 Gate 3 人验收]`

## Gate 3：人验收

- Owner: `[业务验收人 / Project Owner / 指定评审角色]`
- 验收项：
  - [ ] 按 ANDS-T 的 Acceptance 逐条验证业务结果。
  - [ ] 用户可见行为符合预期。
  - [ ] 关键异常场景的业务表现符合预期。
  - [ ] ADR 中的关键决策没有被实现偏离。
  - [ ] 未发现明显安全、隐私或合规风险。
- 通过结论：`[通过 / 不通过 / 裁剪]`
- 失败动作：`[返修；必要时重写 Acceptance 或补充 ADR；不进入发布审批]`

## Gate 4：发布审批

- Owner: `[发布负责人 / Project Owner]`
- 审批项：
  - [ ] Release Notes 或变更说明完整。
  - [ ] 回滚方案就绪。
  - [ ] 灰度、开关或回退条件已定义。
  - [ ] 五资产快照按任务需要同步：Knowledge、Prompt、Architecture、Workflow、Code。
  - [ ] 外部可见交付已说明为什么仍可保持 Standard，或已升级 Enterprise；若保持 Standard，必须确认无公开声明、provider 对比、采购建议、客户承诺、合同/合规口径或真实客户影响。
  - [ ] Enterprise Track 已完成加强审批或双人确认。
- 通过结论：`[通过 / 不通过 / 裁剪]`
- 失败动作：`[暂停发布；补齐发布资产或回滚方案后重新审批]`

## Gate 5：复盘审计

- Owner: `[AI 辅助整理 / 人类确认]`
- 审计项：
  - [ ] Lessons 已记录，或明确说明无需复盘。
  - [ ] 指标已更新：效率、质量、成本、知识资产、人的状态。
  - [ ] 知识已按域形成候选回写或写入显式指定路径，或明确说明无需回写；不得无人值守、扫描 Vault、同步 GitHub、写 provider workspace 或更新企业系统。
  - [ ] 相关上下游双链已补齐。
  - [ ] 改进 Issue 已创建，或说明无需创建。
- 通过结论：`[通过 / 不通过 / 裁剪]`
- 失败动作：`[补写 Lessons、补齐双链或创建改进 Issue；未完成前不关闭任务]`

## Final Gate Result

- Overall Result: `[通过 / 不通过 / 有条件通过]`
- Blockers: `[列出阻断项；无则写“无”]`
- Follow-up Issues: `[[填写后续改进项；无则写“无”]]`
