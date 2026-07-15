---
name: fastify
description: Build, modify, review, and troubleshoot Fastify applications, plugins, routes, hooks, schemas, authentication, error handling, logging, testing, and deployment. Use when working in a Fastify backend or creating Fastify APIs; use api-design when the main task is defining the external HTTP contract.
---

# Fastify

## Workflow

1. Inspect Fastify and Node versions, module format, plugin layout, validation provider, and test conventions.
2. Encapsulate infrastructure and shared behavior as plugins; register dependencies before consumers.
3. Define request and response schemas at route boundaries and keep handlers focused on orchestration.
4. Put business rules in testable services that do not depend on request/reply objects.
5. Use centralized error mapping without leaking stack traces or internal database details.
6. Use structured logging and request correlation; never log credentials, tokens, or sensitive bodies.
7. Test with Fastify injection when network behavior itself is not under test.

## Guardrails

- Do not share mutable request-specific state across requests.
- Do not trust headers or proxy-derived IPs unless proxy configuration is explicit.
- Do not add authentication without authorization checks at the protected resource boundary.
- Close database pools, queues, and other resources in lifecycle hooks.

Validate schemas, types, tests, and startup before reporting completion.
