# Tasks

Use this file as the canonical queue. Move items between sections; do not duplicate them.

## Now

- [ ] Backport the verify workflow into the internal template repository
- [ ] Add CI to run repository verification on push

## Next

- [ ] Add contribution and issue templates
- [ ] Decide when to convert the repo into a GitHub template after CI is stable

## Later

- [ ] Add stack-specific variants for web app, API, and automation service starts
- [ ] Add release automation for version tags

## Done

- [x] Scaffolded the service workspace on `2026-03-12`
- [x] Locked the product problem, target users, and MVP
- [x] Locked the baseline architecture and first implementation slice
- [x] Added local repository verification and concrete verify commands
- [x] Added a release checklist and kept the repo in standard starter mode for now

## Risks / Blockers

- The workflow is still local-first until CI enforces verification on remote pushes.
- GitHub template mode is deferred until the release flow and CI are stable.
