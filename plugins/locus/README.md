# Locus

Portable Agent Plugins v1 package for Locus knowledge lifecycle workflows.

## Overview

The package provides five client-independent Agent Skills for finding owned
context, maintaining canonical knowledge documents, tracking repository work,
distilling verified evidence, and choosing the smallest matching workflow.

- **Type**: Agent Plugin.
- **Runtime**: compatible agent client; no bundled runtime or MCP server.

## Structure

- [`plugin.json`](plugin.json): portable Agent Plugins v1 identity metadata
- [`.codex-plugin/`](.codex-plugin/): Codex compatibility metadata:
  - [`plugin.json`](.codex-plugin/plugin.json): Codex identity and interface metadata
- [`examples/`](examples/): generic, publishable examples:
  - [`knowledge-map/`](examples/knowledge-map/AGENTS.md): private knowledge-map starting point
- [`skills/`](skills/): shared instruction-driven workflows:
  - [`find/`](skills/find/SKILL.md): owned-knowledge and active-work discovery
  - [`init/`](skills/init/SKILL.md): knowledge-document creation, refresh, and templates
  - [`track/`](skills/track/SKILL.md): proportional Feature, Bug, and Task work tracking
  - [`distill/`](skills/distill/SKILL.md): durable-knowledge ownership and promotion
  - [`using/`](skills/using/SKILL.md): capability explanation and routing
- [`AGENTS.md`](AGENTS.md): plugin operating contract

## Quickstart

1. Add this directory through a compatible client's plugin installation flow.
2. Start a new task so the client loads the skills.
3. Use `locus:using` when selection is unclear, or invoke `locus:find`,
   `locus:init`, `locus:track`, or `locus:distill` for the matching need.

## Configuration

A knowledge map is optional and remains private. Locus resolves it in this
order:

1. explicit path from the user.
2. `KNOWLEDGE_MAP_PATH`.
3. repo-local `.knowledge-map/AGENTS.md`.
4. `~/.config/knowledge-map/AGENTS.md`.

Start with the [generic example](examples/knowledge-map/AGENTS.md), but keep
personal and company facts outside this package. The
[knowledge-map platform contract](skills/find/references/platforms/knowledge-map.md)
defines how Locus reads a map without treating inventory entries as current
facts.
