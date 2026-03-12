# Vibe IT Service Starter

Service slug: `vibe-it-service-starter`  
Created: `2026-03-12`

## Status Dashboard

<!-- STATUS:START -->
- Current stage: feat
- Current focus: Local verification and checkpoint hygiene are now enforceable
- Last checkpoint: 2026-03-12 22:46 | feat: add repository verification workflow
- Next action: Add a release checklist and decide template publication mode
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

- `docs/brief.md`: product definition
- `docs/architecture.md`: architecture and tradeoffs
- `docs/tasks.md`: now / next / later queue
- `docs/decisions.md`: decision log
- `docs/operating-rules.md`: local working agreement
- `scripts/checkpoint.ps1`: dashboard and changelog helper
