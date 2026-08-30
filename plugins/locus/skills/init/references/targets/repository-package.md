# Repository Package Or Plugin

Use this destination when the knowledge surface is local to a package or
plugin boundary.

## Workflow

1. Inspect local sources such as manifests, module files, build config, and obvious entrypoints.
2. Identify the package or plugin type, runtime, primary commands, local structure, side effects, and generated-vs-source boundaries.
3. Keep the local `README.md` human-facing and `AGENTS.md` agent-operational.
4. Follow the shared structure contract in `SKILL.md`.
5. Own local internals here instead of repeating them in repository-root documents.
6. Describe a generated boundary in `AGENTS.md` only when it changes how agents should edit the package or plugin.

## Files

| Document    | Path                                  | Template                                                         |
| ----------- | ------------------------------------- | ---------------------------------------------------------------- |
| `README.md` | `<package-or-plugin>/README.md`       | [README.md](../../assets/templates/repository-package/README.md) |
| `AGENTS.md` | `<package-or-plugin>/AGENTS.md`       | [AGENTS.md](../../assets/templates/repository-package/AGENTS.md) |

## Guidance

### README

- Keep it focused on what the package or plugin is, the local structure that matters, the real commands, and local context.
- Do not repeat or link ancestor documentation.
- Use nested structure entries only for children that materially improve navigation.

### AGENTS

- Keep it short, additive, and specific to the package or plugin.
- Include package-local structure, commands, verification, generated boundaries, side effects, and docs-to-read triggers when they materially change agent behavior.
- Put structural and documentation links in `Structure`; avoid a separate section for them.
- Add generated boundaries, side effects, live-system warnings, and package-local traps only when they materially help.
- If there is no meaningful package-specific guardrail, keep it extremely short and let repository-level guidance carry the rest.
