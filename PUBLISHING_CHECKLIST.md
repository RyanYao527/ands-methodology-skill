# Publishing Checklist

本清单用于 `ands-methodology` skill 的内部试用、release candidate 准备和公开发布执行检查。当前公开版本是 `v0.2.1`；GitHub release: <https://github.com/RyanYao527/ands-methodology-skill/releases/tag/v0.2.1>。

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
- [x] skill folder 名称为 `ands-methodology`。
- [x] `ands-methodology/SKILL.md` frontmatter 只包含 `name` 与 `description`。
- [x] `ands-methodology/agents/openai.yaml` 与 skill 定位一致。
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
- [x] 创建 GitHub release，并记录 release URL：<https://github.com/RyanYao527/ands-methodology-skill/releases/tag/v0.2.0>。
- [x] 完成 Gate 5 release closeout 与 Knowledge Writeback。

## v0.2.1 Patch Release Execution

公开 GitHub patch release 执行状态：

- [x] Project Owner 明确确认可执行 `v0.2.1` patch release。
- [x] 完成 `v0.2.1 release readiness check`，结论为 `READY_FOR_OWNER_GO_NO_GO`。
- [x] release execution 前重新运行 `test_validate_release.ps1`、`validate_release.ps1 -QuickValidatePath ...`、`quick_validate.py`。
- [x] release execution 前重新完成最终脱敏扫描，覆盖 README、release notes、publishing checklist、SKILL.md、references、templates、examples、scripts。
- [x] 确认 tag 名、release notes 版本、GitHub release 标题和仓库可见性一致。
- [x] 创建并推送 `v0.2.1` tag。
- [x] 创建 GitHub release，并记录 release URL：<https://github.com/RyanYao527/ands-methodology-skill/releases/tag/v0.2.1>。
- [x] 完成 Gate 5 release closeout 与 Knowledge Writeback。

## Validation Commands

在仓库根目录运行：

```powershell
powershell -NoProfile -ExecutionPolicy Bypass -File .\ands-methodology\scripts\validate_templates.ps1
powershell -NoProfile -ExecutionPolicy Bypass -File .\ands-methodology\scripts\test_writeback_mvp.ps1
powershell -NoProfile -ExecutionPolicy Bypass -File .\ands-methodology\scripts\test_validate_release.ps1
powershell -NoProfile -ExecutionPolicy Bypass -File .\ands-methodology\scripts\validate_release.ps1
python <path-to-skill-creator>\scripts\quick_validate.py .\ands-methodology
```

公开发布文档可以说明 `quick_validate.py` 来自 Codex skill creator；release execution 文案不应写入机器特定绝对路径。

## Desensitization Scan

release execution 前至少运行：

```powershell
rg -n "BEGIN (RSA|OPENSSH|PRIVATE)|api[_-]?key|secret|password|token|AKIA|sk-[A-Za-z0-9]" .
rg -n "([A-Za-z]:\\Users\\|/Users/|/home/|http[s]?://|\b\d{1,3}(\.\d{1,3}){3}\b)" README.md RELEASE_NOTES.md PUBLISHING_CHECKLIST.md examples ands-methodology
```

`validate_release.ps1` runs an automated version of the same local path / URL / IP scan with allowlisted public GitHub release links and explanatory checklist command text.

说明性命中可以接受，例如“不要填写 token / 凭据”的脱敏红线；真实凭据、真实仓库、真实域名/IP 或本地绝对路径必须阻断发布。

## Gate 5 Writeback

交给 09 Knowledge Writeback 时应回写：

- v0.2.0 release candidate prep 记录。
- T09/T10 Enterprise review 的 `CONDITIONAL_GO` 结论。
- v0.2.1 post-release stabilization 与 release readiness check 记录。
- validation 结果与最终脱敏扫描结果。
- Project Owner 发布决策：Go。
- 公开发布结果：tag、release URL、release notes 快照和后续 Lessons。
