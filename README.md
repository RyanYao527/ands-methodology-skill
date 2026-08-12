# ands-methodology Skill

`ands-methodology` 是一个 Codex skill，用于帮助团队采用或实践 AI-Native Development System (ANDS)。它聚焦两件事：管理落地和最小实践模板。

它可以辅助管理者评估适用边界、设计试点路线、定义治理与度量机制；也可以辅助实践者编写 ANDS-T、Agent 矩阵、Gate Checklist、Track 判定和 Lessons 回写。

它不是完整课程仓库，也不是生产级 AI Gateway、Dashboard、GitHub Actions 或 Obsidian 自动化平台。

## Status

当前版本是 `v0.1.0`。

已完成：

- skill skeleton 与目录边界。
- `ands-methodology/SKILL.md`。
- `ands-methodology/agents/openai.yaml`。
- 7 个 references。
- 6 个 templates。
- 7 个 examples。
- template validation script。

验证状态：

- `quick_validate.py` 已通过。
- `validate_templates.ps1` 已通过。
- 5 条验收 prompt 的材料回归结果为 PASS。
- Governance & Security 审查结论为 PASS_WITH_NOTES，无发布阻断项。
- Project Owner 已确认公开发布，并确认正式采用当前 MIT License。
- 真实运行和 forward-test 可作为 v0.2 前的补充验证。

## Installation

将仓库中的 `ands-methodology-skill/ands-methodology/` 文件夹复制或安装到 Codex 使用的 skills 目录中。安装后，目标 skills 目录下应直接出现 `ands-methodology/SKILL.md`。

安装后，在 Codex 中使用 `$ands-methodology`，或用 ANDS、AI-Native Development System、ANDS-T、Gate、Track、Agent 矩阵、Lessons 等关键词触发。

## Use Cases

- 管理落地：为研发团队设计 30/60/90 天试点计划。
- ANDS-T 改写：把普通需求改写成 AI 可执行、可治理、可验收的任务卡。
- Agent 矩阵：区分 AI PM、执行 Agent 和工具/模型实例。
- Gate / Track：按 Quick、Standard、Enterprise 调整治理强度。
- Lessons 回写：把延期、返工、失败或有效做法沉淀为可复用知识。
- 内部培训：准备 ANDS 简报、工作坊脚本或演示 trace。

## Example Prompts

完整试用材料见 `examples/seed-user-prompts.md`。核心验收 prompt：

1. 我们是一个 20 人研发团队，已经在用 Cursor 和 Codex，但现在比较混乱，没有统一任务标准，也没有知识沉淀。请用 ANDS 给我一个 30 天试点方案。
2. 帮我把“给内部系统加一个导出周报功能”写成 ANDS-T。
3. 是不是所有任务都要过五道 Gate？这样会不会太重？
4. 我们想让 AI PM 调度多个 Agent 做需求拆解、开发、测试和发布，请帮我设计最小 Agent 矩阵。
5. 这次上线延期是因为验收标准写得太模糊，Agent 做完以后业务方说不是他们要的。请按 ANDS 写一次复盘。

## Package Map

```text
ands-methodology-skill/
  README.md
  LICENSE
  RELEASE_NOTES.md
  PUBLISHING_CHECKLIST.md
  examples/
  ands-methodology/
    SKILL.md
    agents/openai.yaml
    references/
    assets/templates/
    scripts/validate_templates.ps1
```

## Known Limits

- 不提供完整 37 节课程内容。
- 不构建生产级 AI Gateway。
- 不提供一键部署 Dashboard、GitHub Actions 或 Obsidian 自动化。
- 不承诺所有团队都适合一次性全量引入五道 Gate。
- 本包已经完成 v0.1.0 发布前脱敏审查。
- 真实运行和 forward-test 仍可作为 v0.2 前的补充验证。

## License

当前 `LICENSE` 使用 MIT 文本，Project Owner 已于 2026-08-12 确认正式采用 MIT License，并确认可公开发布 v0.1。
