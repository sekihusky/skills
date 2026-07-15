---
name: code-review
description: Review code changes for correctness, regressions, security, data integrity, concurrency, performance, compatibility, and missing tests. Use for diffs, commits, pull requests, patches, or pre-merge review. Focus on actionable defects rather than broad style commentary.
---

# Code Review

## Workflow

1. Read repository guidance and understand the requested behavior before judging the diff.
2. Inspect the complete diff plus enough surrounding code to trace callers, state, data, and error paths.
3. Prioritize correctness, security, data loss, compatibility, races, resource cleanup, and observable regressions.
4. Check whether tests cover the changed contract, failure modes, boundaries, and regression risk.
5. Validate suspected issues with repository evidence or a focused check when practical.
6. Do not modify code unless the user also asks for implementation.

## Output

List findings from highest to lowest priority. Each finding must include:

- a concise title and severity;
- a tight file and line location;
- the conditions that trigger the defect;
- concrete impact and why the change causes it.

Avoid speculative findings, duplicates, formatting-only remarks, and demands unrelated to the change. If no actionable findings exist, say so and mention material testing gaps.
