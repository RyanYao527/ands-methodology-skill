# Post-Release Feedback Intake v0.2.1

> 用途：记录 `ands-methodology` 公开发布后的脱敏反馈，并把反馈转成可验证的 v0.2.1 / v0.3 改进输入。不要粘贴真实反馈原文。

## Intake Record

| 字段 | 内容 |
|---|---|
| Feedback ID | `[例如 FB-v021-001]` |
| Source Type | `[seed user / GitHub issue / internal user / workshop / self-review]` |
| Reporter Role | `[填写角色，不写真实姓名]` |
| Date | `[YYYY-MM-DD]` |
| Affected Asset | `[README / SKILL.md / reference / template / example / script / release process]` |
| Feedback Type | `[confusion / missing template / wrong routing / validation gap / governance concern / docs polish]` |
| Severity | `[low / medium / high / blocker]` |
| Suggested Track | `[Quick / Standard / Enterprise]` |

## Desensitized Feedback

`[用 2-5 句概括反馈，不写真实组织、人员、仓库、域名、IP、本地路径、凭据或业务敏感数据。]`

## Impact

- 用户场景：`[说明谁在什么任务中受影响]`
- 失败表现：`[说明理解偏差、操作失败或缺少资产]`
- 影响范围：`[单个用户 / 多个种子用户 / 发布包公共入口 / 安全治理]`

## Proposed Action

| 动作 | 目标资产 | 验收方式 |
|---|---|---|
| `[新增 / 修改 / 删除 / 暂不处理]` | `[文件或资产类型]` | `[命令、prompt 或人工验收]` |

## Regression Prompt

```text
[把反馈改写成一个脱敏后的回归 prompt。]
```

## Gate Decision

- Gate 1：`[是否需要补上下文或改写任务]`
- Gate 2：`[需要哪些机器检查]`
- Gate 3：`[谁按什么 Acceptance 验收]`
- Gate 4：`[是否涉及公开发布或 Enterprise 审查]`
- Gate 5：`[是否需要 Lessons 或方法论母体候选回写]`

## Routing

- Project-local facts: keep in private project notes or an internal workspace.
- Package asset change: update the public package source repository.
- Cross-project reusable ANDS rule: propose human-reviewed writeback to mother methodology.
