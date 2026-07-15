---
name: laravel
description: Build, review, test, optimize, and troubleshoot Laravel applications, including routes, controllers, middleware, validation, Eloquent, migrations, queues, events, policies, authentication, Blade, APIs, caching, scheduling, and deployment. Use when a project contains Laravel's artisan entry point or Illuminate framework dependencies.
---

# Laravel

## Workflow

1. Inspect the Laravel/PHP versions, `composer.json`, service providers, routes, models, migrations, config, tests, queues, and deployment conventions.
2. Follow the application's existing structure; keep controllers thin and place domain behavior in focused services/actions when complexity warrants it.
3. Use Form Requests or equivalent boundary validation and Policies/Gates for resource authorization.
4. Define Eloquent relationships and loading intentionally; detect N+1 queries and constrain selected data when useful.
5. Make migrations safe for current data volume and rolling deployment; avoid relying on application models inside historical migrations.
6. Design queued jobs for retries, idempotency, timeouts, serialization boundaries, and failure visibility.
7. Use configuration files and environment values correctly; never call `env()` throughout application code.
8. Run focused tests plus relevant formatter, static-analysis, migration, queue, and route checks.

## Guardrails

- Avoid mass-assignment vulnerabilities and unsafe raw SQL.
- Do not expose debug pages, exception details, Telescope/Horizon dashboards, or storage files publicly.
- Do not cache configuration or routes as a substitute for fixing invalid configuration.
- Treat `migrate:fresh`, destructive seeders, queue clearing, and cache deletion as state-changing operations requiring a reviewed environment.

State version assumptions, database/queue effects, commands run, and deployment considerations.
