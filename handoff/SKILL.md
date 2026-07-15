---
name: handoff
description: Prepare a concise engineering handoff so another AI assistant or developer can continue work without reconstructing the session. Use when pausing, switching machines or agents, transferring an unfinished task, or recording implementation and investigation state.
---

# Engineering Handoff

## Build the handoff from evidence

1. State the objective and current status in one or two sentences.
2. Record completed work with exact files, decisions, and verified outcomes.
3. Record remaining work in dependency order with a concrete next action.
4. Include commands run and their results; distinguish passing, failing, and not run.
5. Include relevant errors, reproduction steps, hypotheses, and discarded approaches.
6. Call out uncommitted changes, environment assumptions, external dependencies, approvals, and risks.
7. Remove secrets, transient chatter, and background information that does not help continuation.

## Output template

```markdown
Objective:
Status:
Completed:
Decisions:
Validation:
Remaining:
Risks / blockers:
Next command or action:
```

Do not claim completion without verification. Prefer paths, symbols, and commands over vague summaries.
