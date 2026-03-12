# Product Brief

## Problem

AI-assisted "vibe coding" moves quickly at the start and then loses continuity. Important decisions stay in chat logs, commits are too noisy or too large, and the next session starts without a clear resume point. The result is a service repo that feels fast for one day and fragile after one week. This project solves that by providing a reusable repo framework, checkpoint pipeline, and operating rules that keep IT service work restart-safe.

## Target Users

- Primary user: solo builders or technical founders shipping an IT service with heavy AI assistance
- Secondary user: small product teams that want the same checkpoint discipline without full enterprise process

## Core Value

This starter turns vague "keep going later" intentions into an explicit operating system: fixed docs, fixed checkpoint rules, short-lived work slices, and restart-friendly commits. It replaces ad hoc notes and inconsistent Git habits with one repeatable workflow that survives long gaps and AI handoffs.

## Success Metrics

- A new service can be scaffolded and understood from the repo in under 10 minutes.
- A new session can resume from `README.md`, `CHANGELOG.md`, and `docs/tasks.md` in under 5 minutes.
- Every important milestone is captured by one checkpoint commit, one changelog entry, and one tag.

## Non-Goals

- Ship a full application framework for every web stack in v1.
- Add heavyweight review, approval, or enterprise governance workflows.

## MVP Scope

- Must have:
  - repo structure for product, architecture, tasks, and decisions
  - checkpoint helper and repo verification workflow
  - clear commit types, tag format, and resume rules
  - one public starter repo that can be reused as the baseline for future services
- Nice to have later:
  - stack-specific starters for web, API, and automation services
  - GitHub Actions or release automation
  - issue templates, release checklist, and contribution guide

## Open Questions

- Which stack-specific starter should be added first after the docs-first baseline is stable?
- Should CI stop at repository verification first, or also enforce release tag rules later?
