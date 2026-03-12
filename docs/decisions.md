# Decisions

Record short ADR-style decisions here.

| Date | Status | Decision | Why |
| --- | --- | --- | --- |
| 2026-03-12 | accepted | Use trunk-based flow with checkpoint commits. | Faster continuity for one-developer service work. |
| 2026-03-12 | accepted | Keep product, architecture, and task docs in the repo. | Makes each checkpoint restart-safe. |
| 2026-03-12 | accepted | Start as a docs-first workflow repository before adding stack-specific app code. | The immediate goal is repeatable delivery discipline, not framework sprawl. |
| 2026-03-12 | accepted | Use PowerShell for the first automation layer. | It matches the current Windows-first environment and keeps setup friction low. |
| 2026-03-12 | accepted | Keep the repo as a normal starter repository until CI and release flow are stable. | Template mode is useful later, but it hides quality gaps if enabled too early. |
| 2026-03-12 | accepted | Enforce repository verification on GitHub with a Windows workflow. | The starter is Windows-first today, so CI should match the local execution environment. |
| 2026-03-12 | accepted | Keep contributor guidance and issue intake inside the repository contract. | Public starter repos need the same continuity rules for external contributors as for the owner. |
