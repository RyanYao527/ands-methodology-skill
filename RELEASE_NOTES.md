# Release Notes

## v0.1.0 - 2026-08-12

`ands-methodology` v0.1.0 将 ANDS 方法论整理为一个可安装的 Codex skill，优先支持管理落地与最小实践模板。

### 新增内容

- 新增 `ands-methodology/SKILL.md`，包含任务路由、输出层级、ANDS 原则检查和 Gate 5 回写提醒。
- 新增 `agents/openai.yaml`，用于 Codex skill 展示元信息。
- 新增 7 个 references：overview、五标准、十模型、五平台组件、采用路线、治理与度量、demo trace。
- 新增 6 个 templates：ANDS-T、ADR、Gate Checklist、Track Decision Card、Agent Matrix、Lessons。
- 新增 7 个 examples，覆盖管理落地、ANDS-T、Gate、Lessons、demo trace、脱敏说明和种子用户 prompt。
- 新增模板校验脚本 `ands-methodology/scripts/validate_templates.ps1`。
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
