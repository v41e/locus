---
name: using
description: Use when the user or agent needs to understand Locus, choose among its installed skills, or decide the smallest safe knowledge-lifecycle action.
---

# Using Locus

Route the request to the smallest matching skill or required sequence.

## Route

| Need                          | Route           | Boundary          |
| ----------------------------- | --------------- | ----------------- |
| Explain Locus or select skill | Answer here     | No child skill    |
| Find owner or active work     | `locus:find`    | Read only         |
| Maintain canonical docs       | `locus:init`    | Verified owner    |
| Track repository work         | `locus:track`   | Lifecycle only    |
| Promote durable evidence      | `locus:distill` | Authorized writes |

## Sequences

- For orientation, answer here; invoke no child skill.
- For an action with unclear ownership or active state, use `locus:find`
  first, then route again with verified context.
- Route completed evidence to `locus:distill` directly. It writes only when
  explicitly authorized; otherwise it proposes. After `locus:track`, use it
  only for a separate durable-knowledge update.

## Output

Return the current route, reason, boundary, next handoff when present, and
smallest safe action.

## Rules

- `using` explains and routes; the selected skill owns action.
- Read the selected skill completely before acting.
- Invoke only installed skills whose conditions match.
