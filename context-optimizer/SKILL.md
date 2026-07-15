---
name: context-optimizer
description: Prepare compact, high-signal context for a coding AI before implementation, debugging, review, or session continuation. Use to map a repository, select relevant files, compress a long task history, create an agent prompt, or reduce context without losing constraints and evidence.
---

# Context Optimizer

## Workflow

1. Define the immediate decision or task the next agent must perform.
2. Preserve user intent, acceptance criteria, constraints, permissions, environment, and unresolved choices verbatim where precision matters.
3. Include only the repository map, files, symbols, schemas, errors, diffs, and command outputs needed for that decision.
4. Summarize large artifacts and provide exact paths plus search anchors for deeper inspection.
5. Separate verified facts, assumptions, hypotheses, decisions, and open questions.
6. Remove repeated conversation, abandoned ideas, generic explanations, and logs that add no diagnostic signal.
7. Finish with the most useful next action and how success should be verified.

## Compact context format

```markdown
Task and acceptance criteria:
Environment and constraints:
Relevant architecture/files:
Current state and evidence:
Decisions already made:
Open questions/risks:
Next action and verification:
```

Never omit security constraints, destructive-action limits, failed validation, or user-owned uncommitted changes merely to save tokens.
