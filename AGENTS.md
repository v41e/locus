# Agents

## Overview

This repository is a public Agent Plugin marketplace. Keep root work focused on
repository-wide distribution and knowledge; keep plugin behavior inside its
owning directory under `plugins/`.

## Structure

- [`plugins/`](plugins/): installable plugin packages:
  - [`locus/`](plugins/locus/): Locus plugin; follow its local `AGENTS.md`
- [`ARCHITECTURE.md`](ARCHITECTURE.md): system relationships and boundaries
- [`README.md`](README.md): human-facing repository overview

## Commands

- Catalog: `jq empty .agents/plugins/marketplace.json`.
- Plugin checks belong to the owning directory under `plugins/`.

## Verification

- Validate `.agents/plugins/marketplace.json` with `jq empty`.
- Confirm catalog paths exist and the README plugin table matches the catalog.
- Follow the owning plugin's `AGENTS.md` for plugin-level verification.

## Guardrails

- Keep private information, credentials, and personal knowledge maps out of
  this public repository.
- Treat marketplace and plugin distribution changes as supply-chain changes.
- Keep implementations and plugin-specific guidance inside the owning plugin.
- Keep the marketplace catalog and root plugin table aligned.
- Preserve unrelated worktree changes.
- Do not release, publish, mutate external systems, or run destructive commands
  unless the user explicitly requests it.
