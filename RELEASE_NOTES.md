# Release Notes

## v0.3.0 release candidate - Not released

`v0.3.0 release candidate` is in candidate preparation only. The current public release remains `v0.2.2`.

No `v0.3.0` tag or GitHub release exists yet.

### Candidate Summary

v0.3.0 candidate prepares public documentation for the v0.3 offline/provider-adaptation workstream. The candidate scope is limited to offline/proxy provider adaptation references, prompt/profile/template-level guidance, provider labels, role-routing matrix patterns, synthetic/proxy forward-test methodology, and governance boundaries for future Enterprise work.

### Candidate Scope

- Offline provider adaptation references and handoff patterns.
- Prompt/profile/template-level guidance for multi-runtime ANDS usage.
- Provider label and role-routing matrix patterns.
- Synthetic/proxy forward-test methodology.
- Governance boundaries for future provider-native/API/tenant/connector/writeback work.

### Candidate Validation Evidence

- AD46 release readiness intake and evidence map completed.
- AD47 v0.3 release-readiness review spec completed.
- AD48 readiness decision: `READY_FOR_RELEASE_CANDIDATE_PREP_AUTHORIZATION_REVIEW`.
- AD49 bounded candidate documentation prep authorization completed.
- AD50 bounded documentation edit validation is required before any later release decision.

### Candidate Non-Scope

- No provider-native validation.
- No API integration.
- No credential setup, no tenant connectors, and no automated writeback.
- No benchmark ranking, best-provider result, procurement guidance, or public provider capability claim.

### Release Boundary

v0.3.0 is not released. Public release still requires bounded candidate validation, Project Owner release Go, final release execution, tag creation, GitHub release creation, and Gate 5 closeout.

## v0.2.2 - 2026-08-13

`v0.2.2` 已完成公开发布执行。

Release URL: <https://github.com/RyanYao527/ands-nexus/releases/tag/v0.2.2>

### Summary

v0.2.2 adds a limited, provider-neutral multi-agent/model adapter pack for prompt/profile/template-level ANDS adaptation. It helps teams run comparable desensitized trials across Codex/OpenAI baseline, KIMI, GLM, MiniMax, Claude, DeepSeek, and WorkBuddy labels. Non-Scope: no provider-native validation, no API integration, no automated writeback, and no benchmark ranking.

### Added

- `multi-agent-model-adaptation.md`：provider-neutral guidance for adapting ANDS workflows to another agent/model runtime.
- `capability-matrix-template.md`：shared matrix for comparing runtime observations.
- `agent-model-adapter-card.md`：profile template for runtime-specific prompt packets.
- `provider-profile-cards-v0.2.2.md`：initial profile labels for Codex/OpenAI baseline, KIMI, GLM, MiniMax, Claude, DeepSeek, and WorkBuddy.
- `agent-model-adaptation-forward-test-v0.2.2.md`：shared five-role forward-test suite.

### Changed

- `SKILL.md` adds a route for adapting ANDS to another agent/model runtime.
- `governance-and-metrics.md` and `adoption-playbook.md` add multi-runtime Standard / Enterprise boundaries.
- README documents v0.2.2 development scope and non-scope.
- Prompt packets now strengthen execution, validation, and writeback boundaries after T09 proxy-trial findings.

### Validation Evidence

- Template validation requires the adapter card and capability matrix templates.
- Release validation checks updated reference/template/example counts.
- Aggregator regression checks provider labels and unsupported integration-claim boundaries.
- T09 provider-profile proxy trial completed with `PASS_WITH_FIXES_FOR_T10_INPUT`.
- T10 release readiness decision is `READY_FOR_PUBLIC_V0.2.2_RELEASE_EXECUTION` for the limited prompt/profile/template adapter pack.
- final release execution validation PASS.

### Non-Scope

- No live provider API integration.
- No credential setup, no tenant connectors, and no automated writeback.
- No public benchmark ranking or current vendor capability claims.

## v0.2.1 - 2026-08-13

`v0.2.1` 已完成 patch release 审批、最终验证、tag 和 GitHub release。

Release URL: <https://github.com/RyanYao527/ands-nexus/releases/tag/v0.2.1>

### Summary

v0.2.1 聚焦 v0.2.0 公开发布后的稳定化：新增反馈入口、30-day pilot template、release validation aggregator 和保守 line-ending policy，帮助后续 patch release 与试点扩围更稳。

### Added

- `30-day-pilot-template.md`：用于管理者把 ANDS 试点压缩成 30 天可执行计划。
- `post-release-feedback-intake-v0.2.1.md`：用于公开发布后的脱敏反馈入口。
- `validate_release.ps1`：聚合 template validation、writeback MVP test、optional skill quick validation、asset counts 和公开包扫描。
- `test_validate_release.ps1`：覆盖 release validation aggregator 的 happy path、quick validation failure 和 public scan blocking 行为。
- `.gitattributes`：为 Markdown、YAML、PowerShell 等文本文件声明 LF 行尾策略。

### Changed

- `SKILL.md` adoption route 增加 30-day pilot template。
- `SKILL.md` feedback route 增加 post-release feedback intake。
- README 更新为 v0.2.1 public patch release 状态和 release validation commands。

### Validation Evidence

- `test_validate_release.ps1` PASS：覆盖 aggregator happy path、quick validation failure 和 public scan blocking。
- `validate_release.ps1 -QuickValidatePath ...` PASS：template validation、writeback MVP、skill quick validation、asset counts、public package scan。
- `quick_validate.py` PASS：`Skill is valid!`。
- v0.2.1 release readiness check：`READY_FOR_OWNER_GO_NO_GO`。
- Governance & Security：`PASS_WITH_NOTE`，无 Critical / Important blocker。
- Project Owner Go 已确认。
- final patch release execution validation PASS。

### Security And Desensitization

- 未发现真实组织/公司、人员、仓库、域名、IP、凭据、本地绝对路径或业务敏感数据进入发布包。
- public package scan 会阻断通用 user home path、URL、IP 和 secret-like patterns；公开 GitHub release URL 与 checklist 中的说明性扫描命令文本为允许项。
- 发布后反馈 intake 要求先脱敏，再转成修订任务、regression prompt 或 Lessons。

### Compatibility

- 保持 Codex skill 结构：`ands-nexus/SKILL.md`、`agents/openai.yaml`、`references/`、`assets/templates/`、`scripts/`。
- 不引入外部运行时依赖；新增验证脚本为可选 PowerShell helper。
- 不改变 LICENSE；当前仍为 MIT。

### Known Limits

- 不是完整课程仓库。
- 不提供生产级 AI Gateway、Dashboard、GitHub Actions 或完整 Obsidian 自动化。
- 真实反馈进入 examples 或 validation 前仍需脱敏。

## v0.2.0 - 2026-08-13

`v0.2.0` 已完成公开发布审批、最终验证、tag 和 GitHub release。

Release URL: <https://github.com/RyanYao527/ands-nexus/releases/tag/v0.2.0>

### Summary

v0.2.0 聚焦内部反馈后的可用性补强：Windows UTF-8 读取、forward-test 场景、种子反馈 intake、Track/Gate 反模式、Acceptance / Gate 2 / Gate 3 拆分，以及 Obsidian writeback MVP。

### Added

- Windows PowerShell UTF-8 读取提示，帮助用户用 `Get-Content -Raw -Encoding UTF8` 恢复中文 Markdown 阅读。
- Windows UTF-8 诊断命令，帮助 seed user 检查 `ContainsExpectedChinese` 与 `ContainsCommonMojibake`。
- v0.2 forward-test scenario corpus，覆盖 UTF-8、反馈归类、反模式和 Obsidian writeback MVP。
- 种子用户反馈 intake 模板，用于把脱敏后的真实反馈转成可分派任务和 regression prompt。
- Obsidian writeback MVP：`new_writeback_note.ps1`、`test_writeback_mvp.ps1` 和 `writeback-note-template.md`。

### Changed

- 增强 management-facing overview/adoption guidance，强调结论先行、风险、投入、验收责任和度量。
- 将常见反模式并入 `governance-and-metrics.md` 与 `adoption-playbook.md`。
- 扩展 Track Decision Card 和 Gate Checklist，要求声明风险、可回滚性、敏感数据、验收人和失败动作。
- 根据 5-Agent seed-user trial 小修 Gate FAQ、Acceptance / Gate 2 / Gate 3 拆分例和 writeback `type / domain / pipeline` 变体说明。

### Validation Evidence

- `test_writeback_mvp.ps1` 已按 TDD 流程先失败后通过。
- `validate_templates.ps1` 已扩展到检查 writeback note template。
- `quick_validate.py` PASS：`Skill is valid!`。
- 5-Agent seed-user read-only trial PASS；FT-SU04 为 PASS_WITH_NOTE，已通过 seed-user feedback polish 修正。
- T09/T10 Enterprise review：`CONDITIONAL_GO`，无 Critical blocker。
- Project Owner Go 已确认。
- final release execution validation PASS。

### Security And Desensitization

- 未发现真实公司、人员、仓库、域名、IP、凭据、本地绝对路径或业务敏感数据进入发布包。
- secret/token 扫描的 `token` 命中位于“禁止凭据”的脱敏说明中，不代表真实泄露。
- Obsidian writeback MVP 只生成草稿或写入用户显式提供的 `-OutputPath`；不扫描或批量改写 Vault。
- 当显式 `-OutputPath` 的父目录不存在时，脚本可能创建该父目录；该行为只发生在用户明确给出的路径内。

### Compatibility

- 保持 Codex skill 结构：`ands-nexus/SKILL.md`、`agents/openai.yaml`、`references/`、`assets/templates/`、`scripts/`。
- 不引入外部运行时依赖；PowerShell 脚本面向 Windows PowerShell / PowerShell Core 常规环境。
- 不改变 LICENSE；当前仍为 MIT。

### Known Limits

- 不是完整课程仓库。
- 不提供生产级 AI Gateway、Dashboard、GitHub Actions 或完整 Obsidian 自动化。
- 不承诺所有团队都适合一次性全量引入五道 Gate。
- 真实反馈进入 examples 或 validation 前仍需脱敏。

## v0.1.0 - 2026-08-12

`ands-nexus` v0.1.0 将 ANDS 方法论整理为一个可安装的 Codex skill，优先支持管理落地与最小实践模板。

### 新增内容

- 新增 `ands-nexus/SKILL.md`，包含任务路由、输出层级、ANDS 原则检查和 Gate 5 回写提醒。
- 新增 `agents/openai.yaml`，用于 Codex skill 展示元信息。
- 新增 7 个 references：overview、五标准、十模型、五平台组件、采用路线、治理与度量、demo trace。
- 新增 6 个 templates：ANDS-T、ADR、Gate Checklist、Track Decision Card、Agent Matrix、Lessons。
- 新增 7 个 examples，覆盖管理落地、ANDS-T、Gate、Lessons、demo trace、脱敏说明和种子用户 prompt。
- 新增模板校验脚本 `ands-nexus/scripts/validate_templates.ps1`。
- 更新 GitHub 读者文档：README、release notes、publishing checklist。

### 验证状态

- `quick_validate.py`：PASS。
- `validate_templates.ps1`：PASS。
- 5 条验收 prompt 材料回归：PASS。
- Governance & Security 审查结论：PASS_WITH_NOTES，无 Critical / Important 阻断。
- Project Owner 已确认公开发布。
- Project Owner 已确认正式采用当前 MIT License。

### 已知限制

- v0.1 不是完整课程仓库。
- v0.1 不提供生产级 AI Gateway、Dashboard、GitHub Actions 或 Obsidian 自动化。
- 当前 LICENSE 已确认为 MIT。
- v0.1.0 发布前脱敏复核已完成。
- 真实运行和 forward-test 可作为 v0.2 前的补充验证。

### 下一步

- 将公开发布完成结果回写到 Gate 5 状态快照和 ADR。
- 收集种子用户试用反馈，形成 v0.2 改进项。
