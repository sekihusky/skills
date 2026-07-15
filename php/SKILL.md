---
name: php
description: Build, review, debug, secure, and modernize native PHP applications and shared PHP code. Use for PHP language features, request handling, sessions, forms, uploads, database access, architecture, legacy code, PHP-FPM behavior, or framework-independent backend work; use a framework-specific skill when Laravel, Symfony, or CodeIgniter owns the application lifecycle.
---

# PHP

## Workflow

1. Inspect the PHP version, extensions, SAPI, Composer files, entry points, autoloading, coding standard, tests, and deployment environment.
2. Preserve the project's architecture while separating HTTP input, validation, business rules, persistence, and rendering.
3. Enable strict types in new files when compatible and use explicit parameter, return, property, and nullable types.
4. Validate untrusted input at boundaries and encode output for its destination context.
5. Use PDO or the established database layer with parameterized queries and explicit transaction boundaries.
6. Map exceptions to safe responses; log diagnostic context without exposing secrets or stack traces to users.
7. Run syntax checks, static analysis, coding-standard checks, tests, and the relevant request flow.

## Security guardrails

- Use `password_hash()` and `password_verify()`; never implement password hashing manually.
- Regenerate session IDs after authentication and configure secure, HTTP-only, appropriate SameSite cookies.
- Require CSRF protection for state-changing browser requests.
- For uploads, enforce size, detected MIME type, generated server-side names, storage outside the executable web root, and authorization.
- Never pass untrusted input to `eval`, shell commands, dynamic includes, or unsafe deserialization.
- Keep credentials outside source control and disable detailed production error display.

For legacy modernization, make incremental, test-backed changes and state the minimum supported PHP version.
