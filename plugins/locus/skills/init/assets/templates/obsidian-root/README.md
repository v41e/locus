# <!-- Vault Name -->

<!-- One-line description. -->

## Overview

<!-- Briefly describe this vault for humans in 1-3 sentences. Keep it high-level. Add only details that materially help a human understand what this vault is for and when to use it. -->

## Structure

- [`00-inbox/`](00-inbox/): messy capture, drafts, and unprocessed material.
- [`10-projects/`](10-projects/): active efforts with a defined end state.
- [`20-areas/`](20-areas/): ongoing responsibilities and operating domains.
- [`30-resources/`](30-resources/): durable knowledge, references, and distilled notes.
- [`40-archives/`](40-archives/): inactive material worth keeping.
- [`90-system/`](90-system/): templates and current system rules.
- [`AGENTS.md`](AGENTS.md): vault operating contract.

## Policies

These are intentional Locus defaults for new or explicitly reset vaults. Preserve an established structure unless a migration is explicitly requested.

### Links & References

- **Links**: use Markdown links only in canonical docs: `[label](path/to/file.md)`.
- **Wikilinks**: do not use `[[note]]` notation in canonical docs because target resolution is ambiguous for agents.

### Naming & Placement

- **Top-level folders**: use `NN-kebab-case`.
- **Subfolders**: use `kebab-case`.
- **Files**: prefer `kebab-case.md`.
- **Composed names**: prefer nested folders over mixed separators.
- **Placement**: start unclear or messy notes in `00-inbox/`. Put already-structured notes directly in the right lane.

### PARA

- **Projects**: active efforts with a defined outcome.
- **Areas**: ongoing responsibilities without a fixed end date.
- **Resources**: reusable reference material organized by topic.
- **Archives**: inactive material kept for future reference.
- **Source**: [PARA](https://fortelabs.com/blog/para/).

### Note Shape

- **Structure**: prefer headings, bullets, and short sections over long paragraphs.
- **Scope**: keep one clear idea or responsibility per note.

### Formatting & Rich Content

- **Markdown**: prefer plain Markdown as the default note format. [Syntax](https://obsidian.md/help/syntax).
- **Emphasis**: use emphasis to highlight important terms and improve scanability.
- **Callouts**: use callouts when they materially improve clarity, not as decoration. [Callouts](https://obsidian.md/help/callouts).
- **Advanced syntax**: use Mermaid or LaTeX only when they materially help. [Advanced syntax](https://obsidian.md/help/advanced-syntax).

### Metadata

- **Properties**: keep frontmatter optional and minimal. [Properties](https://obsidian.md/help/properties).

### Tags

- **Tags**: use tags only when they add durable value. [Tags](https://obsidian.md/help/tags).
- **Structure**: do not use tags as a substitute for vault structure.
