---
name: distill
description: Use when completed work, conversations, reviews, drafts, or conflicting sources may contain durable knowledge whose owner or required update is unclear.
---

# Distill

Distill the smallest verified durable signal into its narrowest owner.

## Input

- Evidence, requested action, selected destination, and nearest `AGENTS.md`.
- Relevant code, tests, docs, configuration, or linked work records.

Chat and agent memory are discovery leads. Verify their claims against the
selected owner before promoting anything.

## Route

| Owner                      | Knowledge                                                                     |
| -------------------------- | ----------------------------------------------------------------------------- |
| Code                       | Runtime behavior                                                              |
| Tests                      | Executable expectations                                                       |
| `README.md`, `docs/`       | Stable intent, architecture, constraints, usage, and durable depth            |
| `AGENTS.md`                | Concise local semantics for action: entrypoint, routing, boundaries, commands |
| Owned tool docs and config | Tool capabilities, requirements, and constraints                              |
| Skills                     | Reusable judgment-driven workflows                                            |
| Scripts                    | Explicit deterministic operations                                             |
| Hooks                      | Automatically triggered context, checks, or enforcement                       |

Drafts, remote work records, and releases are evidence or provenance, not
default destinations. Update them only when explicitly requested through their
owning workflow.

## Workflow

1. Extract each independent durable signal; reject speculation, duplication,
   and temporary narration.
2. Read its current owner and verify each claim against the surface owning that
   dimension. Return `needs-human-judgment` for unresolved contradictions.
3. Retrieve missing local or remote evidence with `locus:find`.
4. Prefer the nearest existing destination. If none exists, propose the
   narrowest new destination; create it only when explicitly requested and its
   placement is verified. Promote the signal once.
5. Preserve provenance for external, time-sensitive, or historical claims.
6. Apply an explicitly requested narrow update; propose broad, sensitive, or
   ambiguous writes first.

## Output

Return one compact record per signal: status, one action, owner and path when
applicable, one-line summary, provenance when relevant, and verification for a
write. When the user requests promotion advice without authorizing writes,
return proposals only.

| Status                 | Use when                                                      |
| ---------------------- | ------------------------------------------------------------- |
| `updated`              | An authorized update was applied to a verified existing owner |
| `created`              | An authorized destination was created at a verified placement |
| `already-known`        | The verified owner already contains the signal                |
| `update-needed`        | The signal and owner path are verified, but no write occurred |
| `wrong-place`          | The signal exists outside its verified owner                  |
| `too-weak`             | The evidence is speculative or insufficient                   |
| `needs-human-judgment` | A contradiction, owner, or exact placement cannot be verified |

## Rules

- Default to detection unless the user requested the narrow update.
- If a useful note is incomplete and the destination exposes an inbox or review
  area, return `update-needed` and name it.
- If placement cannot be verified, return `needs-human-judgment` instead of
  inventing a destination.
- Use `wrong-place`, not `update-needed`, when the verified signal currently
  exists outside its owner.
