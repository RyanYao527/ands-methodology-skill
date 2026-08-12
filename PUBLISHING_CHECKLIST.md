# Publishing Checklist

本清单用于 `ands-methodology` skill v0.1.0 的私有/内部试用和公开发布检查。

## 当前发布结论

- 当前阶段：v0.1.0 release-ready。
- 当前建议：可执行公开 GitHub 发布。
- Governance & Security 结论：PASS_WITH_NOTES，无 Critical / Important 阻断。
- Project Owner 已确认公开发布，并确认正式采用当前 MIT License。
- 发布 tag 前最终脱敏复核已完成。

## Private / Internal Trial

私有仓库或内部试用发布前检查：

- [x] 仓库结构包含 `README.md`、`LICENSE`、`RELEASE_NOTES.md`、`PUBLISHING_CHECKLIST.md`。
- [x] skill folder 名称为 `ands-methodology`。
- [x] `ands-methodology/SKILL.md` frontmatter 只包含 `name` 与 `description`。
- [x] `ands-methodology/agents/openai.yaml` 与 skill 定位一致。
- [x] 7 个 references 齐备。
- [x] 6 个 templates 齐备。
- [x] 7 个 examples 齐备。
- [x] `quick_validate.py` 运行通过。
- [x] `validate_templates.ps1` 运行通过。
- [x] 5 条验收 prompt 材料回归 PASS。
- [x] Governance & Security 审查结论为 PASS_WITH_NOTES 或 PASS。
- [x] README 没有把 skill 描述成完整课程或生产级平台。
- [x] README 没有承诺一键部署 Gateway、Dashboard、GitHub Actions 或 Obsidian 自动化。
- [x] README 说明当前 LICENSE 已由 Project Owner 确认为 MIT。
- [x] 发布材料没有真实公司、人员、仓库、域名、IP、凭据或业务敏感数据。

## Public Release

公开 GitHub 发布前，在 Private / Internal Trial 清单之外，还必须满足：

- [x] Project Owner 最终确认 License，可公开采用当前 MIT 文本。
- [x] 完成 Enterprise Track 发布审批。
- [x] 完成最终脱敏审查，覆盖 README、release notes、publishing checklist、SKILL.md、references、templates、examples。
- [x] 示例中的 demo 内容只保留可教学结构，不暴露真实组织、人员、仓库、网络地址、凭据或业务数据。
- [x] README 安装说明不包含本地绝对路径或内部组织路径。
- [x] 发布 tag 与 release notes 版本一致。
- [x] 若需要发布到公开仓库，仓库可见性由 Project Owner 明确确认。
- [x] Gate 5 回写审计已安排给 09 Knowledge Writeback。

## Validation Commands

在仓库根目录运行：

```text
quick_validate.py ands-methodology-skill/ands-methodology
powershell -ExecutionPolicy Bypass -File ands-methodology-skill/ands-methodology/scripts/validate_templates.ps1
```

`quick_validate.py` 使用 Codex skill creator 提供的校验脚本；公开发布文档不写入机器特定的绝对路径。

## Gate 5 Writeback

交给 09 Knowledge Writeback 时应回写：

- v0.1.0 的发布文档快照。
- Governance & Security 的 PASS_WITH_NOTES 结论。
- validation 结果。
- License 最终确认状态：MIT 已确认。
- 公开发布确认状态：已确认。
- 公开发布完成后的 tag 与 release URL。
