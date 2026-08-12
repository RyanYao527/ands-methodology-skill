# Governance And Metrics

## 定位

本 reference 用于设计 ANDS-G 治理、Track 裁剪、Gate 1-5、失败动作和五类度量。重点是让治理可执行、可裁剪、可复盘，不把它写成固定重流程。

## 何时读取

- 用户问“是不是所有任务都要过五道 Gate”。
- 用户要 Gate Checklist、Track 判定卡、治理方案或复盘机制。
- 用户需要区分 Gate 2 机器检查与 Gate 3 人验收。
- 用户要建立指标、Dashboard 口径或 Gate 5 知识回写闭环。

## 核心规则/方法

### Track 判定

| Track | 适用任务 | Gate 强度 |
|---|---|---|
| Quick | 小改、文档、可回滚、低风险、无敏感数据 | 可豁免 Gate 1/3/4/5；保留必要机器检查和红线 |
| Standard | 普通业务功能，有明确验收，需要 CI 与人验收 | 默认走 7 阶段和 5 道 Gate |
| Enterprise | 生产关键路径、安全敏感、合规相关、不可轻易回滚、跨团队影响 | Standard + 双人验收、灰度、回滚、审计加强 |

规则：

- Track 必须写进 ANDS-T。
- Gate 2 校验 Track 声明是否合理，防止大任务走小轨。
- 裁剪的是检查强度，不是责任本身。

### Gate 1-5

| Gate | 所有者 | 通过标准 | 失败动作 |
|---|---|---|---|
| Gate 1 需求准入 | 人 | Goal 可测、Input 足够、Constraint 清楚、Track 合理 | 退回补充任务 |
| Gate 2 代码质量 | AI/CI | 测试、Lint、类型检查、构建、安全基线通过 | 修复后重提 |
| Gate 3 人验收 | 人 | Acceptance 的业务结果达成 | 返工或改写 Acceptance |
| Gate 4 发布审批 | 人 | 五资产同步、发布说明、回滚方案、灰度要求满足 | 暂停发布并补证据 |
| Gate 5 复盘审计 | AI 辅助，人确认 | Lessons 已写、知识已入库、改进 Issue 已创建、指标已更新 | 补写复盘或创建改进任务 |

### Gate 5 / Obsidian 知识回写闭环

Gate 5 不是收尾文档，而是下一轮质量提升的入口：

```text
交付事实 -> Lessons -> ANDS-K 归类 -> 改进 Issue -> 标准或模板更新 -> 下轮 Gate 1 输入
```

Gate 5 最小检查：

- 是否记录事件、影响、根因、检测到的 Gate、预防动作。
- 是否归入 ANDS-K 的至少一个知识域。
- 是否创建后续改进 Issue 或明确无需创建的理由。
- 是否更新相关指标：返工、缺陷、成本、知识复用或人的负载。
- 是否把需要修订的标准或模板交给对应维护者。

### 五类度量

| 类型 | 指标例子 | 数据源 |
|---|---|---|
| 效率 | Lead Time、发布频率、人时与 AI 时投入比 | GitHub、Gateway Monitor |
| 质量 | Gate 一次通过率、返工率、缺陷逃逸率 | 治理记录、GitHub |
| 成本 | Token 用量、单任务平均成本、趋势 | Gateway Monitor |
| 知识资产 | 入库量、8 域分布、复用率、Prompt/Pattern 增长 | Obsidian |
| 人的状态 | 评审负载、决策密度、信任校准 | GitHub、治理记录 |

度量闭环：

```text
指标采集 -> Gate 5 复盘 -> 改进 Issue -> 标准迭代 -> 下轮指标对比
```

### 失败升级

- 同一任务连续失败达到团队阈值时，自动挂起。
- 人决策：改任务、换 Agent、补上下文、降范围或人工接管。
- 失败不可静默；No-Go 是有效治理结果。

## 输出口径

管理者输出：

- 输出 Track 决策表、Gate 所有者、失败升级、指标看板口径。
- 解释治理如何控制风险与人的负载。
- 强调不是所有任务都走完整五道 Gate。

实践者输出：

- 输出 Gate Checklist、Track 判定卡、Lessons 结构、改进 Issue。
- 明确每个 Gate 的证据、命令或验收记录。
- 对 Acceptance、Gate 2、Gate 3 分开写。

## 输出要求

- 必须包含 Gate 5 和知识回写闭环。
- 必须把度量写成复盘输入，不写成纯汇报。
- 必须给出 Track 裁剪建议。
- 不包含真实 CI 链接、仓库、域名、IP 或凭据。

## 来源文件

- `03 Methodology/05任务模型.canvas`
- `03 Methodology/07工作流模型.canvas`
- `03 Methodology/09治理模型.canvas`
- `03 Methodology/10度量模型.canvas`
- `04 Knowledge/02 Product/ANDS-Demo/Gate映射表.md`
- `04 Knowledge/02 Product/ANDS-Demo/mock-Gateway日志与Dashboard原型.md`
- `04 Knowledge/08 Lessons/LSN-跨Canvas模型口径一致性校验.md`
