# Forward-Test Scenarios v0.2

> 用途：供内部反馈版验证 `ands-nexus` skill 是否能在新对话中按需读取 reference/template，并产出可用结果。所有场景均为脱敏或合成材料。

## 使用规则

- 每条场景都使用用户式 prompt，不泄露期望答案。
- 执行者应先读取 `ands-nexus/SKILL.md`，再按路由读取需要的 reference/template。
- 观察记录写输入、读取文件、输出摘要、expected observation、是否通过、改进建议。
- 若使用真实种子用户反馈，先按 `seed-user-feedback-intake-v0.2.md` 脱敏和归类。

## FT01: Management Rollout

Prompt:

```text
我们是一个 20 人研发团队，已经在用 Cursor 和 Codex，但没有统一任务标准，也没有知识沉淀。请用 ANDS 给我一个 30 天试点方案。
```

Expected observation:

- 先判断适用性。
- 给出 30 天试点主线，不要求完整平台。
- 包含 ANDS-T、知识域、Track/Gate、Lessons。

Likely reads:

- `references/adoption-playbook.md`
- `references/governance-and-metrics.md`

## FT02: ANDS-T Rewrite

Prompt:

```text
帮我把“给内部系统加一个导出周报功能”写成 ANDS-T。
```

Expected observation:

- Goal / Input / Constraint / Output / Acceptance 齐全。
- Acceptance 只写业务可验证结果。
- 声明 Track 和 Gate 建议。

Likely reads:

- `references/standards-k-t-a-w-g.md`
- `assets/templates/ands-t-template.md`

## FT03: Gate Tailoring

Prompt:

```text
是不是所有任务都要过五道 Gate？Quick 轨能不能裁剪？
```

Expected observation:

- 明确不是所有任务都走完整五道 Gate。
- 说明裁剪的是强度，不是责任。
- 区分 Acceptance、Gate 2、Gate 3。

Likely reads:

- `references/governance-and-metrics.md`
- `assets/templates/track-decision-card.md`
- `assets/templates/gate-checklist.md`

## FT04: Agent Matrix

Prompt:

```text
我们想让 AI PM 调度多个 Agent 做需求拆解、开发、测试和发布，请帮我设计最小 Agent 矩阵。
```

Expected observation:

- 区分 Project Owner、AI PM、执行 Agent、AI Gateway。
- 给出 L1 / L2 / L3 映射。
- 不把 AI PM 写成机械 Gateway。

Likely reads:

- `references/methodology-10-models.md`
- `references/platform-5-components.md`
- `assets/templates/agent-matrix-template.md`

## FT05: Lessons Writeback

Prompt:

```text
这次上线延期是因为验收标准写得太模糊，Agent 做完以后业务方说不是他们要的。请按 ANDS 写一次复盘。
```

Expected observation:

- 归因到 ANDS-T 和 Gate 1 / Gate 3。
- 生成 Lessons、改进 Issue 和标准更新建议。
- 包含 Gate 5 / knowledge writeback 提醒。

Likely reads:

- `references/demo-trace-guide.md`
- `references/governance-and-metrics.md`
- `assets/templates/lessons-template.md`

## FT06: Windows UTF-8 Reread

Prompt:

```text
我在 Windows PowerShell 里读取中文 Markdown 时出现 mojibake。请告诉我如何重新读取 ands-nexus 的文件，并判断这是否说明 skill 内容损坏。
```

Expected observation:

- 给出 `Get-Content -Raw -Encoding UTF8`。
- 判断 mojibake 是读取方式问题，不是内容损坏证据。
- 建议用 UTF-8 重读目标文件。

Likely reads:

- `README.md`
- `examples/seed-user-prompts.md`

## FT07: Seed Feedback Triage

Prompt:

```text
一个种子用户反馈：他们理解 Track，但实际写任务时总把 Acceptance、Gate 2 和 Gate 3 混在一起。请按 ANDS 归类，并提出该修哪个 skill 资产和新增哪条回归 prompt。
```

Expected observation:

- 分类到 governance / task template / validation。
- 指向 `governance-and-metrics.md`、`ands-t-template.md` 或 `gate-checklist.md`。
- 提醒真实反馈先脱敏。

Likely reads:

- `references/governance-and-metrics.md`
- `examples/seed-user-feedback-intake-v0.2.md`

## FT08: Anti-Pattern Review

Prompt:

```text
请检查这个说法是否符合 ANDS：为了治理质量，所有任务都必须完整走五道 Gate，而且 Quick 轨也不能豁免。
```

Expected observation:

- 明确判定为反模式。
- 解释 Track 制和 Gate 裁剪。
- 不鼓励无记录跳过。

Likely reads:

- `references/adoption-playbook.md`
- `references/governance-and-metrics.md`

## FT09: Obsidian Writeback MVP

Prompt:

```text
请为一次项目 Lessons 生成 Obsidian 回写草稿，并说明哪些内容应该留在项目目录，哪些内容才可能回写到 ANDS 方法论母体。
```

Expected observation:

- 包含 frontmatter、上游/下游/相关链接。
- 明确项目事实先归项目。
- 不默认自动扫描或改写 Vault。
- 如使用脚本，只生成草稿或写显式路径。

Likely reads:

- `references/governance-and-metrics.md`
- `assets/templates/writeback-note-template.md`

