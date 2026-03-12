# Next.js Web Starter

Variant slug: `nextjs-web-starter`  
Created: `2026-03-13`

## Status Dashboard

<!-- STATUS:START -->
- Current stage: init
- Current focus: Baseline Next.js starter app, docs, and health route are in place.
- Last checkpoint: 2026-03-13 | init: scaffold nextjs web starter
- Next action: Replace `docs/brief.md` with the real product scope for the service using this starter.
<!-- STATUS:END -->

## Verify Commands

<!-- VERIFY:START -->
- repo: `powershell -ExecutionPolicy Bypass -File .\scripts\verify.ps1`
- lint: `npm run lint`
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

- `app/`: the Next.js App Router starter
- `docs/brief.md`: replace with the real product definition
- `docs/architecture.md`: starter architecture and tradeoffs
- `docs/tasks.md`: now / next / later queue
- `docs/decisions.md`: decision log
- `docs/release-checklist.md`: release and tagging flow
- `docs/operating-rules.md`: local working agreement
- `.env.example`: baseline environment variables
- `scripts/checkpoint.ps1`: dashboard and changelog helper
- `scripts/verify.ps1`: repository contract validator
