# Adoption Playbook

## 定位

本 reference 用于帮助团队从“已经在用 AI 工具”走向“有组织标准、知识沉淀、治理和度量的 AI-Native 研发”。v0.1 只给试点路线和最小可交付，不扩展成完整转型咨询方案。

## 何时读取

- 用户要 30/60/90 天试点计划。
- 用户是管理者，关心是否适合、投入多少、先做什么。
- 用户要内部推广、工作坊、试点项目选择标准。
- 用户担心 Gate 太重、Gateway 太大、团队阻力太高。

## 核心规则/方法

### 适用性判断

先判断三件事：

1. 团队是否已有 AI 使用基础，但缺少统一任务标准。
2. 是否存在可试点的小型真实需求，能在 2-4 周内闭环。
3. 是否有人愿意承担 Gate 1/3/4 的决策与验收责任。

不满足第 3 条时，不建议启动正式试点；可以先做任务标准和知识回写工作坊。

### 试点项目选择

优先选：

- 范围小、可回滚、依赖清楚。
- 有明确业务验收人。
- 能产生完整 trace：ANDS-T、AI PM 拆解、Agent 执行、Gate、Release、Lessons。
- 不含敏感数据或生产关键路径。

避免选：

- 跨多团队、范围持续变化的需求。
- 没有验收人或验收标准不可写清的需求。
- 一开始就要求生产级 Gateway 或复杂 Dashboard 的项目。

### 30/60/90 天路线

| 阶段 | 目标 | 最小产出 |
|---|---|---|
| 0-30 天 | 跑通一个 Standard 轨试点 | ANDS-T、8 域知识骨架、Agent 分工、Gate 2/3、Lessons |
| 31-60 天 | 固化团队标准 v0.1 | 团队版 K/T/A/W/G、Track 判定卡、Gate Checklist、五资产快照 |
| 61-90 天 | 扩展到第二类需求 | 指标基线、复盘机制、改进 Issue、内部宣讲材料 |

30 天内不要把目标定为“建完整平台”。先用轻量工具跑通机制，再决定自动化投入。

### 管理层输出结构

给管理者的答案按以下顺序写：

1. 适用性结论：适合 / 暂不适合 / 先做准备。
2. 推荐试点：选择一个 Standard 轨真实小需求。
3. 30/60/90 天路线：每阶段写业务结果，不只写工具动作。
4. 责任分工：Project Owner、AI PM、执行 Agent、验收人、Knowledge Writeback。
5. 风险与裁剪：说明哪些 Gate 保留、裁剪或加强。
6. 度量：返工率、Gate 通过率、知识回写及时率、评审负载。

管理层不需要先看到完整工具链；他们需要先看到决策点、投入、风险、边界和验证方式。

### 最小可交付演示环境

```text
知识库骨架 + 执行记录 + Agent 输出记录 + Gate 记录 + 五资产快照 + Lessons
```

Dashboard 可先是原型；Gateway 可先是 mock 日志；字段必须能追溯到演示 trace。

### 多智能体/多模型试点

当团队同时试用 KIMI、GLM、MiniMax、Claude、DeepSeek、WorkBuddy 或其他 runtime 时，先保持 ANDS-T、Track、Gate Checklist 和 validation rubric 不变，只更换一个 runtime 变量。

试点记录建议使用 capability matrix：

- 记录上下文处理、工具使用、结构化输出、治理行为、验证行为和知识回写。
- 把未知项写成 `unknown`，不要写成能力缺陷。
- 不把一次试跑结果写成公开 benchmark 或厂商排名。
- 如需真实 API、密钥、企业连接器、真实数据或自动写回，升级 Enterprise Track。

### 常见阻力与应对

| 阻力 | 应对 |
|---|---|
| “流程太重” | 用 Track 裁剪，Quick 任务只保留必要检查 |
| “AI 已经能写代码” | 回到知识资产、验收、复盘和组织复用 |
| “管理者看不懂工具细节” | 给路线图、风险、投入、指标，不讲实现细节 |
| “实践者觉得只有概念” | 直接给 ANDS-T、Gate、Lessons、Agent 矩阵模板 |
| “指标短期不好看” | 先建立基线；度量用于改进，不用于粉饰 |

### 采用反模式

| 反模式 | 表现 | 修正 |
|---|---|---|
| 工具链崇拜 | 只比较 Cursor、Codex、Agent 或 Gateway，不改任务标准 | 回到 ANDS-T、知识回写、Gate 和复盘 |
| 一步到平台 | 试点第一天就要求生产级 Gateway、Dashboard 或全自动流程 | 先用手工记录跑通闭环，再决定自动化 |
| 管理层只看速度 | 只汇报 AI 交付更快，不看返工、验收失败和知识复用 | 加入质量、知识资产和人的负载指标 |
| 无验收人试点 | 需求可做，但没有人愿意承担 Gate 3 | 不进入正式试点，先补 Project Owner 和 Acceptance |
| 反馈不入库 | 种子用户反馈只停留在聊天里 | 转成脱敏 feedback intake、Lessons 或 regression prompt |

## 输出口径

管理者输出：

- 开头给适用性结论。
- 输出 30/60/90 路线图、试点选择标准、责任人、风险和度量。
- 明确哪些事情 v0.1 不做：生产级 Gateway、完整 Dashboard、全量课程迁移。

实践者输出：

- 输出第一周执行清单。
- 给出试点任务的 ANDS-T 草案、Track、Gate、Lessons 模板使用方式。
- 标明每个阶段的可验收产物。

## 输出要求

- 必须先推荐小试点，不默认组织全量推广。
- 必须包含知识回写和 Gate 5，否则不是完整 ANDS 试点。
- 必须保留 Track 制，避免把治理讲成官僚流程。
- 不包含可识别组织、项目、仓库地址或业务数据。

## 来源文件

- `docs/superpowers/specs/2026-08-11-ands-methodology-skill-design.md`
- `INDEX.canvas`
- `03 Methodology/07工作流模型.canvas`
- `03 Methodology/09治理模型.canvas`
- `03 Methodology/10度量模型.canvas`
- `04 Knowledge/04 Technical/ANDS课程开发方案.md`
- `04 Knowledge/02 Product/NOTE-ANDS课程架构评估与修改建议.md`
- `04 Knowledge/02 Product/NOTE-ANDS课程方案v1.7二次评估与调整建议.md`
