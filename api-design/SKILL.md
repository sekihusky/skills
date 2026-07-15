---
name: api-design
description: Design or review HTTP and JSON APIs, including resources, endpoints, methods, status codes, pagination, filtering, errors, idempotency, versioning, authentication boundaries, and OpenAPI contracts. Use when defining an API contract before or alongside implementation.
---

# API Design

## Workflow

1. Identify consumers, trust boundaries, core resources, operations, and compatibility constraints.
2. Model resource-oriented URLs and use HTTP methods according to their semantics.
3. Define request, success, and error schemas before implementation.
4. Specify validation, authorization, pagination limits, filtering, sorting, and concurrency behavior.
5. Define idempotency and retry behavior for operations that clients may repeat.
6. Use consistent machine-readable errors with a stable code, safe message, and optional field details.
7. Record the contract in OpenAPI when the project uses it and add representative examples.

## Review checklist

- Distinguish authentication failure, forbidden access, missing resources, conflict, and invalid input.
- Avoid exposing sequential identifiers or existence details when that creates risk.
- Bound page sizes and expensive filters.
- Prefer additive evolution; document breaking changes and migration paths.
- Do not return secrets, internal exceptions, or database representations by accident.

State unresolved product choices explicitly rather than hiding them in implementation defaults.
