# Obsidian Root

Use this destination when the knowledge surface is vault-wide.

## Workflow

1. Inspect the real vault root, top-level folders, and current root docs before changing anything.
2. Identify the actual top-level lanes, the current naming pattern, and whether the vault already uses a stable organizational method such as PARA.
3. Resolve the concrete vault first if multiple vaults are possible.
4. Keep `README.md` human-facing and `AGENTS.md` agent-operational.
5. Follow the shared structure contract in `SKILL.md`.
6. List only current lanes; let each lane describe its own contents.

## Defaults

- For a new or explicitly reset vault, use numbered PARA lanes and standard Markdown links.
- Preserve an established existing structure unless the user explicitly requests a migration or reset.
- Prefer standard Markdown links in canonical docs because filesystem-based agents can resolve them without an Obsidian runtime.

## Files

| Document    | Path        | Template                                                       |
| ----------- | ----------- | -------------------------------------------------------------- |
| `README.md` | `README.md` | [README.md](../../assets/templates/obsidian-root/README.md)     |
| `AGENTS.md` | `AGENTS.md` | [AGENTS.md](../../assets/templates/obsidian-root/AGENTS.md)     |

## Guidance

### README

- Keep it focused on what the vault is, the intended top-level structure, naming rules, and the small set of policies that matter.
- Prefer the goal structure over commentary about current messiness or migration leftovers.
- Use standard Markdown links when an explicit path materially helps.

### AGENTS

- Keep it short, additive, and agent-only.
- Prefer `Structure` plus `Guardrails`; avoid extra sections unless they add clear operational value.
- Do not copy README explanations; repeat only stable rules that materially change how an agent should act.
