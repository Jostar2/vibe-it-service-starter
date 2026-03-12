# Roadmap

## Template Promotion Gate

Keep this repository as a normal starter repo until all of the following are true:

- `v0.1.0` has been released on `main`
- GitHub Actions verification has passed on at least three consecutive checkpoint pushes
- the release checklist has been exercised at least once end to end
- the first stack-specific variant contract is documented and ready to scaffold

Once those conditions hold, convert the GitHub repository into a template repository.

## First Stack-Specific Variant

The first variant will be `nextjs-web-starter`.

Why this comes first:

- it matches the most common shape of an IT service MVP
- Node and npm are already available in the current environment
- it covers UI, routing, environment handling, and deployment ergonomics in one starter

## Variant Sequence

1. `nextjs-web-starter`
2. API-focused backend starter
3. automation / workflow starter

## Near-Term Exit Criteria

- keep the `nextjs-web-starter` scaffold passing its own repository verification
- cut `v0.1.0` once the base repo and first variant are both coherent
