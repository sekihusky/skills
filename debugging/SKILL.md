---
name: debugging
description: Diagnose software, service, build, test, networking, and deployment failures using systematic evidence and minimal experiments. Use for errors, crashes, flaky behavior, regressions, performance anomalies, or incidents when the root cause is unknown. Diagnose first; implement only when asked.
---

# Systematic Debugging

## Workflow

1. Define expected versus actual behavior, impact, onset, frequency, environment, and the smallest reproduction.
2. Collect primary evidence: exact errors, timestamps, versions, logs, inputs, recent changes, and system state.
3. Narrow the failing boundary by comparing working/failing cases and tracing the data or request path.
4. State a falsifiable hypothesis and run the smallest safe experiment that distinguishes it from alternatives.
5. Identify root cause, contributing conditions, and why existing safeguards did not catch it.
6. If authorized to fix, make the smallest causal change and add a regression check.
7. Re-run the reproduction and relevant adjacent tests; distinguish verified facts from remaining uncertainty.

## Guardrails

- Do not make multiple unrelated changes during diagnosis.
- Do not delete state, caches, lockfiles, or user data merely to see if the problem disappears.
- Do not blame dependencies, networking, or timing without evidence.
- Preserve useful failure artifacts until the cause is understood.

Report evidence, root cause, fix status, verification, and follow-up prevention.
