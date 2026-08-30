# Knowledge Map

Use the knowledge map only to discover a destination outside the current
repository.

Resolve its entrypoint in this order:

1. explicit path from the user.
2. `KNOWLEDGE_MAP_PATH`.
3. repo-local `.knowledge-map/AGENTS.md`.
4. `~/.config/knowledge-map/AGENTS.md`.

An explicit value may name the directory or its `AGENTS.md`. Read the entrypoint
and only the smallest matching destination inventory. The map owns destination
inventory; the selected destination and its nearest instructions own facts.
Before answering a factual question, read that destination's nearest
`AGENTS.md` and only the relevant owned surface.

If no map exists, continue locally when possible. Report the missing map only
when broader discovery is required, and never invent a destination.
