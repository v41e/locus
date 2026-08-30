# GitHub Adapter

## Capability Resolution

Before writing remote state:

1. Inspect the repository, organization, and owning Project metadata available
   to the current identity.
2. Map each logical concept to an existing native type, label, field, or status
   only when an explicit rename, description, repository policy, automation, or
   one-to-one meaning establishes the equivalent.
3. Resolve every requested mutation as `logical -> existing (evidence)`. Without
   that evidence, record `logical -> unmapped`, omit the remote mutation, and
   report it. A plausible or sole candidate is not evidence when it could
   represent multiple logical states; for example, `Ready -> Queue` is invalid
   when Queue may also mean backlog.
4. Never create, rename, disable, or delete GitHub configuration.

GitHub Projects and structured metadata are optional. An Issue may exist
without either.

## State Mapping

| Logical concept                | GitHub surface when available and authorized |
| ------------------------------ | -------------------------------------------- |
| Idea worth tracking            | Project draft with the mapped backlog status |
| Accepted repository work       | Issue with a mapped native type or label     |
| Approved design and plan       | Separate Issue comments                      |
| Ready / active / review / done | Unambiguous Project status options           |
| Delivery and verification      | Pull request when the delivery path uses one |

## Issue Bodies

Feature and Task Issues use `Problem`, `Solution`, optional `Alternatives`, and
optional `Context`. Bug Issues use `Description`, `Current behavior`, `Expected
behavior`, `Reproduction`, and optional `Environment`, `Logs`, and `Possible
fix`. Omit empty optional sections.

Do not copy the Issue URL, Project URL, phase, Project fields, local Tracking
section, specification, or plan into the initial body. Publish approved
specification and plan snapshots as separate comments without local Tracking
metadata.

## Metadata

- Apply the logical work type through an existing unambiguous Type or label.
- Set available Priority and Effort equivalents once understood.
- Set an available Start Date equivalent when implementation begins.
- Set an available Target Date equivalent only for a real scheduling commitment.
- Set Milestone only for a concrete release or dated target.
- Add assignee and relationships only when ownership or dependency is real.
- Remove intake-only triage labels after acceptance; preserve orthogonal labels.

Human Issue Forms and pull-request templates belong to the repository. Follow
them when present. Otherwise use a compact pull request with a related-Issue
link, Summary, Verification, and material Notes.

Do not infer that every Bug or Task needs an Issue. When its workflow makes
tracking conditional and neither repository policy nor explicit intent resolves
the condition, leave remote state unchanged and report what must be discovered.

When a pull request targets a non-default integration branch, GitHub may not
close linked Issues. After human merge, verify Issue closure and the mapped
Project completion state explicitly.
