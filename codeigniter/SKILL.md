---
name: codeigniter
description: Build, review, debug, test, and modernize CodeIgniter applications across CodeIgniter 3 and 4, including routing, controllers, models, validation, query building, sessions, filters/hooks, migrations, CLI tasks, and deployment. Use when a project contains CodeIgniter bootstrap files or framework dependencies; always identify the major version first.
---

# CodeIgniter

## Workflow

1. Identify CodeIgniter 3 versus 4, PHP version, directory layout, bootstrap, environment, routing, autoloading, database configuration, and tests before editing.
2. Follow the correct major-version APIs; do not mix CI3 libraries/hooks with CI4 services, namespaces, filters, or entities.
3. Keep controllers focused on request/response work and move reusable business behavior into services or domain-focused classes.
4. Use framework validation at input boundaries and query builders or bound parameters for database access.
5. Apply authentication, authorization, CSRF, session, output encoding, and upload controls consistently.
6. Use migrations for schema changes and account for existing production data and rollback behavior.
7. For legacy CI3 modernization, add tests around behavior before extracting globals, helpers, or tightly coupled models.
8. Run syntax checks, available tests, route/CLI checks, and the affected request flow.

## Guardrails

- Never expose environment files, logs, writable/session directories, or development error output through the web root.
- Do not solve permission problems with broad `0777` access.
- Do not disable CSRF or validation to make a request succeed.
- Do not assume CI4 instructions apply to CI3 or vice versa.
- Preserve URL and session compatibility during incremental upgrades.

State the detected CodeIgniter version, compatibility constraints, database effects, and validation performed.
