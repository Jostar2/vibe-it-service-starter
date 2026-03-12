# Release Checklist

Use this checklist when cutting a public milestone such as `v0.1.0`.

## Before the Release Commit

- Confirm `README.md` shows the current state and one clear next action.
- Confirm `docs/tasks.md` matches reality.
- Confirm `CHANGELOG.md` includes the milestone summary.
- Run `powershell -ExecutionPolicy Bypass -File .\scripts\verify.ps1`.
- Run `git diff --check`.
- Review `git status --short` for unexpected files.

## Release Commit

- Create a release-focused commit such as `release: cut v0.1.0`.
- Keep the release commit limited to release notes, version metadata, or checklist-driven cleanup.

## Release Tag

- Use semantic version tags in `v0.x.y` format.
- Create the tag only after the release commit exists on `main`.

## Push

- Push `main`.
- Push the version tag.
- Confirm the remote history contains the release commit and both checkpoint and version tags as expected.

## After the Release

- Update `README.md` with the next planned slice.
- Move completed tasks into `Done`.
- Capture follow-up risks or deferred work in `docs/tasks.md`.
