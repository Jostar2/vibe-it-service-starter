# Operating Rules

## Session Start

1. Read `README.md`
2. Read `CHANGELOG.md`
3. Read `docs/tasks.md`
4. Read `docs/decisions.md` if the task touches an existing tradeoff

## Session End

Leave the repo in a state that another person or agent can continue without guessing:

- update the dashboard in `README.md`
- update `docs/tasks.md`
- add a changelog entry if the work is checkpoint-worthy
- leave one explicit next action

## Branching

- Default to `main`
- Use a short-lived branch only for risky code changes
- Merge as soon as one coherent slice is ready

## Checkpoint Rules

- One checkpoint commit should represent one meaningful milestone
- Use commit types: `init`, `docs`, `plan`, `feat`, `fix`, `refactor`, `release`, `chore`
- Update docs before committing, not after
- Prefer smaller coherent slices over large hidden work

## Tagging

- Internal checkpoints: `cp-XX-type-summary`
- External releases: `v0.x.y`
