---
name: track
description: Use when repository work must be classified, resumed, or synchronized across local drafts, specifications, plans, GitHub Projects, Issues, pull requests, and completion state.
---

# Track

Keep work proportional and resumable without making temporary scaffolding
canonical.

## Route

1. Read the nearest instructions and contribution policy; follow explicit links
   before searching broadly.
2. Before executing tracked work, whether new or resumed, compare the newest
   explicit human intent, current repository state, and tracked artifacts. If
   they diverge materially, return to the earliest affected phase and update or
   retire stale artifacts before execution.
3. Classify the work and read exactly one workflow.

| Work    | Trigger                                      | Workflow                                      |
| ------- | -------------------------------------------- | --------------------------------------------- |
| Feature | A capability is new or materially expanded   | [feature.md](references/workflows/feature.md) |
| Bug     | Observed behavior contradicts an expectation | [bug.md](references/workflows/bug.md)         |
| Task    | Maintenance is neither a Feature nor a Bug   | [task.md](references/workflows/task.md)       |

4. The workflow owns phase order. Read its first incomplete phase. Use a named
   phase only when it belongs to that workflow and prior gates are complete.

| Phase     | Reference                                      |
| --------- | ---------------------------------------------- |
| Ideate    | [ideate.md](references/phases/ideate.md)       |
| Design    | [design.md](references/phases/design.md)       |
| Plan      | [plan.md](references/phases/plan.md)           |
| Triage    | [triage.md](references/phases/triage.md)       |
| Scope     | [scope.md](references/phases/scope.md)         |
| Implement | [implement.md](references/phases/implement.md) |
| Review    | [review.md](references/phases/review.md)       |
| Complete  | [complete.md](references/phases/complete.md)   |

5. Select a platform only when it owns work state.

| Platform | Use when                 | Reference                                   |
| -------- | ------------------------ | ------------------------------------------- |
| GitHub   | GitHub owns remote state | [github.md](references/platforms/github.md) |

6. Select an integration only when it is available and relevant.

| Integration | Use when                                  | Reference                                                |
| ----------- | ----------------------------------------- | -------------------------------------------------------- |
| Superpowers | Matching Superpowers skills are installed | [superpowers.md](references/integrations/superpowers.md) |

## Workflow

1. Apply only the current phase's approved local and remote mutations.
2. Preserve the selected checkout or worktree and follow repository Git policy.
3. Stop when human approval or unavailable authority blocks the next phase.

## Output

Report the work type, phase transition, changed artifacts, approval state,
verification, and smallest next action.
