---
name: react-best-practices
description: Review or refactor React code for correctness, component boundaries, hooks, rendering behavior, state ownership, accessibility, and maintainability. Use when evaluating React architecture, diagnosing avoidable rerenders, or improving existing React components; use react-vite for general feature implementation.
---

# React Best Practices

## Review order

1. Check correctness, stale state, effect dependencies, cleanup, and race conditions.
2. Check whether state is minimal, derived values stay derived, and ownership is close to consumers.
3. Check component responsibilities and stable data flow before considering memoization.
4. Check semantic HTML, keyboard use, focus behavior, labels, and error announcements.
5. Check rendering cost with evidence; use memoization only when identity or measured cost matters.
6. Check tests at observable behavior boundaries rather than component internals.

## Preferred patterns

- Calculate pure derived data during render.
- Use effects to synchronize with external systems, not to mirror props into state.
- Use functional state updates when the next value depends on the previous value.
- Give list items stable domain keys.
- Preserve controlled versus uncontrolled input semantics.

## Output

Lead with user-visible bugs and high-confidence risks. Cite files and tight line ranges, explain impact, then suggest the smallest viable correction.
