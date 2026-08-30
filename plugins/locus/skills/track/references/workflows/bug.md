# Bug Workflow

Use for observed behavior that contradicts an existing expectation.

## Phases

| Phase     | Reference                              | Purpose                                            |
| --------- | -------------------------------------- | -------------------------------------------------- |
| Triage    | [triage.md](../phases/triage.md)       | Confirm the defect and acceptance evidence         |
| Implement | [implement.md](../phases/implement.md) | Fix the shared root cause with regression evidence |
| Review    | [review.md](../phases/review.md)       | Review through the authorized delivery path        |
| Complete  | [complete.md](../phases/complete.md)   | Reconcile and verify the integrated result         |

## Rules

Create a direct Bug Issue only when explicit human intent, existing Project
tracking, or the nearest repository policy requires it. Never create a Project
draft for a Bug. If no tracking rule is known, leave GitHub unchanged and report
the condition without blocking local diagnosis.

Complexity does not turn a Bug into a Feature. Add a local design or plan only
when risk warrants it; do not invent Feature ideation or a Project draft.
