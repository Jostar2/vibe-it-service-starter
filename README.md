# Vibe IT Service Starter

Service slug: `vibe-it-service-starter`  
Created: `2026-03-12`

## Status Dashboard

<!-- STATUS:START -->
- Current stage: docs
- Current focus: Baseline scope, architecture, and first slice are fixed
- Last checkpoint: 2026-03-12 22:44 | docs: lock scope and architecture baseline
- Next action: Add scripts/verify.ps1 for local repo validation
<!-- STATUS:END -->

## Verify Commands

Replace the placeholders below as soon as the stack is selected.

<!-- VERIFY:START -->
- lint: not configured
- typecheck: not configured
- test: not configured
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
