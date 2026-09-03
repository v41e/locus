# Triage

GitHub actions for the Locus Triage phase.

## Actions

- Create or update a Bug Issue only when repository policy, human intent, or
  existing tracking requires it.
- Follow the repository Issue Form when present. Otherwise use `Description`,
  `Current behavior`, `Expected behavior`, `Reproduction`, and optional
  `Environment`, `Logs`, and `Possible fix`.
- Apply a mapped Issue Type or repository label. Set mapped Priority and Effort
  once understood.
- Add assignees and relationships only when ownership or dependency is real.
- Set Target Date only for a real scheduling commitment and milestone only for
  a concrete release or dated target.
- Publish any approved local design or plan as a separate comment without
  local-only tracking metadata.

## Boundaries

- Never create a Project draft for a Bug. Without required tracking, leave
  GitHub unchanged.
- Omit empty optional sections. Keep URLs, phase, Project fields, local Tracking
  metadata, design, and plan out of the initial body.
- Remove intake-only labels after acceptance; preserve orthogonal labels.
