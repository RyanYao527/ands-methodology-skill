# 种子用户试用 Prompt

> 用途：供 v0.1 回归验收和种子用户试用。所有 prompt 都避免真实组织、人员、仓库、网络地址和敏感业务数据。

## v0.1 验收 Prompt

### 1. 管理落地

```text
我们是一个 20 人研发团队，已经在用 Cursor 和 Codex，但现在比较混乱，没有统一任务标准，也没有知识沉淀。请用 ANDS 给我一个 30 天试点方案。
```

期望观察：

- 先判断适用性。
- 给出 30 天试点路线。
- 包含试点项目选择标准。
- 包含最小标准：ANDS-T、知识域、Gate、Lessons。
- 不要求一开始建设完整 Gateway。

### 2. ANDS-T 改写

```text
帮我把“给内部系统加一个导出周报功能”写成 ANDS-T。
```

期望观察：

- 包含 Goal / Input / Constraint / Output / Acceptance。
- Acceptance 是业务可验证结果。
- 声明 Track。
- 给出 Gate 建议。

### 3. 治理边界

```text
是不是所有任务都要过五道 Gate？这样会不会太重？
```

期望观察：

- 明确回答不是。
- 解释 Quick / Standard / Enterprise。
- 说明治理强度随风险变化。
- 保留 Gate 思维但裁剪执行成本。

### 4. Agent 矩阵

```text
我们想让 AI PM 调度多个 Agent 做需求拆解、开发、测试和发布，请帮我设计最小 Agent 矩阵。
```

期望观察：

- 区分 AI PM 与执行 Agent。
- 说明 AI PM 是决策级编排。
- 说明 Gateway 是机械执行级调度。
- 给出 L1 / L2 / L3 映射。

### 5. Lessons 回写

```text
这次上线延期是因为验收标准写得太模糊，Agent 做完以后业务方说不是他们要的。请按 ANDS 写一次复盘。
```

期望观察：

- 归因到 ANDS-T 与 Gate 1 / Gate 3。
- 生成 Lessons。
- 提出标准迭代建议。
- 给出后续改进 Issue。

## 种子用户试用 Prompt

### A. 试点项目选择

```text
我们有三个候选需求：修正文档说明、导出内部周报、调整权限策略。请用 ANDS Track 帮我判断哪个适合作为 30 天试点主线，并说明 Gate 强度。
```

### B. AI PM 拆解

```text
请把“导出内部周报”这个 Standard 轨任务拆成 AI PM 可以分配给多个 Agent 的任务集，说明每个 Agent 的输入、输出和 Gate 责任。
```

### C. Gate 失败处理

```text
一个 Standard 轨任务 Gate 2 已通过，但 Gate 3 业务验收失败。请按 ANDS 说明下一步应该返工、改 Acceptance，还是升级 Track。
```

### D. 五资产快照

```text
请为一个已完成的内部功能发布写一份五资产快照，范围包括 Knowledge、Prompt、Architecture、Workflow、Code，并说明哪些内容需要 Gate 5 回写。
```

### E. 团队复盘

```text
我们试点一个月后发现：AI 交付速度变快，但返工仍然多。请按 ANDS 度量模型设计一次复盘，输出需要更新的标准、模板和后续 Issue。
```

### F. Windows UTF-8 读取恢复

```text
我在 Windows PowerShell 里读取 ands-nexus 的中文 Markdown 时出现乱码。请说明如何重新读取，并给出验证命令。
```

期望观察：

- 使用 `Get-Content -Raw -Encoding UTF8`。
- 判断这是读取方式问题，不是 skill 内容损坏。
- 给出可复制命令，例如读取 `SKILL.md` 或 governance reference。
- 可选加固：设置 `[Console]::OutputEncoding` / `$OutputEncoding`，并用 `ContainsExpectedChinese` 与 `ContainsCommonMojibake` 判断读取结果。

### G. 种子反馈归类

```text
一个种子用户反馈：他们理解 Track，但实际写任务时总把 Acceptance、Gate 2 和 Gate 3 混在一起。请按 ANDS 把这个反馈归类，并给出应修改的 skill 资产和回归 prompt。
```

期望观察：

- 归类到 governance、template 或 validation。
- 指向相关 reference/template。
- 提醒真实反馈先按 `examples/seed-user-feedback-intake-v0.2.md` 脱敏。

### H. Acceptance / Gate 2 / Gate 3 拆分纠偏

```text
请帮我纠正这张 ANDS-T：Acceptance 里写了“lint 通过、单测通过、导出文件字段正确、业务方确认可用”。请说明哪些应留在 Acceptance，哪些应进入 Gate 2，哪些应进入 Gate 3。
```

期望观察：

- `lint 通过`、`单测通过` 归 Gate 2 机器质量。
- `导出文件字段正确` 保留为业务可验证 Acceptance。
- `业务方确认可用` 归 Gate 3 人验收。
- 说明 Gate 2 通过不能替代 Gate 3，Gate 3 失败时应返工或重写 Acceptance。

## Forward-Test Corpus

更多独立 Agent forward-test 场景见 `examples/forward-test-scenarios-v0.2.md`。
