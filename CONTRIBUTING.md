# Contributing

Use this guide for workflow, commands, and contribution expectations.

## Getting Help

Before opening an issue, check [SUPPORT](SUPPORT.md) for support channels and escalation paths.

## Security

If you discover a security issue, follow [SECURITY](SECURITY.md). Do not file public issues for security-sensitive problems.

## Development Workflow

### Versioning

This project follows [Semantic Versioning](https://semver.org).

### Branching Model

This project uses [git-flow-next](https://git-flow.sh):

- **`main`**: production-ready releases
- **`develop`**: integration and alpha releases
- **`feature/*`** and **`bugfix/*`**: work targeting `develop`
- **`release/*`**: release preparation from `develop`
- **`hotfix/*`**: production fixes from `main`
- **`support/*`**: maintenance for older releases

### Git Worktrees

Use [Git worktrees](https://git-scm.com/docs/git-worktree) for parallel feature work without switching the main checkout.

## Code Standards

- **Commits**: follow [Conventional Commits](https://www.conventionalcommits.org).
- **Style**: follow the formatting and lint rules defined by the repository or affected package.
- **Documentation**: update the owning `README.md`, `AGENTS.md`, or `docs/` surface when behavior, workflow, or package boundaries change.
- **Diagrams**: use [Mermaid](https://mermaid.js.org) for embedded Markdown diagrams and [D2](https://d2lang.com) for richer diagram source files.

## Pull Requests

- **Scope**: keep each PR focused; explain its intent and link relevant issues.
- **Verification**: run the affected `AGENTS.md` commands and include evidence.
- **Documentation**: update durable guidance when commands, behavior, or package
  boundaries change.
- **Target**: use `develop` for feature work and `main` for hotfixes.

## License

By contributing to this repository, you agree that your contributions will be licensed under the [LICENSE](LICENSE).

## Code of Conduct

This project is released with a [Contributor Code of Conduct](CODE_OF_CONDUCT.md). By participating in this project you agree to abide by its terms.
