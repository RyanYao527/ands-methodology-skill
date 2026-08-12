# Platform 5 Components

## 定位

本 reference 定义 ANDS 平台层五组件的职责边界。它用于解释“知识在哪里、执行在哪里、调度在哪里、状态怎么看”，不用于设计生产级平台实现。

## 何时读取

- 用户要理解 Dashboard、Obsidian、GitHub、AI Agent、AI Gateway 的关系。
- 用户要设计最小平台、Agent 矩阵、上下文注入或监控口径。
- 用户把 AI PM 和 Gateway 混在一起时。
- 用户需要管理层平台投入估算或实践者最小搭建清单。

## 核心规则/方法

### 五组件速查

| 组件 | 一句话定义 | v0.1 使用边界 |
|---|---|---|
| Dashboard | 项目总控台 | 展示任务、Gate、Agent、度量状态；可先用原型 |
| Obsidian | Project Brain，长期知识中心 | 存知识、决策、Prompt、Lessons，不存敏感执行细节 |
| GitHub | Execution Database，执行数据库 | 承载 Issue、PR、CI、Release 等执行记录 |
| AI Agent | 员工矩阵 | 按 L1/L2/L3 分层匹配任务能力 |
| AI Gateway | 机械调度中枢 | 路由、上下文注入、监控、限流；不负责思考和决策 |

### 数据流口径

```text
Obsidian 提供知识
AI PM 选择任务、Agent 和上下文清单
Gateway 机械执行路由与注入
Agent 产出执行结果
GitHub 记录 Issue/PR/CI/Release
Dashboard 汇总状态与度量
Gate 5 将 Lessons 和指标回写 Obsidian
```

### AI PM 与 Gateway 的边界

| 问题 | AI PM | Gateway |
|---|---|---|
| 拆哪些任务 | 决策 | 不负责 |
| 选择哪个 Agent | 决策 | 按规则执行路由 |
| 需要哪些上下文 | 决策 | 拉取、组装、注入 |
| 是否返工 | 过程质检与重规划 | 记录状态、触发重试 |
| 成本、耗时、错误 | 解读和调整策略 | 采集日志与指标 |

### 最小平台建议

Quick 试点：

- 知识库：建立 8 域目录或标签。
- 执行库：用 Issue/PR/CI 记录执行。
- Agent：先定义 3-5 个常用分工。
- Dashboard：用表格或静态面板即可。
- Gateway：可用手工脚本或 mock 日志表达四组件数据流。

Standard 试点：

- 任务必须有 ANDS-T。
- 交付必须有 Gate 2 和 Gate 3 记录。
- 发布必须有五资产快照。
- 复盘必须有 Lessons 和改进 Issue。

Enterprise 场景：

- 加强权限、审计、双人验收、灰度和回滚要求。
- 不把 v0.1 reference 写成生产级 Gateway 架构方案。

## 输出口径

管理者输出：

- 输出平台蓝图、组件职责、投入阶段、风险清单。
- 强调“先标准化，再自动化”。
- 明确 v0.1 可用原型或 mock，不承诺生产级平台。

实践者输出：

- 输出最小搭建清单、字段、日志样式、状态面板口径。
- 标明每个组件输入、输出和验收方式。
- 对 Gateway 只写职责，不写完整实现。

## 输出要求

- 必须保留“知识在 Obsidian，执行在 GitHub，调度在 Gateway”。
- 不把 GitHub 写成知识库，不把 Obsidian 写成代码仓库。
- 不把 Gateway 写成 AI PM。
- 不包含可识别仓库地址、域名、IP、凭据或本地路径。

## 来源文件

- `02 Platform/01 Dashboard.canvas`
- `02 Platform/02 Obsidian.canvas`
- `02 Platform/03 Github.canvas`
- `02 Platform/04 AI Agent.canvas`
- `02 Platform/05 AI Gateway.canvas`
- `03 Methodology/02团队模型.canvas`
- `03 Methodology/06调度模型.canvas`
- `03 Methodology/10度量模型.canvas`
