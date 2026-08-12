# Demo Trace Guide 示例：30 分钟 ANDS 六步演示

> 目标：用一个合成任务演示 `ANDS-T -> AI PM -> Agent -> Gate -> Release -> Lessons`。本示例不引用真实项目细节，只保留可教学结构。

## 演示总览

| 项 | 内容 |
|---|---|
| 演示任务 | `DEMO-WR-001`：内部系统导出周报功能 |
| 主线 Track | `Standard` |
| 对照 Track | `Enterprise` 片段：权限策略调整的加强治理 |
| 时长 | 30 分钟 |
| 演示目的 | 证明 ANDS 如何把一个需求变成可执行、可验收、可复盘的闭环 |
| mock 边界 | Gateway 和 Dashboard 可用模拟记录；字段来自本合成 trace，不出现真实环境信息 |

## 0:00-2:00 开场

展示物：

- 一页式流程图：需求、拆解、执行、审查、发布、复盘。
- 任务标题：`内部系统导出周报功能`。

讲解要点：

- ANDS 是组织级 AI 原生研发操作系统，不是单个 AI 编程工具。
- 人负责决策和验证，AI 负责执行和辅助分析。
- 本次主线走 Standard 轨，后面用一个 Enterprise 片段说明治理如何加强。

## 2:00-6:00 第一步：ANDS-T 声明

展示物：

- `DEMO-WR-001` ANDS-T 任务卡。

任务摘要：

| 字段 | 内容 |
|---|---|
| Goal | 授权用户可按周导出内部系统周报 |
| Input | 周报字段口径、列表筛选规则、权限边界、现有导出组件说明 |
| Constraint | 不新增统计口径，不导出未授权数据，本轮不做定时发送 |
| Output | 导出入口、导出文件、用户反馈、使用说明 |
| Acceptance | 授权、筛选一致性、字段顺序、无数据提示、无权限不可导出 |
| Track | Standard |

讲解要点：

- Acceptance 只写业务可验证结果。
- 工程质量检查放到 Gate 2。
- Track 决定后续 Gate 强度。

## 6:00-10:00 第二步：AI PM 拆解

展示物：

- AI PM 拆解表。

| 子任务 | Agent | 输入上下文 | 输出 |
|---|---|---|---|
| 字段口径确认 | Product Agent | 周报字段口径、验收样例 | 字段确认表 |
| 导出能力实现 | Implementation Agent | ANDS-T、现有组件说明、权限边界 | 功能变更摘要 |
| 质量检查 | Validation Agent | Acceptance、变更摘要 | Gate 2 记录 |
| 人验收准备 | AI PM | Acceptance、演示数据集 | Gate 3 验收脚本 |
| 知识回写 | Knowledge Writeback Agent | Gate 结果、交付记录 | Lesson 或无需复盘说明 |

讲解要点：

- AI PM 是决策级编排：拆任务、配 Agent、选上下文、做过程质检。
- Gateway 如果出现，只做机械调度：路由、注入、监控、限流。
- 人类 Project Owner 仍保留范围、验收和发布决策权。

## 10:00-14:00 第三步：Agent 执行

展示物：

- Agent 执行摘要。
- 上下文注入记录。

执行摘要：

| 项 | 内容 |
|---|---|
| 变更范围 | 导出入口、导出数据组装、权限反馈、使用说明 |
| 未做范围 | 定时发送、跨周汇总、图表生成 |
| 上下文 | ANDS-T、字段口径、权限边界、现有组件说明 |
| 红线 | 不导出未授权数据，不输出敏感原始字段，不扩大需求 |

mock Gateway 记录：

```json
{
  "task_id": "DEMO-WR-001",
  "track": "Standard",
  "route": "implementation-agent",
  "context_sources": ["ANDS-T", "字段口径", "权限边界", "现有组件说明"],
  "constraints": ["最小范围", "不导出未授权数据", "不新增统计口径"],
  "next_gate": "Gate 2"
}
```

讲解要点：

- Agent 不是在空白上下文里发挥，而是按任务、知识和红线执行。
- mock 日志只展示字段结构，不假装已经有生产级 Gateway。

## 14:00-19:00 第四步：Gate 流转

展示物：

- Gate 2 / Gate 3 对照记录。
- Enterprise 片段对照。

Standard 主线：

| Gate | 结果 | 证据 | 失败动作 |
|---|---|---|---|
| Gate 1 需求准入 | 通过 | ANDS-T 字段完整，Track 合理 | 不通过则补任务卡 |
| Gate 2 机器质量 | 通过 | 测试、lint、类型检查、构建通过 | 不通过则修复重跑 |
| Gate 3 人验收 | 通过 | 验收角色按 Acceptance 导出并核对 | 不通过则返修或改 Acceptance |
| Gate 4 发布审批 | 通过 | 变更说明、回滚口径、五资产快照 | 不通过则暂停发布 |
| Gate 5 复盘审计 | 通过 | 知识回写和 Lesson 判断完成 | 不通过则补写 |

Enterprise 对照片段：

| 对照任务 | 为什么升级 | 加强动作 |
|---|---|---|
| 权限策略调整 | 涉及多个角色的访问边界 | Gate 1 附 ADR；Gate 2 加权限负向回归；Gate 3 双人确认；Gate 4 要回滚演练；Gate 5 必须写 Lesson 判断 |

讲解要点：

- Gate 2 是机器质量，Gate 3 是业务结果。
- 不是所有任务都默认 Enterprise；治理强度随风险变化。
- No-Go 不是失败汇报，而是质量系统生效。

## 19:00-24:00 第五步：Release 五资产快照

展示物：

- 五资产快照表。

| 资产 | 快照内容 |
|---|---|
| Knowledge | 周报字段口径、权限边界、验收记录已回写 |
| Prompt | AI PM 拆解提示和执行 Agent 约束已更新 |
| Architecture | 本次未改变架构；复用现有导出能力 |
| Workflow | Standard 轨 Gate 1-5 记录完整 |
| Code | 功能变更、检查记录和发布说明已关联 |

讲解要点：

- Release 不是只有代码更新。
- 如果下次要复现或回滚，必须知道知识、Prompt、架构、工作流、代码五类资产的状态。

## 24:00-27:00 第六步：Lessons 回写

展示物：

- Lesson 判断表。

| 问题 | 结论 |
|---|---|
| 是否发生返工 | 否 |
| 是否发现标准缺口 | 是，字段口径确认应在 Gate 1 中显式检查 |
| 是否创建改进 Issue | 是，补充“报表字段口径确认”检查项 |
| 写回知识域 | Product、Prompt、Governance、Lessons |

讲解要点：

- Gate 5 不是收尾文档，而是下一轮任务质量的输入。
- 度量用于复盘和标准迭代，不用于粉饰结果。

## 27:00-30:00 收尾

管理层 takeaway：

- ANDS 的主线是组织标准，不是工具炫技。
- Standard 轨适合用来跑通 30 天试点。
- Enterprise 只在高风险任务上加强治理。
- 知识回写决定下一次 Agent 是否更可靠。

实践者 takeaway：

- 先写 ANDS-T，再让 AI PM 拆解。
- Gate 2 和 Gate 3 分开记录。
- 发布时做五资产快照。
- 复盘要产出标准更新或明确无需更新的理由。

## 脱敏检查

- 本 trace 使用合成任务、泛化角色和抽象知识链接。
- 不包含真实组织、人员、仓库、网络地址、凭据、本地绝对路径或业务敏感数据。
- mock Gateway / Dashboard 只用于解释字段和数据流，不代表 v0.1 已提供生产级平台。
