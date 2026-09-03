# v41e Plugins

Public Agent Plugins and Codex marketplace metadata for v41e.

## Overview

This repository distributes public v41e plugins.

The marketplace currently contains:

| Plugin                           | Purpose                                                                                       |
| -------------------------------- | --------------------------------------------------------------------------------------------- |
| [Locus](plugins/locus/README.md) | Discover, initialize, track, and distill knowledge and active work across owned destinations. |

## Structure

- [`plugins/`](plugins/): installable plugin packages:
  - [`locus/`](plugins/locus/): Locus knowledge lifecycle plugin
- [`ARCHITECTURE.md`](ARCHITECTURE.md): repository relationships and distribution boundaries
- [`AGENTS.md`](AGENTS.md): repository operating contract

## Getting Started

### Installation

The Agent Plugins v1 package root is [`plugins/locus/`](plugins/locus/). Point a
compatible client at that directory using the client's installation process.

With Codex:

```sh
codex plugin marketplace add https://github.com/v41e/plugins
codex plugin add locus@v41e
```

Start a new task after installation or upgrade so the plugin skills are loaded.

## Contributing

Please read the [CONTRIBUTING](CONTRIBUTING.md) guide for workflow and
contribution expectations.

## License

This project is licensed under the terms of the [LICENSE](LICENSE).
