# Writeback Note Template

> 使用方式：复制本模板，或使用 `scripts/new_writeback_note.ps1` 生成一份项目内回写草稿。默认先写入项目目录；只有跨项目可复用规则或 ANDS 标准变更，才建议进入方法论母体。

## Frontmatter

```yaml
---
type: SPEC
domain: Technical
pipeline: Knowledge
status: draft
version: 0.1
created: YYYY-MM-DD
updated: YYYY-MM-DD
source: ands-nexus writeback MVP
tags:
  - ands
  - writeback
---
```

推荐 `type / domain / pipeline` 变体：

| 场景 | type | domain | pipeline |
|---|---|---|---|
| Lessons 复盘或延期/返工经验 | LSN | Lessons | Lessons |
| ADR 或人类审查后的决策 | ADR | Decision | Decision |
| Gate 4 / 发布验证记录 | WRB | Project | Release |
| 技术规则、模板或脚本说明 | SPEC | Technical | Knowledge |

默认 frontmatter 适合技术知识草稿；如果是 Lessons 回写，请优先改为 `type: LSN`、`domain: Lessons`、`pipeline: Lessons`。

## Title

`[填写标题]`

## Summary

`[用一句话说明这条知识记录的项目事实、决策或经验。]`

## Writeback Boundary

- Project facts stay in the project first.
- Cross-project reusable Gate rules, Agent collaboration patterns, knowledge organization rules, or direct ANDS-K/T/A/W/G changes may be proposed for mother methodology writeback.
- Single-project release status, tag, commit, license ADR, forward-test audit, and migration detail remain project-local by default.

## Links

- 上游：`[[填写上游任务、ADR、Gate 记录或发布记录]]`
- 下游：`[[填写下游标准更新、模板修订或后续 Issue]]`
- 相关：`[[填写关联 Lessons、规则或知识域]]`

## Review Checklist

- [ ] 不包含真实公司、人员、仓库、域名、IP、凭据、本地路径或业务敏感数据。
- [ ] 已判断项目目录内的目标 Gate / Knowledge Writeback 位置。
- [ ] 如建议回写方法论母体，已把该建议写成单独的人类审查决策。
