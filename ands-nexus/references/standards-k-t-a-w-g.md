# ANDS-K/T/A/W/G Standards

## 定位

本 reference 定义 ANDS 五大标准的最小可执行口径。使用它生成团队标准草案、改写任务、设计 Agent 分工、检查工作流或解释 Gate 时，不展开课程全文。

## 何时读取

- 用户要制定团队版 ANDS 标准。
- 用户要把普通需求改写成 ANDS-T。
- 用户问知识域、Agent 矩阵、工作流或 Gate 的关系。
- 需要检查输出是否把 Acceptance、Gate 2、Gate 3 混淆。

## 核心规则/方法

### 五标准最小定义

| 标准 | 最小定义 | 使用规则 |
|---|---|---|
| ANDS-K | 知识组织标准，按 8 大知识域沉淀长期资产 | 每个任务至少链接相关知识域，交付后回写 Lessons |
| ANDS-T | 任务描述标准，结构为 Goal / Input / Constraint / Output / Acceptance | Acceptance 只写业务可验证结果，工程质量交给 Gate 2 |
| ANDS-A | Agent 角色标准，分 L1 角色、L2 分工、L3 实例 | 不把角色、岗位分工、具体工具混成一层 |
| ANDS-W | 工作流标准，覆盖需求到复盘的 7 阶段 | 由 Track 决定执行强度，不要求所有任务全量流程 |
| ANDS-G | 治理标准，定义 5 道质量门禁和失败动作 | 保留门禁思想，按风险裁剪成本 |

### ANDS-K：8 大知识域

```text
Vision / Product / Business / Technical / Decision / Prompt / Code Pattern / Lessons
```

使用规则：

- 8 域是分类体系，不是每个项目都必须填满。
- 同一份知识可以同时属于时序管道的一站和知识分类的一域。
- Lessons 必须能反哺下一轮任务、Gate 或标准。

### ANDS-T：任务五段式

| 字段 | 写法 |
|---|---|
| Goal | 一句话说明业务目标，不写实现细节 |
| Input | 列出真实上下文、知识链接、约束来源 |
| Constraint | 写红线、环境、技术、安全和范围限制 |
| Output | 写交付物形态，如 PR、报告、模板、方案 |
| Acceptance | 写业务可验证结果，作为 Gate 3 人验收依据 |

必须附加：

- `Track`: Quick / Standard / Enterprise。
- `Gate Requirement`: 本任务需要哪些 Gate，哪些可豁免，豁免理由是什么。
- `Knowledge Links`: 任务输入和回写去向。

### ANDS-A：三层 Agent 体系

| 层级 | 定义 | 示例口径 |
|---|---|---|
| L1 角色 | 产品、架构、开发、测试、支撑 | 用于管理者理解能力版图 |
| L2 分工 | 架构、前端、后端、测试、安全、UI、数据、文档、发布 | 用于 AI PM 分配任务 |
| L3 实例 | 具体模型、工具或 Agent 实例 | 用于工程配置，不写成组织岗位 |

边界：AI PM 负责决策级编排；执行 Agent 负责产出；Gateway 只做机械执行级调度。

### ANDS-W：7 阶段工作流

```text
需求 -> 拆解 -> 执行 -> 交付 -> 审查 -> 发布 -> 复盘
```

执行规则：

- 需求阶段产出 ANDS-T。
- 拆解阶段由 AI PM 生成任务集、优先级、Agent 匹配和上下文清单。
- 执行与交付阶段形成 Issue/PR/构建/文档等执行记录。
- 审查与发布阶段过 Gate 并形成五资产快照。
- 复盘阶段写 Lessons、改进 Issue、指标更新。

### ANDS-G：5 道 Gate

| Gate | 所有者 | 关注点 |
|---|---|---|
| Gate 1 需求准入 | 人 | Goal、Input、Constraint、Track 是否清楚 |
| Gate 2 代码质量 | AI/CI | 测试、Lint、类型检查、构建、安全基线 |
| Gate 3 人验收 | 人 | Acceptance 的业务结果是否达成 |
| Gate 4 发布审批 | 人 | 五资产快照、发布说明、回滚方案 |
| Gate 5 复盘审计 | AI 辅助，人确认 | Lessons、知识入库、改进 Issue、指标更新 |

## 输出口径

管理者输出：

- 输出团队级规则、责任边界、裁剪原则。
- 强调 Track 如何控制治理成本。
- 不展开工具配置细节。

实践者输出：

- 输出可填写模板、检查清单、示例任务卡。
- 标明每个字段怎么写、谁验收、失败后怎么处理。
- 默认给下一步执行动作。

## 输出要求

- 必须保留 K -> T -> A -> W -> G -> K 的闭环。
- 必须区分 Acceptance、Gate 2、Gate 3。
- 必须区分 L1/L2/L3 Agent。
- 不把五标准写成课程章节目录。

## 来源文件

- `01 Framework/AI-Native Development Manifesto.canvas`
- `03 Methodology/03知识模型.canvas`
- `03 Methodology/05任务模型.canvas`
- `03 Methodology/07工作流模型.canvas`
- `03 Methodology/09治理模型.canvas`
- `04 Knowledge/08 Lessons/LSN-跨Canvas模型口径一致性校验.md`
