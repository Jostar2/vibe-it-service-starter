# Architecture

## System Shape

The first version is a docs-first Git repository with lightweight PowerShell automation. Markdown files hold the project definition and current state. Local scripts handle checkpoint updates and repository verification. Git history and tags are the source of truth for milestones. GitHub is used only as the remote host for backup and sharing, not as the primary workflow engine.

## Boundaries

- Client: the developer or AI agent working inside the repository
- Server: none in v1; this is a local-first workflow package
- Data store: Markdown documents plus Git commits and tags
- External integrations: GitHub remote repository and local Git CLI

## First Vertical Slice

Prove that the starter is self-maintaining: a repository verification script checks required files, required marker blocks, and PowerShell script validity. That gives the project one concrete quality gate before more automation or stack-specific code is added.

## Data Flow

1. User action: create or update the service docs and code for one coherent slice.
2. Processing: run local verification to confirm the required repo contract still holds.
3. Persistence: run the checkpoint helper to update the status dashboard and changelog, then commit and tag the milestone.
4. Response: the repo becomes immediately resumable by a new session, another engineer, or another AI agent.

## Key Tradeoffs

- Docs-first instead of app-first: slower at the start, but much better continuity and handoff quality.
- PowerShell-first instead of cross-platform tooling: fast for the current Windows environment, but less portable until a future shell-neutral version exists.

## Risks

- The process can feel heavy if every small experiment is treated like a checkpoint.
- Variant growth can turn the repo into a framework grab bag unless each starter keeps a tight v1 boundary.
