---
name: php-testing
description: Create, review, debug, and improve automated tests for PHP applications using PHPUnit, Pest, framework test harnesses, fixtures, mocks, data providers, integration tests, and coverage. Use for PHP test strategy, regression tests, failing test diagnosis, test isolation, or PHPUnit/Pest configuration.
---

# PHP Testing

## Workflow

1. Inspect PHP, PHPUnit/Pest, framework, configuration, bootstrap, test suites, database strategy, CI commands, and existing conventions.
2. Reproduce the behavior first and select the narrowest test level that proves the contract.
3. Test observable inputs, outputs, state changes, errors, and boundaries rather than private implementation details.
4. Use data providers/datasets for meaningful cases without hiding intent.
5. Use real collaborators for focused integration tests; mock only slow, unstable, destructive, or external boundaries.
6. Isolate filesystem, time, randomness, network, environment, queues, and database state.
7. Make regression tests fail for the original defect before accepting the fix when practical.
8. Run the focused test repeatedly, then the relevant suite, static analysis, and coverage only where it informs risk.

## Guardrails

- Do not weaken assertions, catch unexpected exceptions, or add retries merely to make tests green.
- Do not depend on test order or shared mutable state.
- Do not call live production services or use production credentials/data.
- Avoid excessive snapshots and mocks that duplicate implementation structure.
- Keep fixtures small, explicit, and safe to recreate.

Report the behavior covered, command run, result, remaining gaps, and any environment-dependent assumptions.
