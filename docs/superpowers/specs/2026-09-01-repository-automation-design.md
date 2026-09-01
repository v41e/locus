# Repository Automation Design

**Status:** Approved in chat on 2026-09-01
**Issue:** [#4](https://github.com/v41e/locus/issues/4)

## Problem

Locus has no automated pull-request validation or release process. Pull-request
titles are not checked, repository and plugin versions can drift, and publishing
a version tag and GitHub Release requires manual calculation and synchronization.

## Outcome

Add a small GitHub Actions foundation that validates repository invariants,
enforces Conventional Commit pull-request titles, and manages one repository-wide
version. Merging a generated release pull request publishes a version tag and
GitHub Release containing the release notes.

## Decisions

### Repository-Wide Version

The repository has one version shared by every plugin. A root `version.txt`
contains the source-tree version, `.release-please-manifest.json` records Release
Please state, and every plugin manifest mirrors that version.

Release Please operates on the repository root so relevant Conventional Commits
from any path contribute to the next repository version. A new plugin joins the
existing version; it does not start an independent release line. Its manifest
version fields must be added to the Release Please `extra-files` configuration
and the build invariant.

### Release History

GitHub Releases are the canonical version and release-history surface. Release
Please generates release notes from Conventional Commits but uses
`skip-changelog: true`, so the repository does not accumulate a `CHANGELOG.md`.
Issues and pull requests retain episodic implementation history; durable behavior
remains in code and documentation.

### Version Calculation

Release Please applies standard Semantic Versioning:

- `fix:` increments the patch version.
- `feat:` increments the minor version.
- `!` or a `BREAKING CHANGE` footer increments the major version.
- Non-releasable commit types do not independently create a release.

The first tracked version is `0.0.0`. Release Please updates `version.txt`, its
manifest, and every configured plugin manifest together in the release pull
request.

### Release Branch

The initial implementation releases only from `main`. `develop` remains the
integration branch and does not publish alpha releases.

Develop prereleases are deferred because they require separate release state and
promotion rules. In particular, a squash promotion from `develop` to `main` can
hide the Conventional Commit history needed to reproduce the stable version.
If prereleases become valuable, add `release-develop.yml`, `release-main.yml`,
separate manifests, and an explicit promotion merge contract as a later feature.

### Immutable Releases

Release Please creates the `vX.Y.Z` Git tag and corresponding GitHub Release after
the release pull request is merged. Repository-level immutable-release protection
is configured by the maintainer and is not mutated by the workflow.

## Workflows

### Build

`.github/workflows/build.yml` runs for pull requests, merge groups, and manual
dispatch with read-only repository permissions. It checks:

- Marketplace and plugin JSON syntax with `jq`.
- Equality between `version.txt` and every plugin manifest version.
- Existence of every marketplace plugin source path.
- Presence of each catalogued plugin in the root README table.
- Whitespace errors in the event's base-to-head change.

The workflow uses shell tools already available on GitHub-hosted runners. It does
not introduce a package manager, dependency manifest, generated project, or
custom validation framework.

### Pull-Request Lint

`.github/workflows/pull-request-lint.yml` follows the TDK policy and accepts these
Conventional Commit types:

`feat`, `fix`, `chore`, `docs`, `style`, `refactor`, `perf`, `test`, `build`, and
`ci`.

The third-party action is pinned to a full commit SHA. The workflow does not
check out or execute pull-request code.

### Release

`.github/workflows/release.yml` runs on pushes to `main` and manual dispatch. It
uses Release Please v5 pinned to a full commit SHA, with only `contents: write`
and `pull-requests: write` permissions.

`release-please-config.json` uses the generic `simple` release type at the
repository root, disables the checked-in changelog, omits a component prefix from
tags, and declares every plugin version field as an extra JSON file.

The workflow uses the repository `GITHUB_TOKEN`; it does not require a personal
access token, GitHub App credential, or project secret. Repository Actions policy
must allow the requested write permissions. Pull requests created by the default
token may not trigger other workflows automatically, so the maintainer reviews
the controlled version-only release diff before merging it.

## Security

- Pin every third-party action to a full commit SHA.
- Grant each workflow only the permissions it needs.
- Do not execute untrusted pull-request code in `pull_request_target`.
- Do not add long-lived credentials or GitHub App secrets.
- Keep merge and release approval human-owned.

## Verification

- Validate all JSON configuration with `jq empty`.
- Run the repository build checks locally against both matching and deliberately
  mismatched versions.
- Validate workflow syntax with a pinned `actionlint` release.
- Run Release Please in dry-run mode against the feature branch configuration.
- Run Plugin Eval because release configuration changes distributed plugin
  metadata ownership.
- Confirm the pull request contains no `CHANGELOG.md`, package-manager setup,
  GitLab automation, or unrelated documentation cleanup.

## Non-Goals

- Develop or other prerelease channels.
- A checked-in changelog.
- Automatic approval, queueing, merging, or publication to package registries.
- Dependency-upgrade or stale-item workflows.
- Projen, Node.js project scaffolding, or generated workflow ownership.
- GitLab mirroring or release automation.
- Repository-setting changes, including immutable-release configuration.
- README and Markdown-table formatting changes, which are delivered separately.
