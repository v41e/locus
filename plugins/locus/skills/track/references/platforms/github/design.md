# Design

GitHub actions for the Locus Design phase.

## Actions

- After human design approval, promote the linked draft or create an Issue only
  when a repository contract is required.
- Follow the repository Issue Form when present. Otherwise use `Problem`,
  `Solution`, optional `Alternatives`, and optional `Context`.
- Apply a mapped Issue Type or repository label. Set mapped Priority and Effort
  once understood; add assignees and relationships only when real.
- Publish an approved local specification as a separate comment without
  local-only tracking metadata.

## Boundaries

- Omit empty optional sections.
- Keep Issue and Project URLs, phase, Project fields, local Tracking metadata,
  specification, and plan out of the initial body.
- Remove intake-only labels after acceptance; preserve orthogonal labels.
