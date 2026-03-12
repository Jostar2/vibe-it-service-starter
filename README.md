# Vibe IT Service Starter

Service slug: `vibe-it-service-starter`  
Created: `2026-03-12`

## Status Dashboard

<!-- STATUS:START -->
- Current stage: feat
- Current focus: The first runnable variant is in place and passes verification
- Last checkpoint: 2026-03-13 08:30 | feat: scaffold nextjs web starter variant
- Next action: Decide whether CI should enforce release tag rules in addition to repo verification
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
- `variants/nextjs-web-starter/`: first runnable stack-specific starter
- `.github/ISSUE_TEMPLATE/`: structured issue intake
- `.github/pull_request_template.md`: PR checklist
- `.github/workflows/verify.yml`: remote verification on push and pull request
- `scripts/checkpoint.ps1`: dashboard and changelog helper
