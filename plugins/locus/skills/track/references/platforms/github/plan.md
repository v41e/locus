# Plan

GitHub actions for the Locus Plan phase.

## Actions

- Publish the approved local plan as a separate Issue comment without local-only
  tracking metadata.
- Move the Project item to the mapped ready state.
- Refresh mapped Priority and Effort. Set Target Date only for a real scheduling
  commitment and milestone only for a concrete release or dated target.

## Boundaries

- Skip any action whose Issue, Project item, field, or mapping does not exist.
