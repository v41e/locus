# Locus Agents

## Overview

This directory is the portable Agent Plugins v1 package root. Skills own shared
workflow behavior; client metadata only adapts package discovery.

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
- [`README.md`](README.md): human-facing plugin overview and quickstart

## Tech Stack

- **Plugin**: Agent Plugins v1 with Codex compatibility metadata.
- **Agentic runtime**: Agent Skills.

## Commands

- Metadata: `jq empty plugin.json .codex-plugin/plugin.json`.

## Verification

- For manifest changes, validate and inspect both metadata files.
- For skill changes, read the complete `SKILL.md` and every referenced file.
- For scaffold changes, compare the target reference with its matching templates
  under `skills/init/assets/templates/`.

## Guardrails

- Keep shared behavior client-independent and instruction-driven.
- Keep client-specific metadata limited to discovery and interface adaptation.
- Treat map entries as discovery leads; selected destinations and their nearest
  instructions own current facts.
- Prefer short skill entrypoints with progressively loaded references.
- Add a deterministic runtime only when instructions cannot reliably perform the
  required operation.
- Keep examples and templates generic and safe to publish.
