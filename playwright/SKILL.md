---
name: playwright
description: Create, debug, and stabilize Playwright browser tests for web applications. Use for end-to-end tests, browser automation, accessibility-oriented locators, authentication state, fixtures, traces, screenshots, cross-browser coverage, or flaky test diagnosis.
---

# Playwright

## Workflow

1. Inspect Playwright config, test structure, app startup, fixtures, authentication, and CI constraints.
2. Test user-observable behavior and meaningful flows; keep setup isolated and deterministic.
3. Prefer role, label, placeholder, and visible-text locators. Use test IDs only when semantic locators are unsuitable.
4. Rely on locator auto-waiting and web-first assertions; avoid arbitrary sleeps.
5. Control or seed data at stable boundaries and give parallel workers independent state.
6. Capture traces, console errors, network failures, and screenshots for failed CI tests.
7. Reproduce flakes repeatedly and diagnose the synchronization or state leak rather than adding retries first.

## Guardrails

- Never automate real destructive production actions.
- Do not commit credentials or shared authenticated state.
- Avoid brittle CSS/XPath selectors and assertions on incidental implementation details.
- Keep each test understandable without depending on execution order.

Report scenarios covered, browsers run, command used, failures, and remaining gaps.
