# Dotfiles

Dotfiles and local config managed by a source-controlled dotfiles repository.

## Inventory

- **path**: `~/path/to/dotfiles/`.
- **purpose**: source of truth for local configuration, agent setup, machine workflow, and reusable personal tooling.

### Agents

- **path**: `home/.agents/`.
- **purpose**: runtime-independent agent prompt templates and shared agent resources.

### Codex

- **path**: `home/.codex/`.
- **purpose**: Codex config, rules, agent instructions, permissions, and local Codex operating model.

### Config

- **path**: `home/.config/`.
- **purpose**: main curated config tree for local tools and environment setup.
- **inventory**:
  - `git/`: git config, ignore rules, and templates.
  - `shell/`: shell startup files, prompt config, and completions.
  - `editor/`: editor settings.
  - `knowledge-map/`: Locus knowledge-routing profile.
