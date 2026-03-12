# Decisions

Record short ADR-style decisions here.

| Date | Status | Decision | Why |
| --- | --- | --- | --- |
| 2026-03-13 | accepted | Use Next.js App Router with TypeScript and npm for the first web starter. | It matches the current toolchain and common IT service MVP shape. |
| 2026-03-13 | accepted | Keep the starter hosting-agnostic in v1. | Deployment choices should follow the real product constraints, not precede them. |
| 2026-03-13 | accepted | Implement health checks at `/api/health`. | It is the most recognizable default path for service monitoring. |
| 2026-03-13 | accepted | Preserve the docs, checkpoint, and verification flow inside the variant. | A stack-specific starter should inherit the same continuity guarantees as the base repo. |
