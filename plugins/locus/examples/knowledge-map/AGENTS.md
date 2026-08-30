# Knowledge Map Agents

## Overview

This private map inventories destinations that agents may inspect for relevant
knowledge. It is a discovery entrypoint, not a knowledge base or a replacement
for destination-owned facts.

## Destinations

- [`dotfiles`](destinations/dotfiles.md): local configuration and agent tooling.
- [`workspace-professional`](destinations/workspace-professional.md): professional repositories.
- [`workspace-personal`](destinations/workspace-personal.md): personal and experimental repositories.
- [`obsidian-professional`](destinations/obsidian-professional.md): professional knowledge outside repositories.
- [`obsidian-personal`](destinations/obsidian-personal.md): private personal knowledge.

## Routing

- Start with the explicit task and current repository.
- Read only the smallest matching destination file when broader discovery is useful.
- Treat each selected repository, vault, or service and its nearest `AGENTS.md`
  as the owner of current facts.
- Use inventory descriptions as leads and verify them when they may have drifted.
- Do not copy active issues, pull requests, project state, or destination policy
  into this map.
