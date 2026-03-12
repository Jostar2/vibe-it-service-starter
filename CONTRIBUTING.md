# Contributing

This repository is a workflow starter, so changes should improve clarity, continuity, and checkpoint discipline before they add complexity.

## Before You Change Anything

1. Read `README.md`.
2. Read `CHANGELOG.md`.
3. Read `docs/tasks.md`.
4. Read `docs/decisions.md` if your change touches an existing tradeoff.

## Change Rules

- Work in one coherent slice at a time.
- Keep commits restart-safe and checkpoint-worthy.
- Update `README.md`, `CHANGELOG.md`, and `docs/tasks.md` before every important commit.
- Use commit types: `init`, `docs`, `plan`, `feat`, `fix`, `refactor`, `release`, `chore`.
- Prefer `main` or a short-lived branch; merge back quickly.

## Local Verification

Run these before opening a PR or cutting a release:

```powershell
powershell -ExecutionPolicy Bypass -File .\scripts\verify.ps1
git diff --check
git status --short
```

## Checkpoint Flow

- Use `powershell -ExecutionPolicy Bypass -File .\scripts\checkpoint.ps1 ...` to update the dashboard and changelog.
- Internal checkpoint tags use `cp-XX-type-summary`.
- External release tags use `v0.x.y`.

## Pull Requests

- Keep the PR scoped to one change slice.
- State the intent, affected docs, and verification results.
- Call out any deferred work or known risk directly in the PR description.

## Good First Contribution Areas

- Improve docs clarity without expanding scope.
- Tighten verification and checkpoint automation.
- Add starter variants only after the core workflow stays coherent.
