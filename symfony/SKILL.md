---
name: symfony
description: Build, review, test, optimize, and troubleshoot Symfony applications, including controllers, routing, dependency injection, configuration, Doctrine, Messenger, Validator, Serializer, Security, Console, forms, caching, and deployment. Use when a project depends on Symfony FrameworkBundle or uses Symfony application conventions.
---

# Symfony

## Workflow

1. Inspect Symfony/PHP versions, bundles, `composer.json`, configuration formats, container wiring, routes, Doctrine mappings/migrations, Messenger transports, and tests.
2. Prefer constructor injection, autowiring where clear, explicit interfaces at boundaries, and services with narrow responsibilities.
3. Keep controllers focused on HTTP translation and delegate application/domain behavior.
4. Validate input with constraints or DTOs and enforce authorization with voters or configured access controls.
5. Make Doctrine queries and association loading explicit; inspect generated SQL for performance-sensitive paths.
6. Design Messenger handlers for retries, idempotency, serialization, failure transports, and observability.
7. Treat configuration, secrets, cache warmup, assets, migrations, and worker restarts as part of deployment.
8. Run focused tests, container/config linting, static analysis, migrations checks, and the relevant console or HTTP flow.

## Guardrails

- Do not fetch services from the container in domain code.
- Do not serialize Doctrine entities directly across untrusted API or queue boundaries without an explicit contract.
- Do not weaken firewall, access-control, CSRF, or voter rules to fix authorization failures.
- Review lock and table-rewrite behavior before production migrations.
- Keep production debug disabled and secrets outside tracked configuration.

Report version assumptions, container/schema effects, validation, and deployment steps.
