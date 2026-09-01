---
name: init
description: Use when the user wants to create, refresh, align, migrate, or explicitly reset canonical README.md, AGENTS.md, or ARCHITECTURE.md knowledge documents.
---

# Init

Create, refresh, or explicitly reset canonical knowledge surfaces.

Templates are contracts for content and ownership, not replacement files. Real
project facts win. If a new target or template is needed, treat it as a plugin
change, not a runtime map lookup.

## Input

- The user's requested documents and operation.
- The selected destination, existing documents, and nearest `AGENTS.md`.

## Route

Select exactly one mode and one target. Read both selected references completely.

| Mode    | Use when                                                                        | Reference                                 |
| ------- | ------------------------------------------------------------------------------- | ----------------------------------------- |
| Create  | Every selected document is missing                                              | [create.md](references/modes/create.md)   |
| Refresh | Any selected document exists; includes non-destructive migration or alignment   | [refresh.md](references/modes/refresh.md) |
| Reset   | The user explicitly requests replacement and names the exact selected documents | [reset.md](references/modes/reset.md)     |

| Target                       | Use when                                             | Reference                                                         |
| ---------------------------- | ---------------------------------------------------- | ----------------------------------------------------------------- |
| Repository root              | The knowledge surface is repository-wide             | [repository-root.md](references/targets/repository-root.md)       |
| Repository package or plugin | The surface is local to a package or plugin boundary | [repository-package.md](references/targets/repository-package.md) |
| Obsidian root                | The knowledge surface is vault-wide                  | [obsidian-root.md](references/targets/obsidian-root.md)           |
| Obsidian lane                | The knowledge surface is local to a top-level lane   | [obsidian-lane.md](references/targets/obsidian-lane.md)           |

## Structure Contract

- `README.md` is human-facing; `AGENTS.md` is the concise semantic and
  procedural entrypoint. Give both a `Structure` section.
- Describe only the current boundary and its immediate children. Repository
  roots route to direct packages or plugins; child documents own their internals.
- Prefer small README and AGENTS pairs at meaningful child boundaries. Keep a
  single root pair when the repository has no independent child boundary.
- In `Structure`, link child boundaries by directory and link the current
  boundary's README or AGENTS counterpart directly. Never link ancestors or a
  child's counterpart from this section.
- Expand grouping directories only to direct knowledge, package, or plugin
  boundaries.
- Omit administrative files, generated output, artifacts, caches, and lockfiles.

## Workflow

1. Identify the selected documents, mode, and target.
2. Read exactly that mode reference, target reference, selected templates, and
   existing selected documents completely.
3. Use current source, manifests, configuration, commands, nearest instructions,
   and canonical docs for facts; use the selected templates for structure and
   ownership, not wording. Report conflicts between verified sources.
4. Apply the selected mode without changing unselected documents.
5. Replace every retained placeholder with a verified fact; report unresolved
   content instead of guessing.
6. Re-read related documents together and verify facts, links, commands, and
   ownership boundaries.

## Output

Return the mode, target, changed files, reconciliation summary, verification,
unresolved facts, and smallest useful follow-up.

## Rules

- Do not invent project, package, workflow, architecture, or command facts.
- Do not treat placeholders as a license to guess.
- Keep diffs minimal and focused.
- Do not decide where long-lived knowledge should live; use `locus:distill` for
  placement decisions.
