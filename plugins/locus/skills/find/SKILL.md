---
name: find
description: Use when the user needs to locate relevant owned knowledge, active work, a repository, documentation, configuration, notes, or another knowledge destination.
---

# Find

Find the smallest verified context that can answer the task. Start locally and
broaden only when the task requires context outside local files.

## Input

- The user's request and any explicit path, issue, or pull request.
- The current repository and nearest `AGENTS.md`.

## Route

Load at most one platform when the task requires context outside local files.

| Platform      | Use when                                             | Reference                                               |
| ------------- | ---------------------------------------------------- | ------------------------------------------------------- |
| GitHub        | Remote shaping, delivery, or review context is needed | [github.md](references/platforms/github.md)             |
| Knowledge map | A destination outside the current repository is needed | [knowledge-map.md](references/platforms/knowledge-map.md) |

## Workflow

1. Select an explicitly named path, issue, or pull request first.
2. For local context, read applicable `AGENTS.md` files from the repository root
   to the selected owner. At each level, follow only the matching immediate child
   and continue through nested boundaries when needed.
3. Read only the selected owner's relevant code, tests, `README.md`, or `docs/`.
4. Follow explicit issue or pull-request links from the selected local artifact,
   regardless of remote state.
5. When the task requires non-local context, load only the matching platform
   reference.
6. Stop as soon as the minimum verified owner set answers the task.

## Output

Return the best pointer, why it matches, the minimum verified context, and the
smallest useful next action. When asked about tracked work, state whether it is
active and whether resumption is warranted. When ambiguous, return a few compact
pointers.

## Rules

- Keep retrieval read-only; do not create, edit, or distill knowledge.
- Treat chat, memory, and map entries as discovery leads; verify facts against
  the selected owner.
- Use parent instructions for routing and repository-wide rules; use the
  selected child's surfaces for child-local facts.
- Do not load sibling packages or plugins unless the task crosses their boundary.
- Load neither the whole map nor unrelated history.
- If the next action changes tracked work, route it to `locus:track`; do not
  perform it during retrieval.
- If nothing matches clearly, say that instead of guessing.
