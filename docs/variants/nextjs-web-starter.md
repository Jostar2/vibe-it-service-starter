# nextjs-web-starter

## Goal

Provide the first stack-specific starter for a typical web-based IT service while preserving the repo discipline established by the base workflow repository.

## Stack Choice

- Next.js
- TypeScript
- npm
- App Router
- ESLint

## Included in v1

- starter app structure for a single web service
- baseline scripts for `dev`, `build`, `start`, `lint`
- `.env.example`
- a simple landing page and a health route
- the same `README`, `CHANGELOG`, `docs`, and checkpoint workflow pattern used by the base repo
- `/api/health` route handler

## Explicitly Out of Scope in v1

- authentication
- database integration
- background jobs
- component library setup
- Tailwind or other styling framework selection beyond a minimal default

## Contract for the Scaffold

- the variant must be runnable after `npm install`
- the variant must include a visible place where service-specific product scope is filled in
- the variant must not remove the checkpoint helper or repo verification flow
- the variant must keep the docs-first operating model intact
- the variant stays hosting-agnostic in v1

## First Implementation Slice

Scaffold the variant folder, wire the baseline scripts, and prove that the generated repo still passes repository verification.

## Current Decisions

- Health checks live at `/api/health`.
- The first scaffold stays hosting-agnostic.

## Remaining Open Questions

- Should release CI eventually validate tag naming for variants as well as the root repo?
