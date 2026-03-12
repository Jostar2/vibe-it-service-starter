# Architecture

## System Shape

This starter is a single Next.js App Router application with TypeScript, ESLint, a landing page, and a simple `/api/health` route. Repo-level docs and PowerShell helpers stay inside the starter so a real service can inherit the same checkpoint and verification workflow from day one.

## Boundaries

- Client: Next.js-rendered web UI
- Server: Next.js route handlers
- Data store: none in v1
- External integrations: none in v1

## First Vertical Slice

The first slice proves the starter can host both product work and working code: a simple landing page renders, `/api/health` returns JSON, and the docs/checkpoint flow stays intact.

## Data Flow

1. User action: visit the home page or call `/api/health`.
2. Processing: Next.js renders the page or executes the route handler.
3. Persistence: no database writes occur in v1.
4. Response: HTML for the landing page or JSON for the health check is returned.

## Key Tradeoffs

- Hosting-agnostic starter instead of provider-specific deployment config: more portable, but less turnkey.
- No auth or database in v1: much simpler starter, but fewer "real app" features out of the box.

## Risks

- It is easy to over-customize the starter before the real product brief is written.
- Future additions such as auth or storage can bloat the baseline if they are added before the product loop is clear.
