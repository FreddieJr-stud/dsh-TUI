# Fork provenance

Our fork of the community DeepSeek Harness TUI. Keep this file updated on every upstream
sync — it is the answer to "what are we based on, and what have we changed?"

## Upstream

| Field | Value |
|---|---|
| Repository | https://github.com/ccch1mneyyy/dsh-TUI |
| License | MIT (see LICENSE) |
| Language | TypeScript |
| Package | `@deepseek-harness-tui/dsh-tui` |

## Fork

| Field | Value |
|---|---|
| Repository | https://github.com/FreddieJr-stud/dsh-TUI (public fork) |
| Local clone | `C:\Users\frpag\projects\dsh-tui` |
| Remotes | `origin` = our fork, `upstream` = ccch1mneyyy/dsh-TUI |
| Forked at | 2026-09-13 |

## Baseline

| Field | Value |
|---|---|
| Upstream commit | `f5cb232ba5dfa51f4a4869cb0f990d95a2971b79` |
| Commit date | 2026-09-12 23:00:04 +0800 |
| Commit subject | 修复长对话流式渲染卡顿与尾部空白 (#873) |
| package.json version | 0.10.1 |
| Latest upstream tag | v0.9.3 |

### Sync anchor note

Upstream does **not** tag every release: the newest tag (v0.9.3) trails the released
package version (0.10.1). Treat `upstream/main` plus the `version` field in
`package.json` as the anchor, not tags alone. Record the exact commit hash here on every
sync.

## Engine compatibility

| Field | Value |
|---|---|
| Pinned engine | `@deepseek-ai/dsh` 0.1.5-rc.1 |
| Rationale | this TUI validates against 0.1.5-rc.1; later engines (e.g. 0.1.5-rc.2) make it print a drift warning |
| Relevant upstream branch | `pr/dsh-0.1.5-rc.1-compat` |

## Our changes

Nothing yet — this file is the first commit on our side. Every sync should append a dated
entry here: upstream commit pulled, conflicts resolved, behaviour diffs verified.

<!--
Template:

## Sync 2026-09-XX

- Upstream commit: `<hash>` (`<subject>`), version `<x.y.z>`
- Conflicts: <files> — resolved by <how>
- Our patches replayed cleanly: yes/no
- Verified: `npm run compile` OK, `npm run smoke` OK, TUI boot + one Go prompt OK
-->
