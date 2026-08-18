# Publishing Checklist

本清单用于 `ands-nexus` skill 的内部试用、release candidate 准备和公开发布执行检查。当前公开版本是 `v0.3.1`；GitHub release: <https://github.com/RyanYao527/ands-nexus/releases/tag/v0.3.1>。

## v0.1.0 Released Archive

以下为 `v0.1.0` 的历史发布结论，不代表 `v0.2.0` 已完成公开发布审批。

- [x] Project Owner 已确认公开发布。
- [x] Project Owner 已确认正式采用当前 MIT License。
- [x] Governance & Security 结论：PASS_WITH_NOTES，无 Critical / Important 阻断。
- [x] 发布 tag 前最终脱敏复核已完成。
- [x] GitHub release 已发布：`v0.1.0`。

## v0.2.0 Release Candidate Prep

本节记录公开 `v0.2.0` 候选包准备状态；release execution 已在 Project Owner Go 后完成。

- [x] 仓库结构包含 `README.md`、`LICENSE`、`RELEASE_NOTES.md`、`PUBLISHING_CHECKLIST.md`。
- [x] skill folder 名称为 `ands-nexus`。
- [x] `ands-nexus/SKILL.md` frontmatter 只包含 `name` 与 `description`。
- [x] `ands-nexus/agents/openai.yaml` 与 skill 定位一致。
- [x] 7 个 references 齐备。
- [x] 7 个 templates 齐备。
- [x] 9 个 examples 齐备。
- [x] README 没有把 skill 描述成完整课程或生产级平台。
- [x] README 没有承诺一键部署 Gateway、Dashboard、GitHub Actions 或 Obsidian 自动化。
- [x] README 说明当前 LICENSE 为 MIT，且 v0.1 已由 Project Owner 确认。
- [x] README 说明当前公开版本是 `v0.2.0`。
- [x] Release notes 已改为 public-facing `v0.2.0 - 2026-08-13` 口径。
- [x] Obsidian writeback MVP 边界清楚：只生成草稿或写入显式 `-OutputPath`，不扫描或批量改写 Vault。
- [x] T09/T10 Enterprise review 已完成，结论为 `CONDITIONAL_GO`。
- [x] 发布材料没有真实公司、人员、仓库、域名、IP、凭据、本地绝对路径或业务敏感数据。

## v0.2.0 Public Release Execution

公开 GitHub release 执行状态：

- [x] Project Owner 明确确认可公开发布 `v0.2.0`。
- [x] 完成最终 Enterprise Gate 4 Go/No-Go 记录。
- [x] release execution 前重新运行 `quick_validate.py`、`validate_templates.ps1`、`test_writeback_mvp.ps1`。
- [x] release execution 前重新完成最终脱敏扫描，覆盖 README、release notes、publishing checklist、SKILL.md、references、templates、examples、scripts。
- [x] 确认 tag 名、release notes 版本、GitHub release 标题和仓库可见性一致。
- [x] 创建并推送 `v0.2.0` tag。
- [x] 创建 GitHub release，并记录 release URL：<https://github.com/RyanYao527/ands-nexus/releases/tag/v0.2.0>。
- [x] 完成 Gate 5 release closeout 与 Knowledge Writeback。

## v0.2.1 Patch Release Execution

公开 GitHub patch release 执行状态：

- [x] Project Owner 明确确认可执行 `v0.2.1` patch release。
- [x] 完成 `v0.2.1 release readiness check`，结论为 `READY_FOR_OWNER_GO_NO_GO`。
- [x] release execution 前重新运行 `test_validate_release.ps1`、`validate_release.ps1 -QuickValidatePath ...`、`quick_validate.py`。
- [x] release execution 前重新完成最终脱敏扫描，覆盖 README、release notes、publishing checklist、SKILL.md、references、templates、examples、scripts。
- [x] 确认 tag 名、release notes 版本、GitHub release 标题和仓库可见性一致。
- [x] 创建并推送 `v0.2.1` tag。
- [x] 创建 GitHub release，并记录 release URL：<https://github.com/RyanYao527/ands-nexus/releases/tag/v0.2.1>。
- [x] 完成 Gate 5 release closeout 与 Knowledge Writeback。

## v0.2.2 Public Release Execution

公开 GitHub release 执行状态：

- [x] Project Owner 明确确认可公开发布 `v0.2.2`，范围限定为 prompt/profile/template adapter pack。
- [x] 完成 `v0.2.2 release readiness check`，结论为 `READY_FOR_PUBLIC_V0.2.2_RELEASE_EXECUTION`。
- [x] T09 provider-profile proxy trial 已记录为 `PASS_WITH_FIXES_FOR_T10_INPUT`，且未作为 provider-native / API / benchmark 证据。
- [x] release execution 前修复 execution / validation / writeback prompt 边界。
- [x] release execution 前重新运行 `test_validate_release.ps1`、`validate_release.ps1 -QuickValidatePath ...`、`quick_validate.py`。
- [x] release validation 会阻断 unsupported overreach claims；Non-Scope: no provider-native validation, no API integration, no tenant connector readiness, no automated writeback, and no benchmark ranking。
- [x] 确认 tag 名、release notes 版本、GitHub release 标题和仓库可见性一致。
- [x] 创建并推送 `v0.2.2` tag。
- [x] 创建 GitHub release，并记录 release URL：<https://github.com/RyanYao527/ands-nexus/releases/tag/v0.2.2>。
- [x] 完成 Gate 5 release closeout 与 Knowledge Writeback。

## v0.3.0 Public Release Execution

本节记录 `v0.3.0` 公开 GitHub release 执行状态。

- [x] AD49 已授权 bounded candidate documentation prep。
- [x] AD50 文件范围限定为 `README.md`、`RELEASE_NOTES.md`、`PUBLISHING_CHECKLIST.md`。
- [x] Candidate scope 限定为 offline/proxy provider adaptation、prompt/profile/template guidance、role-routing matrix patterns 和 governance boundaries。
- [x] Candidate Non-Scope: no provider-native validation, no API integration, no credential setup, no tenant connectors, no automated writeback, no benchmark ranking。
- [x] AD50 bounded documentation edit validation 已完成。
- [x] Project Owner 已确认进入 public `v0.3.0` release execution：`确认 v0.3.0 public release Go`。
- [x] release execution 前重新运行 `test_validate_release.ps1`、`validate_release.ps1 -QuickValidatePath ...`、`quick_validate.py`。
- [x] release execution 前重新完成最终脱敏扫描，覆盖 README、release notes、publishing checklist、SKILL.md、references、templates、examples、scripts。
- [x] 确认 tag 名、release notes 版本、GitHub release 标题和仓库可见性一致。
- [x] 创建并推送 `v0.3.0` tag。
- [x] 创建 GitHub release，并记录 release URL：<https://github.com/RyanYao527/ands-nexus/releases/tag/v0.3.0>。
- [x] 完成 Gate 5 release closeout 与 Knowledge Writeback。

## v0.3.1 Patch Release Execution

本节记录 `v0.3.1` post-release adoption hardening patch 执行状态。

- [x] Project Owner 已确认执行 v0.3.1 patch release chain。
- [x] 新增 `START-HERE.md`，帮助新用户从 10 分钟 first run 开始。
- [x] 新增 `examples/INDEX.md`，按 first-run、adoption、feedback、regression、provider adaptation 分组。
- [x] 新增 `examples/post-release-feedback-intake-v0.3.1.md`，补齐 evidence level 和 boundary fields。
- [x] 新增 `examples/first-run-prompt-packet-v0.3.1.md`，覆盖 ANDS-T + Gate + Lessons。
- [x] 新增 `examples/role-routing-regression-scenarios-v0.3.1.md`，覆盖 AI PM、Execution、Validation、Governance、Writeback 分离。
- [x] `SKILL.md` 已更新 first-run、post-release feedback 和 role-routing regression route。
- [x] release validator 已更新 required public package assets。
- [x] release execution 前重新运行 `test_validate_release.ps1`、`validate_release.ps1 -QuickValidatePath ...`、`quick_validate.py`。
- [x] release execution 前重新完成最终脱敏扫描，覆盖 START-HERE、README、release notes、publishing checklist、SKILL.md、references、templates、examples、scripts。
- [x] 确认 tag 名、release notes 版本、GitHub release 标题和仓库可见性一致。
- [x] 创建并推送 `v0.3.1` tag。
- [x] 创建 GitHub release，并记录 release URL：<https://github.com/RyanYao527/ands-nexus/releases/tag/v0.3.1>。
- [x] 完成 Gate 5 release closeout 与 Knowledge Writeback。

## Validation Commands

在仓库根目录运行：

```powershell
powershell -NoProfile -ExecutionPolicy Bypass -File .\ands-nexus\scripts\validate_templates.ps1
powershell -NoProfile -ExecutionPolicy Bypass -File .\ands-nexus\scripts\test_writeback_mvp.ps1
powershell -NoProfile -ExecutionPolicy Bypass -File .\ands-nexus\scripts\test_validate_release.ps1
powershell -NoProfile -ExecutionPolicy Bypass -File .\ands-nexus\scripts\validate_release.ps1
python <path-to-skill-creator>\scripts\quick_validate.py .\ands-nexus
```

公开发布文档可以说明 `quick_validate.py` 来自 Codex skill creator；release execution 文案不应写入机器特定绝对路径。

## Desensitization Scan

release execution 前至少运行：

```powershell
rg -n "BEGIN (RSA|OPENSSH|PRIVATE)|api[_-]?key|secret|password|token|AKIA|sk-[A-Za-z0-9]" .
rg -n "([A-Za-z]:\\Users\\|/Users/|/home/|http[s]?://|\b\d{1,3}(\.\d{1,3}){3}\b)" README.md RELEASE_NOTES.md PUBLISHING_CHECKLIST.md examples ands-nexus
```

`validate_release.ps1` runs an automated version of the same local path / URL / IP scan with allowlisted public GitHub release links and explanatory checklist command text.

说明性命中可以接受，例如“不要填写 token / 凭据”的脱敏红线；真实凭据、真实仓库、真实域名/IP 或本地绝对路径必须阻断发布。

## Gate 5 Writeback

交给 09 Knowledge Writeback 时应回写：

- v0.2.0 release candidate prep 记录。
- T09/T10 Enterprise review 的 `CONDITIONAL_GO` 结论。
- v0.2.1 post-release stabilization 与 release readiness check 记录。
- v0.2.2 multi-agent/model adapter pack readiness、forward-test、release execution 和 provider-native/API/benchmark 边界。
- v0.3 Enterprise discovery 的 V03-T00 Gate plan。
- v0.3.0 release candidate prep、readiness decision、candidate validation、explicit Owner Go 和 public release execution。
- v0.3.1 post-release adoption hardening、patch readiness、release execution 和 v0.4 next-path decision。
- validation 结果与最终脱敏扫描结果。
- Project Owner 发布决策：Go。
- 公开发布结果：tag、release URL、release notes 快照和后续 Lessons。
