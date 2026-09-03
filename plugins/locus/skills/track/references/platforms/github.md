# GitHub Adapter

Phase-specific GitHub synchronization for Locus Track.

## Capability resolution

Before any mutation:

1. Inspect available repository, organization, and owning Project metadata.
2. Map a logical concept only when a rename, description, policy, automation, or
   one-to-one meaning establishes the equivalent.
3. Record `logical -> existing [GitHub surface] (evidence)`. Record unmapped
   concepts, omit their mutations, and report them. A plausible or sole
   candidate is not evidence when its meaning is ambiguous.
4. Never create, rename, disable, or delete GitHub configuration.

## Surfaces

| Logical concept                | GitHub surface         |
| ------------------------------ | ---------------------- |
| Backlog record                 | Project draft          |
| Formal remote work record      | Issue                  |
| Approved specification or plan | Separate Issue comment |
| Ready, active, review, or done | Mapped Project status  |
| Delivery record                | Pull request           |

## Phase references

| Phase     | Reference                           |
| --------- | ----------------------------------- |
| Ideate    | [ideate.md](github/ideate.md)       |
| Design    | [design.md](github/design.md)       |
| Plan      | [plan.md](github/plan.md)           |
| Triage    | [triage.md](github/triage.md)       |
| Scope     | [scope.md](github/scope.md)         |
| Implement | [implement.md](github/implement.md) |
| Review    | [review.md](github/review.md)       |
| Complete  | [complete.md](github/complete.md)   |

## Rules

- The selected workflow defines phase order.
- Mutate GitHub only when repository policy, explicit human direction, or an
  existing owned record requires synchronization.
- GitHub Projects and structured metadata are optional. An Issue may exist
  without either.
- Explicit human direction not to track remotely overrides existing tracking.
- When tracking is conditional and no policy, human intent, or existing record
  requires synchronization, leave GitHub unchanged.
