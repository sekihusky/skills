---
name: react-vite
description: Build, modify, and troubleshoot React applications powered by Vite. Use for component implementation, routing, state and data fetching, environment variables, build configuration, asset handling, code splitting, or production builds in React + Vite projects.
---

# React + Vite

## Workflow

1. Inspect `package.json`, Vite config, source layout, and existing conventions before editing.
2. Preserve the project's package manager, TypeScript policy, router, styling system, and state approach.
3. Keep components focused; move reusable behavior into hooks and framework-neutral logic into plain modules.
4. Treat `VITE_*` values as public browser configuration. Never place secrets in client environment variables.
5. Model loading, empty, error, and success states for asynchronous UI.
6. Prefer route- or feature-level lazy loading when it produces a meaningful bundle boundary.
7. Run the narrowest relevant lint, type-check, test, and build commands available in the project.

## Guardrails

- Do not replace established libraries without a concrete reason.
- Do not introduce global state for local component concerns.
- Do not silence TypeScript or lint failures to make validation pass.
- Keep browser APIs behind effects and clean up listeners, observers, and requests.

## Deliverable

Summarize behavior changed, files touched, validation run, and any unverified assumptions.
