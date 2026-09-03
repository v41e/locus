# Bug Workflow

Use for observed behavior that contradicts an existing expectation.

## Phase order

| Order | Phase                               | Purpose                                            |
| ----- | ----------------------------------- | -------------------------------------------------- |
| 1     | [Triage](../phases/triage.md)       | Confirm the defect and acceptance evidence         |
| 2     | [Implement](../phases/implement.md) | Fix the shared root cause with regression evidence |
| 3     | [Review](../phases/review.md)       | Review through the authorized delivery path        |
| 4     | [Complete](../phases/complete.md)   | Reconcile and verify the integrated result         |

## Rules

- Create a formal remote Bug record only when human intent, existing tracking,
  or repository policy requires it.
- Never create a backlog record for a Bug. Without a tracking rule, leave remote
  state unchanged and continue local diagnosis.
- Complexity does not turn a Bug into a Feature.
- Keep any design notes or execution plan inside Triage, and add them only when
  risk warrants it. Never add Feature phases or a backlog record.
