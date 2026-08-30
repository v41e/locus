# Obsidian Lane

Use this destination when the knowledge surface is local to a top-level vault lane.

## Workflow

1. Inspect the real lane folder and its immediate child folders before changing anything.
2. Treat a lane as a top-level vault folder such as `00-inbox/`, `10-projects/`, or `90-system/`.
3. Keep the lane `README.md` human-facing and lane `AGENTS.md` agent-operational.
4. Follow the shared structure contract in `SKILL.md`.
5. Prefer real child folders over abstract examples.
6. Preserve an established lane unless the user explicitly requests a PARA migration or reset.

## Files

| Document    | Path                           | Template                                                       |
| ----------- | ------------------------------ | -------------------------------------------------------------- |
| `README.md` | `<lane-name>/README.md`        | [README.md](../../assets/templates/obsidian-lane/README.md)     |
| `AGENTS.md` | `<lane-name>/AGENTS.md`        | [AGENTS.md](../../assets/templates/obsidian-lane/AGENTS.md)     |

## Guidance

### README

- Use a semantic H1 such as `# Inbox` or `# Resources`, not the raw folder name.
- Add a short overview before `## Structure` so the lane intent is clear at a glance.
- Keep it focused on lane purpose, `## Structure`, and `## Boundaries`.
- Prefer real child folder names such as `captures/` or `templates/` over prose descriptions of imagined structure.

### AGENTS

- Keep it short, additive, and lane-specific.
- Prefer `Structure` plus `Guardrails`; avoid extra sections unless they add clear operational value.
- Do not copy README explanations; repeat only stable rules that materially change how an agent should act.
