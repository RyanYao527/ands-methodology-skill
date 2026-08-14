# Demo Trace Guide

## 定位

本 reference 用于把一个脱敏演示项目封装成 ANDS 六步 trace。它服务内部宣讲、工作坊、回归测试和案例复盘，不复刻完整课程脚本。

## 何时读取

- 用户要做 30 分钟 ANDS 演示或工作坊。
- 用户要把一个项目整理成教学 trace。
- 用户要说明 ANDS-T、AI PM、Agent、Gate、Release、Lessons 如何串起来。
- 用户要验证示例是否脱敏、可追溯、可复盘。

## 核心规则/方法

### 六步 trace

```text
1. ANDS-T 声明
2. AI PM 拆解
3. Agent 执行
4. Gate 流转
5. Release 五资产快照
6. Lessons 回写
```

### 每步展示物

| 步骤 | 展示物 | 要证明什么 |
|---|---|---|
| 1 ANDS-T | 五段式任务卡 + Track 声明 | 任务能被 AI 执行，验收能被人判断 |
| 2 AI PM | 任务拆解、优先级、Agent 匹配、上下文清单 | 编排是决策级工作，不是催进度 |
| 3 Agent | 执行摘要、关键变更、上下文注入记录 | Agent 按任务和红线执行，不在真空中工作 |
| 4 Gate | Gate 2 机器检查、Gate 3 人验收、必要的 No-Go 记录 | 质量靠门禁和证据，不靠口头保证 |
| 5 Release | Knowledge / Prompt / Architecture / Workflow / Code 快照 | 发布不是只有代码更新 |
| 6 Lessons | 事件、影响、根因、检测 Gate、预防动作、知识域、改进 Issue | 复盘进入知识库并影响下一轮标准 |

### Standard 主线与 Enterprise 对照

Standard 主线：

- 选择一个真实但低敏、范围可控的需求。
- 走完整六步，突出 Gate 2 与 Gate 3 边界。
- 展示知识回填和五资产快照。

Enterprise 对照：

- 只选一两个高风险片段作为对照。
- 强调双人验收、灰度、回滚、No-Go、证据补齐。
- 不展示生产细节、真实环境信息或敏感数据。

### 脱敏规则

必须替换或移除：

- 组织名称、个人姓名、仓库地址。
- 域名、IP、本地绝对路径。
- 口令、密钥、token、数据库凭据。
- 真实业务数据截图或可反推出业务的信息。

可以保留：

- 抽象任务编号、阶段编号、相对时间线。
- 脱敏后的角色名，如项目负责人、验收人、发布审批人。
- 工具类别和检查类型，如 lint、build、test、typecheck。
- 短哈希或编号仅在确认无法反推出真实环境时使用。

### 封装方法

1. 先选一个能走完六步的小需求。
2. 把原始材料改写为 ANDS-T，补 Track。
3. 让 AI PM 生成拆解结果和上下文清单。
4. 记录 Agent 执行摘要，不展示敏感 diff。
5. 将 Gate 结果写成证据表，保留 No-Go 和失败动作。
6. 写五资产快照，至少列出五类资产当前状态。
7. 写 Lessons，并映射到 ANDS-K 知识域。
8. 做脱敏扫描后再作为示例发布。

## 输出口径

管理者输出：

- 输出 30 分钟演示脚本、六步讲解图、管理层 takeaway。
- 强调“知识资产、治理边界、Track 裁剪、度量闭环”。
- 不展示工程细节或真实环境信息。

实践者输出：

- 输出 trace 采集清单、展示物模板、Gate 证据表、Lessons 模板。
- 标明每一步需要从哪里取证、如何脱敏、由谁确认。
- 用 demo trace 反向检查团队标准缺口。

## 输出要求

- 必须覆盖 ANDS-T -> AI PM -> Agent -> Gate -> Release -> Lessons。
- 必须保持脱敏，不含可识别组织、人员、仓库地址、域名、IP、凭据或业务敏感数据。
- 必须说明 mock 边界：Gateway/Dashboard 可以 mock，但字段应来自可追溯的演示 trace。
- 不把 demo guide 写成完整课程讲稿。

## 来源文件

- `04 Knowledge/02 Product/ANDS-Demo/30分钟演示脚本.md`
- `04 Knowledge/02 Product/ANDS-Demo/ANDS-T演示任务.md`
- `04 Knowledge/02 Product/ANDS-Demo/Gate映射表.md`
- `04 Knowledge/02 Product/ANDS-Demo/mock-Gateway日志与Dashboard原型.md`
- `04 Knowledge/02 Product/ANDS-Demo/五资产快照样例.md`
- `04 Knowledge/02 Product/ANDS-Demo/ANDS-K八域映射表.md`
- `03 Methodology/07工作流模型.canvas`
- `03 Methodology/08版本模型.canvas`
- `03 Methodology/09治理模型.canvas`
