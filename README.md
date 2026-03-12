# Vibe IT Service Starter

Service slug: `vibe-it-service-starter`  
Created: `2026-03-12`

## Status Dashboard

<!-- STATUS:START -->
- Current stage: docs
- Current focus: Template promotion criteria and first variant scope are fixed
- Last checkpoint: 2026-03-12 23:06 | docs: fix template promotion gate and first variant target
- Next action: Scaffold the nextjs-web-starter variant
<!-- STATUS:END -->

## Verify Commands

<!-- VERIFY:START -->
- structure: `powershell -ExecutionPolicy Bypass -File .\scripts\verify.ps1`
- whitespace: `git diff --check`
- status: `git status --short`
<!-- VERIFY:END -->

## Resume This Project

1. Read this file.
2. Read `CHANGELOG.md`.
3. Read `docs/tasks.md`.
4. Check `docs/decisions.md` if the task depends on prior tradeoffs.
5. Pick one next slice only.

## Working Rules

- Use trunk-based flow. Work on `main` or a very short-lived branch.
- Keep checkpoint commits meaningful and restart-safe.
- Update `CHANGELOG.md` and `docs/tasks.md` before each checkpoint commit.
- Use internal tags in `cp-XX-type-summary` format.
- Use release tags in `v0.x.y` format.

## Repo Map

- `CONTRIBUTING.md`: contributor workflow and local verification contract
- `docs/brief.md`: product definition
- `docs/architecture.md`: architecture and tradeoffs
- `docs/tasks.md`: now / next / later queue
- `docs/decisions.md`: decision log
- `docs/roadmap.md`: template promotion gate and variant sequence
- `docs/variants/nextjs-web-starter.md`: first stack-specific variant contract
- `docs/release-checklist.md`: release and tagging flow
- `docs/operating-rules.md`: local working agreement
- `.github/ISSUE_TEMPLATE/`: structured issue intake
- `.github/pull_request_template.md`: PR checklist
- `.github/workflows/verify.yml`: remote verification on push and pull request
- `scripts/checkpoint.ps1`: dashboard and changelog helper
