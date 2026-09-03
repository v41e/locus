# Scope

GitHub actions for the Locus Scope phase.

## Actions

- Continue an existing Task record unless repository policy or human intent says
  not to.
- Create a Task Issue only when a formal repository contract is required.
- Follow the repository Issue Form when present. Otherwise use `Problem`,
  `Solution`, optional `Alternatives`, and optional `Context`.
- Apply a mapped Issue Type or repository label. Set mapped Priority and Effort
  once understood.
- Add assignees and relationships only when ownership or dependency is real.
- Set Target Date only for a real scheduling commitment and milestone only for
  a concrete release or dated target.
- Publish any approved local design or plan as a separate comment without
  local-only tracking metadata.

## Boundaries

- Without required tracking, leave GitHub unchanged.
- Omit empty optional sections. Keep URLs, phase, Project fields, local Tracking
  metadata, design, and plan out of the initial body.
- Remove intake-only labels after acceptance; preserve orthogonal labels.
