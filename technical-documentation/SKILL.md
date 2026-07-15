---
name: technical-documentation
description: Create or update accurate technical documentation from code and verified system behavior. Use for READMEs, architecture overviews, API/database documentation, deployment guides, operational runbooks, troubleshooting guides, migration notes, or onboarding material.
---

# Technical Documentation

## Workflow

1. Identify the audience, task, prerequisites, environment, desired depth, and document location.
2. Treat code, configuration, tests, and observed commands as primary evidence; mark unknowns instead of inventing details.
3. Lead with purpose and the shortest successful path, then explain configuration, operation, failure recovery, and limitations.
4. Use copyable commands with platform labels and placeholders that cannot be confused with real secrets.
5. For procedures, include prerequisites, expected output, verification, rollback, and escalation conditions.
6. Link to source files or authoritative references rather than duplicating volatile details.
7. Check commands, paths, names, links, version assumptions, and consistency with the current repository.

## Style

- Use direct language, descriptive headings, and short examples.
- Separate Windows PowerShell from POSIX shell instructions.
- Never publish credentials, private endpoints, or personal data.
- Update existing documentation instead of creating competing copies when possible.
