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
| Quick | Gate 2 必选，其他 Gate 可裁剪 | 仅限低风险、可回滚、小范围、无敏感数据任务 |
| Standard | Gate 1-5 默认执行 | 常规业务需求，有明确 Acceptance，需要 CI 与人验收 |
| Enterprise | Gate 1-5 + 加强审查 | 生产关键路径、安全敏感、合规相关、跨团队或难回滚任务 |

## Gate 1：需求准入

- Owner: `[人类 Project Owner / AI PM]`
- 进入条件：
  - [ ] Goal 明确，且能说明业务目标。
  - [ ] Input 引用真实上下文，不只复述需求。
  - [ ] Constraint 写明红线、技术、安全和范围限制。
  - [ ] Acceptance 只包含业务可验证结果。
  - [ ] Track 为 `Quick`、`Standard`、`Enterprise` 三选一。
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
  - [ ] Track 声明与变更风险匹配，未把高风险任务误标为 Quick。
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
  - [ ] Enterprise Track 已完成加强审批或双人确认。
- 通过结论：`[通过 / 不通过 / 裁剪]`
- 失败动作：`[暂停发布；补齐发布资产或回滚方案后重新审批]`

## Gate 5：复盘审计

- Owner: `[AI 辅助整理 / 人类确认]`
- 审计项：
  - [ ] Lessons 已记录，或明确说明无需复盘。
  - [ ] 指标已更新：效率、质量、成本、知识资产、人的状态。
  - [ ] 知识已按域回写到 Obsidian。
  - [ ] 相关上下游双链已补齐。
  - [ ] 改进 Issue 已创建，或说明无需创建。
- 通过结论：`[通过 / 不通过 / 裁剪]`
- 失败动作：`[补写 Lessons、补齐双链或创建改进 Issue；未完成前不关闭任务]`

## Final Gate Result

- Overall Result: `[通过 / 不通过 / 有条件通过]`
- Blockers: `[列出阻断项；无则写“无”]`
- Follow-up Issues: `[[填写后续改进项；无则写“无”]]`
