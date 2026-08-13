# ands-methodology Skill

`ands-methodology` 是一个 Codex skill，用于帮助团队采用或实践 AI-Native Development System (ANDS)。它聚焦两件事：管理落地和最小实践模板。

它可以辅助管理者评估适用边界、设计试点路线、定义治理与度量机制；也可以辅助实践者编写 ANDS-T、Agent 矩阵、Gate Checklist、Track 判定和 Lessons 回写。

它不是完整课程仓库，也不是生产级 AI Gateway、Dashboard、GitHub Actions 或 Obsidian 自动化平台。

## Status

当前公开版本是 `v0.2.0`。

`v0.2.0` 已于 2026-08-13 完成公开发布审批、最终验证、tag 和 GitHub release。Release URL: <https://github.com/RyanYao527/ands-methodology-skill/releases/tag/v0.2.0>。

v0.2.0 新增：

- Windows UTF-8 note。
- Windows UTF-8 diagnostic command for seed-user troubleshooting。
- 1 个 writeback note template。
- 2 个 examples：forward-test scenarios 与 seed-user feedback intake。
- Obsidian writeback MVP scripts。

v0.2.0 验证状态：

- `quick_validate.py`：PASS。
- `validate_templates.ps1`：PASS。
- `test_writeback_mvp.ps1`：PASS。
- 5-Agent seed-user read-only trial：PASS。
- T09/T10 Enterprise review：CONDITIONAL_GO，无 Critical blocker。
- Project Owner 已确认公开发布。
- `v0.2.0` tag 与 GitHub release 已创建。

v0.1.0 历史版本已完成：

- skill skeleton 与目录边界。
- `ands-methodology/SKILL.md`。
- `ands-methodology/agents/openai.yaml`。
- 7 个 references。
- 6 个 templates。
- 7 个 examples。
- template validation script。

## Installation

将仓库中的 `ands-methodology-skill/ands-methodology/` 文件夹复制或安装到 Codex 使用的 skills 目录中。安装后，目标 skills 目录下应直接出现 `ands-methodology/SKILL.md`。

安装后，在 Codex 中使用 `$ands-methodology`，或用 ANDS、AI-Native Development System、ANDS-T、Gate、Track、Agent 矩阵、Lessons 等关键词触发。

Windows PowerShell 示例：

```powershell
$target = Join-Path $env:USERPROFILE ".codex\skills\ands-methodology"
New-Item -ItemType Directory -Force (Split-Path $target) | Out-Null
Copy-Item -Recurse -Force .\ands-methodology $target
Test-Path (Join-Path $target "SKILL.md")
```

仓库根目录验证：

```powershell
powershell -NoProfile -ExecutionPolicy Bypass -File .\ands-methodology\scripts\validate_templates.ps1
powershell -NoProfile -ExecutionPolicy Bypass -File .\ands-methodology\scripts\test_writeback_mvp.ps1
```

### Windows UTF-8 Note

如果在 Windows PowerShell 里读取中文 Markdown 出现 mojibake，先用 UTF-8 重新读取文件：

```powershell
Get-Content -Raw -Encoding UTF8 .\ands-methodology\SKILL.md
Get-Content -Raw -Encoding UTF8 .\ands-methodology\references\governance-and-metrics.md
```

这通常是读取方式问题，不代表 skill 内容损坏。

如需排查当前终端是否仍在错误解码，可先设置 UTF-8 输出，再检查是否能读到中文关键词、且没有常见 mojibake：

```powershell
chcp 65001 > $null
[Console]::OutputEncoding = [System.Text.Encoding]::UTF8
$OutputEncoding = [System.Text.Encoding]::UTF8
$text = Get-Content -LiteralPath .\ands-methodology\SKILL.md -Raw -Encoding UTF8
[pscustomobject]@{
  ContainsExpectedChinese = $text.Contains('方法论')
  ContainsCommonMojibake = $text.Contains('æ') -or $text.Contains('乱码')
}
```

## Use Cases

- 管理落地：为研发团队设计 30/60/90 天试点计划。
- ANDS-T 改写：把普通需求改写成 AI 可执行、可治理、可验收的任务卡。
- Agent 矩阵：区分 AI PM、执行 Agent 和工具/模型实例。
- Gate / Track：按 Quick、Standard、Enterprise 调整治理强度。
- Lessons 回写：把延期、返工、失败或有效做法沉淀为可复用知识。
- 内部培训：准备 ANDS 简报、工作坊脚本或演示 trace。
- 种子反馈归类：把脱敏后的真实试用反馈转成修订任务和 regression prompt。
- Obsidian 回写草稿：生成项目内 frontmatter、双链和回写边界说明。

## Example Prompts

完整试用材料见 `examples/seed-user-prompts.md`。核心验收 prompt：

1. 我们是一个 20 人研发团队，已经在用 Cursor 和 Codex，但现在比较混乱，没有统一任务标准，也没有知识沉淀。请用 ANDS 给我一个 30 天试点方案。
2. 帮我把“给内部系统加一个导出周报功能”写成 ANDS-T。
3. 是不是所有任务都要过五道 Gate？这样会不会太重？
4. 我们想让 AI PM 调度多个 Agent 做需求拆解、开发、测试和发布，请帮我设计最小 Agent 矩阵。
5. 这次上线延期是因为验收标准写得太模糊，Agent 做完以后业务方说不是他们要的。请按 ANDS 写一次复盘。

v0.2 forward-test 场景见 `examples/forward-test-scenarios-v0.2.md`；种子用户反馈 intake 见 `examples/seed-user-feedback-intake-v0.2.md`。

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
    scripts/        # optional validation and writeback MVP helpers
```

## Known Limits

- 不提供完整 37 节课程内容。
- 不构建生产级 AI Gateway。
- 不提供一键部署 Dashboard、GitHub Actions 或 Obsidian 自动化。
- 不承诺所有团队都适合一次性全量引入五道 Gate。
- Obsidian writeback MVP 只生成草稿或写入显式指定路径；不扫描或批量改写 Vault。若显式 `-OutputPath` 的父目录不存在，脚本可能创建该父目录，且只作用于用户明确给出的路径。
- 本包已经完成 v0.1.0 发布前脱敏审查。
- `v0.2.0` 已完成公开发布前最终脱敏审查；后续真实反馈仍应先脱敏再进入 examples 或 validation。

## License

当前 `LICENSE` 使用 MIT 文本，Project Owner 已于 2026-08-12 确认正式采用 MIT License，并确认可公开发布 v0.1 / v0.2。
