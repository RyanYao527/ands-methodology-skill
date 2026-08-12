# Agent Matrix 模板

> 使用方式：复制本模板，为一个项目、任务组或试点设计 Agent 分工。AI PM 是决策级编排；AI Gateway 是机械执行级调度，不要混写。
> 脱敏要求：角色、工具和上下文均使用泛化名称，不写真实人员、仓库、域名、IP 或凭据。

## Matrix Meta

- Matrix ID: `[填写脱敏编号]`
- Scope: `[填写项目、任务组或试点范围]`
- Track: `[Quick | Standard | Enterprise]`
- Owner Role: `[填写负责角色，不写真实姓名]`
- Date: `[YYYY-MM-DD]`

## Orchestration Boundary

- AI PM 职责：`[拆解任务、分配 Agent、协调上下文、过程质检、升级风险]`
- AI Gateway 职责：`[路由请求、注入上下文、记录日志、限流、监控成本]`
- 人类职责：`[方向、取舍、关键决策、Gate 1/3/4 验收或审批]`

## Agent Matrix

| L1 角色 | L2 Agent 分工 | L3 工具/模型实例 | 能力边界 | 输入上下文 | 输出物 | Gate 责任 |
|---|---|---|---|---|---|---|
| 产品 | AI PM / Skill Orchestrator | `[模型或工具实例，脱敏]` | `[可拆解、调度、质检；不可替代人类最终决策]` | `[目标、约束、知识链接、风险]` | `[任务集、分配计划、验收建议]` | `[Gate 1 支撑，Gate 3 预检]` |
| 架构 | Methodology / Architecture Agent | `[模型或工具实例，脱敏]` | `[可提出架构建议；重大决策需 ADR 和人确认]` | `[现有架构、约束、ADR]` | `[方案、ADR 草案、风险清单]` | `[Gate 1、Gate 3 支撑]` |
| 开发 | Implementation Agent | `[模型或工具实例，脱敏]` | `[可修改指定范围；不可越权访问未授权上下文]` | `[ANDS-T、设计、接口、约束]` | `[代码、配置、迁移或文档变更]` | `[Gate 2 输入]` |
| 测试 | Validation Agent | `[模型或工具实例，脱敏]` | `[可设计和执行检查；不可替代业务验收]` | `[Acceptance、变更说明、测试入口]` | `[测试记录、失败项、修复建议]` | `[Gate 2 主责，Gate 3 支撑]` |
| 支撑 | Knowledge Writeback Agent | `[模型或工具实例，脱敏]` | `[可整理 Lessons 和双链；不可发布未经确认的标准]` | `[交付记录、指标、Gate 结果]` | `[Lessons、知识回写、改进 Issue]` | `[Gate 5 主责]` |

## Context Rules

- 必读上下文：`[[填写 ANDS-T、ADR、reference 或任务说明]]`
- 禁止读取：`[填写不允许读取的路径、系统或数据类型；使用泛化描述]`
- 权限边界：`[填写只读、可改指定文件、可运行检查等边界]`
- 上下文注入规则：`[说明由 AI PM 选择，或由 Gateway 注入已验证知识源]`

## Handoff Rules

| From | To | Handoff Artifact | Done Criteria |
|---|---|---|---|
| `[上游角色]` | `[下游角色]` | `[任务卡、ADR、PR、测试记录、Lessons 等]` | `[下游可直接消费的条件]` |

## Risk & Escalation

- 升级触发：`[例如同一任务失败 3 次、发现敏感数据、Track 不匹配、Acceptance 模糊]`
- 升级给谁：`[AI PM / Project Owner / Governance Reviewer]`
- 人类决策点：`[需要人拍板的范围、风险或发布动作]`

## Knowledge Links

- 上游：`[[填写上游任务或标准]]`
- 下游：`[[填写下游执行、验证或发布记录]]`
- Lessons：`[[填写复盘链接；无则写“暂无”]]`
