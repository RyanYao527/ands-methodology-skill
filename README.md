# ANDS Nexus Skill

**ANDS Nexus**（`ands-nexus`）是一个公开的 Codex skill 包，用于把 AI-Native Development System (ANDS) 的团队协作方法整理成可复用的 references、templates、examples 和轻量验证脚本。

它面向正在用 AI agent / 大模型参与研发、文档、产品或运营协作的团队，帮助团队把“让 AI 做事”拆成更清楚的任务、角色、证据、验收和知识回写流程。它更接近一个 adoption / governance toolkit，而不是完整课程、生产级平台或厂商能力评测项目。

Quick fit check:

- Best for teams already using AI agents but missing shared task, Gate, owner, and Lessons discipline.
- A 30-day pilot should produce ANDS-T cards, Track/Gate records, and reusable Lessons; it should not require platform work.
- Not a production AI Gateway, provider benchmark, hosted workflow product, or connector pack.
- First runs should use synthetic or desensitized tasks.
- If you need live APIs, credentials, tenant systems, automatic persistence, or public provider comparisons, route to Enterprise review first.

## What It Helps With

- 管理落地：设计 30/60/90 天试点计划、选择 Quick / Standard / Enterprise Track、定义治理边界和度量。
- 任务表达：把普通需求改写成 ANDS-T，并补齐目标、输入、约束、验收和 Gate。
- 引导式工作流：把 Intake、ANDS-T、Gate Checklist 和 Lessons Draft 拆成可连续执行的 visible-state steps。
- Agent 协作：区分 AI PM / Orchestrator、Execution、Validation、Governance、Writeback 等角色。
- 多 runtime 适配：在 prompt / profile / template 层面，为 Codex/OpenAI baseline、KIMI、GLM、MiniMax、Claude、DeepSeek、WorkBuddy 等 runtime 做离线适配准备。
- 反馈沉淀：把脱敏后的试用反馈、延期原因、返工原因和有效做法转成 Lessons 或 regression prompt。

## Current Release

当前公开版本是 `v0.4.1`，已于 2026-08-18 发布。

Release URL: <https://github.com/RyanYao527/ands-nexus/releases/tag/v0.4.1>

`v0.4.1` is a bounded stabilization patch for the documentation-first guided workflow MVP. It keeps the v0.4 scope and improves package availability, non-Codex and macOS/Linux onboarding, first-run glossary support, owner decision carry-forward, writeback boundary wording, formal-template mapping, validation transparency, and Track/Gate ownership language.

### Start Here

New users should begin with `START-HERE.md`, then run `examples/guided-workflow-first-run-v0.4.md`.

For the older compact first run, use `examples/first-run-prompt-packet-v0.3.1.md`.

### Included In v0.4.1

- `ands-nexus/references/guided-workflow-mvp.md` for the four-step guided workflow and role/state model.
- `ands-nexus/references/glossary.md` for first-run terminology.
- `ands-nexus/assets/templates/guided-workflow-state-packet.md` for copyable workflow state.
- `examples/guided-workflow-first-run-v0.4.md` for a synthetic Intake -> ANDS-T -> Gate -> Lessons run.
- `examples/guided-workflow-regression-v0.4.md` for checking role drift, skipped Gate evidence, missing owner decision, writeback overreach, and Enterprise escalation.
- `validate_release.ps1`, `validate_templates.ps1`, and `test_validate_release.ps1` checks for the v0.4 guided workflow assets.
- `START-HERE.md` for a shorter first-run path.
- `examples/INDEX.md` for choosing the right example.
- `examples/post-release-feedback-intake-v0.3.1.md` for public feedback triage.
- `examples/first-run-prompt-packet-v0.3.1.md` for one 10-minute ANDS-T + Gate + Lessons run.
- `examples/role-routing-regression-scenarios-v0.3.1.md` for checking AI PM, Execution, Validation, Governance, and Writeback separation.
- Offline/proxy provider adaptation references and handoff patterns.
- Prompt/profile/template-level guidance for multi-runtime ANDS usage.
- Provider label and role-routing matrix patterns.
- Synthetic/proxy forward-test methodology.
- Governance boundaries for future provider-native/API/tenant/connector/writeback work.
- Release validation guards for provider-native/API/tenant/writeback/benchmark claim overreach.

### v0.4.1 Release Validation Status

- `test_validate_release.ps1`: PASS.
- `validate_release.ps1`: PASS; when `-QuickValidatePath` is not supplied it prints `SKIP quick_validate (no -QuickValidatePath; external Codex skill-creator tool not in repo)`.
- `validate_release.ps1 -QuickValidatePath ...`: PASS when the external `quick_validate.py` path is supplied.
- `quick_validate.py`: PASS in release execution evidence; `quick_validate.py is external` and is not included in this repository.
- `git diff --check`: PASS.
- Public package scan: PASS.
- GitHub release: non-draft, non-prerelease.

### Evidence Level And Boundaries

v0.4.1 的证据等级仍是 documentation / local validation / synthetic example。它可以作为 guided ANDS first-run 和后续 workflow automation discovery 的准备材料，但不能被解读为真实 runtime 能力证明。

Non-Scope: no provider-native validation, no API integration, no credential setup, no tenant connectors, no unattended or automated writeback, no benchmark ranking.

Writeback boundary: user-invoked draft generation to an explicit path is allowed only when explicitly requested. It does not authorize unattended persistence, Vault scans, GitHub sync, provider workspace writes, or enterprise-system updates.

## Previous Releases

- `v0.4.0`：documentation-first guided workflow MVP，新增 guided workflow reference、state packet template、first-run example 和 regression prompts。Release URL: <https://github.com/RyanYao527/ands-nexus/releases/tag/v0.4.0>。
- `v0.3.1`：post-release adoption hardening patch，新增 START-HERE、examples index、feedback intake、10 分钟首跑 prompt packet 和 role-routing regression scenarios。Release URL: <https://github.com/RyanYao527/ands-nexus/releases/tag/v0.3.1>。
- `v0.3.0`：公开 offline/provider-adaptation documentation package，覆盖 provider adaptation references、role-routing matrix patterns、prompt/profile/template-level guidance 和 synthetic/proxy forward-test methodology。Release URL: <https://github.com/RyanYao527/ands-nexus/releases/tag/v0.3.0>。
- `v0.2.2`：公开 prompt/profile/template-level multi-agent/model adapter pack，覆盖 capability matrix、adapter card、provider profile cards 和 forward-test suite。Release URL: <https://github.com/RyanYao527/ands-nexus/releases/tag/v0.2.2>。
- `v0.2.1`：新增 30-day pilot template、post-release feedback intake、release validation aggregator 和 `.gitattributes`。Release URL: <https://github.com/RyanYao527/ands-nexus/releases/tag/v0.2.1>。
- `v0.2.0`：补强 Windows UTF-8 说明、seed-user feedback intake、forward-test scenarios、Track/Gate 反模式和 Obsidian writeback MVP。Release URL: <https://github.com/RyanYao527/ands-nexus/releases/tag/v0.2.0>。
- `v0.1.0`：初始公开版本，包含 skill skeleton、core references、templates、examples 和 template validation script。

## Installation

将本仓库根目录下的 `ands-nexus/` skill 文件夹复制或安装到 Codex 使用的 skills 目录中。安装后，目标 skills 目录下应直接出现 `ands-nexus/SKILL.md`。

The installable skill folder now includes `ands-nexus/examples/` copies of the examples routed from `SKILL.md`. The repository root `examples/` folder remains the public browsing index.

安装后，在 Codex 中使用 `$ands-nexus`，或用 ANDS、AI-Native Development System、ANDS-T、Gate、Track、Agent 矩阵、Lessons 等关键词触发。

Windows PowerShell 示例：

```powershell
$target = Join-Path $env:USERPROFILE ".codex\skills\ands-nexus"
New-Item -ItemType Directory -Force (Split-Path $target) | Out-Null
Copy-Item -Recurse -Force .\ands-nexus $target
Test-Path (Join-Path $target "SKILL.md")
```

If you are not using Codex, load `ands-nexus/SKILL.md` as the main instruction in your AI tool, then attach or paste only the reference, template, and example files named in the Task Routing row that matches your request. `$ands-nexus` is a Codex trigger, not a required syntax for other runtimes.

macOS/Linux users can run the validation helpers with PowerShell Core:

```bash
brew install powershell ripgrep
pwsh -NoProfile -File ./ands-nexus/scripts/validate_templates.ps1
pwsh -NoProfile -File ./ands-nexus/scripts/test_writeback_mvp.ps1
pwsh -NoProfile -File ./ands-nexus/scripts/test_validate_release.ps1
pwsh -NoProfile -File ./ands-nexus/scripts/validate_release.ps1
```

On Linux, install equivalent packages for PowerShell Core and ripgrep with your package manager, then use the same `pwsh -File` commands. `validate_release.ps1` requires `rg` for public package scans and will print an install hint if it is missing.

仓库根目录验证：

```powershell
powershell -NoProfile -ExecutionPolicy Bypass -File .\ands-nexus\scripts\validate_templates.ps1
powershell -NoProfile -ExecutionPolicy Bypass -File .\ands-nexus\scripts\test_writeback_mvp.ps1
powershell -NoProfile -ExecutionPolicy Bypass -File .\ands-nexus\scripts\test_validate_release.ps1
powershell -NoProfile -ExecutionPolicy Bypass -File .\ands-nexus\scripts\validate_release.ps1
```

### Windows UTF-8 Note

如果在 Windows PowerShell 里读取中文 Markdown 出现 mojibake，先用 UTF-8 重新读取文件：

```powershell
Get-Content -Raw -Encoding UTF8 .\ands-nexus\SKILL.md
Get-Content -Raw -Encoding UTF8 .\ands-nexus\references\governance-and-metrics.md
```

这通常是读取方式问题，不代表 skill 内容损坏。

如需排查当前终端是否仍在错误解码，可先设置 UTF-8 输出，再检查是否能读到中文关键词、且没有常见 mojibake：

```powershell
chcp 65001 > $null
[Console]::OutputEncoding = [System.Text.Encoding]::UTF8
$OutputEncoding = [System.Text.Encoding]::UTF8
$text = Get-Content -LiteralPath .\ands-nexus\SKILL.md -Raw -Encoding UTF8
[pscustomobject]@{
  ContainsExpectedChinese = $text.Contains('方法论')
  ContainsCommonMojibake = $text.Contains('æ') -or $text.Contains('乱码')
}
```

## Use Cases

- 管理落地：为研发团队设计 30/60/90 天试点计划。
- ANDS-T 改写：把普通需求改写成 AI 可执行、可治理、可验收的任务卡。
- Agent 矩阵：区分 AI PM、执行 Agent 和工具/模型实例。
- 多模型适配：为 KIMI、GLM、MiniMax、Claude、DeepSeek、WorkBuddy 或其他 runtime 设计 ANDS-compatible prompt packet、capability matrix 和 forward-test。
- Gate / Track：按 Quick、Standard、Enterprise 调整治理强度。
- Lessons 回写：把延期、返工、失败或有效做法沉淀为可复用知识。
- 内部培训：准备 ANDS 简报、工作坊脚本或演示 trace。
- 种子反馈归类：把脱敏后的真实试用反馈转成修订任务和 regression prompt。
- Obsidian 回写草稿：生成项目内 frontmatter、双链和回写边界说明。
- 发布后反馈入口：把脱敏后的公开反馈转成 Track、修订任务和 regression prompt。
- 引导式首跑：用 visible State Packet 和 Next Prompt 串联 Intake、ANDS-T、Gate Checklist、Lessons Draft。

## Example Prompts

完整试用材料见 `examples/seed-user-prompts.md`。核心验收 prompt：

1. 我们是一个 20 人研发团队，已经在用 Cursor 和 Codex，但现在比较混乱，没有统一任务标准，也没有知识沉淀。请用 ANDS 给我一个 30 天试点方案。
2. 帮我把“给内部系统加一个导出周报功能”写成 ANDS-T。
3. 是不是所有任务都要过五道 Gate？这样会不会太重？
4. 我们想让 AI PM 调度多个 Agent 做需求拆解、开发、测试和发布，请帮我设计最小 Agent 矩阵。
5. 这次上线延期是因为验收标准写得太模糊，Agent 做完以后业务方说不是他们要的。请按 ANDS 写一次复盘。

v0.2 forward-test 场景见 `examples/forward-test-scenarios-v0.2.md`；种子用户反馈 intake 见 `examples/seed-user-feedback-intake-v0.2.md`；发布后反馈 intake 见 `examples/post-release-feedback-intake-v0.2.1.md`；多 runtime 适配 forward-test 见 `examples/agent-model-adaptation-forward-test-v0.2.2.md`；v0.3 offline provider profile material 见 `examples/provider-profile-cards-v0.3-internal.md` 和 `examples/provider-profile-offline-adoption-packet-v0.3.md`；v0.4 guided workflow material 见 `examples/guided-workflow-first-run-v0.4.md` 和 `examples/guided-workflow-regression-v0.4.md`。

## Package Map

```text
ands-nexus/
  README.md
  LICENSE
  RELEASE_NOTES.md
  PUBLISHING_CHECKLIST.md
  examples/
  ands-nexus/
    SKILL.md
    agents/openai.yaml
    examples/       # installable copies of SKILL-routed examples
    references/
    assets/templates/
    scripts/        # optional validation and writeback MVP helpers
```

## Known Limits

- 不提供完整 37 节课程内容。
- 不构建生产级 AI Gateway。
- 不提供一键部署 Dashboard、GitHub Actions 或 Obsidian 自动化。
- Non-Scope: v0.4.1 has no provider-native validation, no API integration, no credential setup, no tenant connectors, no unattended or automated writeback, no benchmark ranking。
- 不承诺所有团队都适合一次性全量引入五道 Gate。
- Obsidian writeback MVP 只生成草稿或写入显式指定路径；不扫描或批量改写 Vault。No unattended or automated writeback；user-invoked draft generation to an explicit path is allowed only when explicitly requested。若显式 `-OutputPath` 的父目录不存在，脚本可能创建该父目录，且只作用于用户明确给出的路径。
- 本包已经完成 v0.1.0 发布前脱敏审查。
- `v0.2.1` 已完成公开发布前最终脱敏审查；后续真实反馈仍应先脱敏再进入 examples 或 validation。
- `v0.3.x` 证据来自 design / official-doc-reviewed / proxy or synthetic forward-test 层级，不代表 runtime capability evidence 或 provider selection advice。
- `v0.4.1` guided workflow material is documentation-first and does not provide workflow automation, hosted UI, or provider-native execution evidence.

## License

当前 `LICENSE` 使用 MIT 文本，Project Owner 已于 2026-08-12 确认正式采用 MIT License，并已确认可公开发布 v0.1 / v0.2 / v0.3 / v0.4。
