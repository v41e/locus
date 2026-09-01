# Repository Automation Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Add minimal pull-request validation and repository-wide GitHub Release automation for Locus.

**Architecture:** A POSIX shell checker owns repository invariants and is called locally and from GitHub Actions. Release Please operates on the repository root, keeps one version synchronized across every plugin manifest, and publishes version tags and GitHub Releases from `main` without a checked-in changelog.

**Tech Stack:** POSIX shell, `jq`, GitHub Actions, Release Please v5, Conventional Commits, Semantic Versioning

**Spec:** `docs/superpowers/specs/2026-09-01-repository-automation-design.md`

## Global Constraints

- Keep one repository-wide version shared by every plugin.
- Keep GitHub Releases as the canonical release-history surface; do not add `CHANGELOG.md`.
- Release only from `main`; do not add a `develop` prerelease channel.
- Use no package manager, dependency manifest, Projen project, GitHub App secret, personal access token, or GitLab automation.
- Reuse `actions/checkout@3d3c42e5aac5ba805825da76410c181273ba90b1` and `amannn/action-semantic-pull-request@48f256284bd46cdaab1048c3721360e808335d50` from the current TDK/Projen output.
- Pin Release Please v5.0.0 to `googleapis/release-please-action@45996ed1f6d02564a971a2fa1b5860e934307cf7`; Projen does not currently supply a corresponding action pin.
- Grant every workflow the smallest permissions required by its job.
- Preserve human ownership of release-PR merge and immutable-release repository settings.
- Do not include the separately approved README and Markdown-table formatting changes in this Feature.

---

### Task 1: Establish the Repository-Wide Version Contract

**Files:**

- Create: `version.txt`
- Create: `.release-please-manifest.json`
- Create: `release-please-config.json`
- Create: `scripts/check-repository.sh`
- Verify: `.agents/plugins/marketplace.json`
- Verify: `plugins/locus/plugin.json`
- Verify: `plugins/locus/.codex-plugin/plugin.json`
- Verify: `README.md`

**Interfaces:**

- Consumes: Marketplace entries shaped as `{name, source: {source: "local", path}}` and plugin manifests with a top-level string `version`.
- Produces: `./scripts/check-repository.sh`, a zero-argument executable returning zero only when JSON, version, catalog-path, release-config, and README-table invariants hold.

- [ ] **Step 1: Create the repository checker**

Create `scripts/check-repository.sh` with executable mode and this content:

```sh
#!/bin/sh
set -eu

repository_root=$(CDPATH= cd -- "$(dirname -- "$0")/.." && pwd)
cd "$repository_root"

for file in \
  .agents/plugins/marketplace.json \
  .release-please-manifest.json \
  release-please-config.json
do
  jq empty "$file"
done

find plugins -type f -name plugin.json -exec jq empty {} +

version=$(tr -d '\r\n' < version.txt)
if ! printf '%s\n' "$version" | grep -Eq '^(0|[1-9][0-9]*)\.(0|[1-9][0-9]*)\.(0|[1-9][0-9]*)(-[0-9A-Za-z.-]+)?$'; then
  echo "Invalid repository version: $version" >&2
  exit 1
fi

release_version=$(jq -er '."."' .release-please-manifest.json)
if [ "$release_version" != "$version" ]; then
  echo "Release Please version $release_version does not match repository version $version" >&2
  exit 1
fi

find plugins -type f -name plugin.json -print | while IFS= read -r manifest
do
  manifest_version=$(jq -er '.version' "$manifest")
  if [ "$manifest_version" != "$version" ]; then
    echo "$manifest version $manifest_version does not match repository version $version" >&2
    exit 1
  fi

  if ! jq -e --arg path "$manifest" '
    .packages["."]."extra-files"
    | any(.type == "json" and .path == $path and .jsonpath == "$.version")
  ' release-please-config.json >/dev/null
  then
    echo "$manifest is missing from Release Please extra-files" >&2
    exit 1
  fi
done

jq -e '.plugins | type == "array" and length > 0' \
  .agents/plugins/marketplace.json >/dev/null

jq -cr '.plugins[]' .agents/plugins/marketplace.json | while IFS= read -r entry
do
  name=$(printf '%s\n' "$entry" | jq -er '.name')
  source=$(printf '%s\n' "$entry" | jq -er '.source | select(.source == "local") | .path')
  relative_source=${source#./}

  if [ ! -d "$relative_source" ]; then
    echo "Marketplace plugin $name points to missing path $source" >&2
    exit 1
  fi

  if ! grep -Fq "($relative_source/README.md)" README.md; then
    echo "Marketplace plugin $name is missing from the root README table" >&2
    exit 1
  fi
done

echo "Repository checks: OK"
```

Set its mode:

```sh
chmod +x scripts/check-repository.sh
```

- [ ] **Step 2: Run the checker before its required files exist**

Run:

```sh
./scripts/check-repository.sh
```

Expected: FAIL because `.release-please-manifest.json`, `release-please-config.json`, or `version.txt` does not exist.

- [ ] **Step 3: Add deliberately mismatched initial release state**

Create `version.txt`:

```text
0.0.1
```

Create `.release-please-manifest.json`:

```json
{
  ".": "0.0.0"
}
```

Create `release-please-config.json`:

```json
{
  "$schema": "https://raw.githubusercontent.com/googleapis/release-please/v17.11.2/schemas/config.json",
  "release-type": "simple",
  "skip-changelog": true,
  "include-component-in-tag": false,
  "include-v-in-tag": true,
  "packages": {
    ".": {
      "package-name": "locus",
      "extra-files": [
        {
          "type": "json",
          "path": "plugins/locus/plugin.json",
          "jsonpath": "$.version"
        },
        {
          "type": "json",
          "path": "plugins/locus/.codex-plugin/plugin.json",
          "jsonpath": "$.version"
        }
      ]
    }
  }
}
```

- [ ] **Step 4: Verify the version mismatch is rejected**

Run:

```sh
./scripts/check-repository.sh
```

Expected: FAIL with `Release Please version 0.0.0 does not match repository version 0.0.1`.

- [ ] **Step 5: Align the initial repository version**

Change `version.txt` to:

```text
0.0.0
```

- [ ] **Step 6: Verify the repository contract passes**

Run:

```sh
./scripts/check-repository.sh
jq empty .agents/plugins/marketplace.json .release-please-manifest.json release-please-config.json plugins/locus/plugin.json plugins/locus/.codex-plugin/plugin.json
git diff --check
```

Expected: `Repository checks: OK`; the remaining commands exit zero without output.

- [ ] **Step 7: Commit the version contract**

```sh
git add version.txt .release-please-manifest.json release-please-config.json scripts/check-repository.sh
git commit -S -m "feat: establish repository-wide versioning" -m "Refs #4"
```

### Task 2: Add Pull-Request Validation

**Files:**

- Create: `.github/workflows/build.yml`
- Create: `.github/workflows/pull-request-lint.yml`
- Test: `scripts/check-repository.sh`

**Interfaces:**

- Consumes: `./scripts/check-repository.sh` from Task 1 and GitHub pull-request or merge-group base/head SHAs.
- Produces: Required-check candidates named `build / build` and `pull-request-lint / Validate PR title`.

- [ ] **Step 1: Add the build workflow**

Create `.github/workflows/build.yml`:

```yaml
name: build
on:
  pull_request: {}
  workflow_dispatch: {}
  merge_group: {}
permissions: {}
jobs:
  build:
    runs-on: ubuntu-24.04-arm
    permissions:
      contents: read
    steps:
      - name: Checkout
        uses: actions/checkout@3d3c42e5aac5ba805825da76410c181273ba90b1
        with:
          fetch-depth: 0
      - name: Check repository
        run: ./scripts/check-repository.sh
      - name: Check whitespace
        env:
          EVENT_NAME: ${{ github.event_name }}
          PULL_REQUEST_BASE_SHA: ${{ github.event.pull_request.base.sha }}
          PULL_REQUEST_HEAD_SHA: ${{ github.event.pull_request.head.sha }}
          MERGE_GROUP_BASE_SHA: ${{ github.event.merge_group.base_sha }}
          MERGE_GROUP_HEAD_SHA: ${{ github.event.merge_group.head_sha }}
        run: |-
          case "$EVENT_NAME" in
            pull_request)
              git diff --check "$PULL_REQUEST_BASE_SHA...$PULL_REQUEST_HEAD_SHA"
              ;;
            merge_group)
              git diff --check "$MERGE_GROUP_BASE_SHA...$MERGE_GROUP_HEAD_SHA"
              ;;
            workflow_dispatch)
              git show --check --format= HEAD
              ;;
          esac
```

- [ ] **Step 2: Add semantic pull-request title validation**

Create `.github/workflows/pull-request-lint.yml`:

```yaml
name: pull-request-lint
on:
  pull_request_target:
    types:
      - labeled
      - opened
      - synchronize
      - reopened
      - ready_for_review
      - edited
permissions: {}
jobs:
  validate:
    name: Validate PR title
    runs-on: ubuntu-latest
    permissions:
      pull-requests: read
    steps:
      - name: Validate PR title
        uses: amannn/action-semantic-pull-request@48f256284bd46cdaab1048c3721360e808335d50
        env:
          GITHUB_TOKEN: ${{ secrets.GITHUB_TOKEN }}
        with:
          types: |-
            feat
            fix
            chore
            docs
            style
            refactor
            perf
            test
            build
            ci
          requireScope: false
```

- [ ] **Step 3: Validate both workflows and repository checks**

Run:

```sh
go run github.com/rhysd/actionlint/cmd/actionlint@v1.7.12
./scripts/check-repository.sh
git diff --check
```

Expected: `actionlint` exits zero, `Repository checks: OK`, and no whitespace errors.

- [ ] **Step 4: Commit pull-request validation**

```sh
git add .github/workflows/build.yml .github/workflows/pull-request-lint.yml
git commit -S -m "ci: validate repository changes" -m "Refs #4"
```

### Task 3: Add Main-Branch Release Automation

**Files:**

- Create: `.github/workflows/release.yml`
- Verify: `release-please-config.json`
- Verify: `.release-please-manifest.json`

**Interfaces:**

- Consumes: Conventional Commit history on `main`, the root Release Please configuration, and the repository `GITHUB_TOKEN`.
- Produces: A human-reviewed release pull request; after merge, a new immutable-compatible `vX.Y.Z` tag and GitHub Release with generated release notes.

- [ ] **Step 1: Add the release workflow**

Create `.github/workflows/release.yml`:

```yaml
name: release
on:
  push:
    branches:
      - main
  workflow_dispatch: {}
permissions: {}
jobs:
  release:
    runs-on: ubuntu-latest
    permissions:
      contents: write
      pull-requests: write
    steps:
      - name: Release
        uses: googleapis/release-please-action@45996ed1f6d02564a971a2fa1b5860e934307cf7
        with:
          config-file: release-please-config.json
          manifest-file: .release-please-manifest.json
          target-branch: main
```

- [ ] **Step 2: Validate workflow syntax and static release invariants**

Run:

```sh
go run github.com/rhysd/actionlint/cmd/actionlint@v1.7.12
./scripts/check-repository.sh
jq empty release-please-config.json .release-please-manifest.json
git diff --check
```

Expected: all commands exit zero and the checker prints `Repository checks: OK`.

- [ ] **Step 3: Dry-run Release Please against the feature branch**

Set the token without printing it, then run the pinned Release Please CLI:

```sh
RELEASE_PLEASE_TOKEN=$(gh auth token)
export RELEASE_PLEASE_TOKEN
npx --yes release-please@17.11.2 release-pr \
  --token="$RELEASE_PLEASE_TOKEN" \
  --repo-url=v41e/locus \
  --target-branch=feature/repository-automation \
  --config-file=release-please-config.json \
  --manifest-file=.release-please-manifest.json \
  --release-as=0.1.0 \
  --dry-run
unset RELEASE_PLEASE_TOKEN
```

Expected: Release Please loads the manifest/configuration, proposes repository
version `0.1.0`, includes `version.txt` and both plugin manifests in the candidate
release changes, and performs no remote mutation.

- [ ] **Step 4: Commit release automation**

```sh
git add .github/workflows/release.yml
git commit -S -m "ci: automate GitHub releases" -m "Refs #4"
```

### Task 4: Reconcile Durable Repository Documentation

**Files:**

- Modify: `AGENTS.md`
- Modify: `ARCHITECTURE.md`
- Modify: `CONTRIBUTING.md`
- Delete: `docs/superpowers/specs/2026-09-01-repository-automation-design.md`
- Delete: `docs/superpowers/plans/2026-09-01-repository-automation.md`

**Interfaces:**

- Consumes: The verified checker and workflow behavior from Tasks 1–3.
- Produces: Canonical operator and contributor guidance with temporary design narration removed from the merge diff.

- [ ] **Step 1: Update root operating commands**

In `AGENTS.md`, replace the standalone catalog command with:

```markdown
## Commands

- Repository: `./scripts/check-repository.sh`.
```

Update `Verification` so the first item is:

```markdown
- Run `./scripts/check-repository.sh`.
```

Keep the existing catalog-path and README-alignment expectations after it.

- [ ] **Step 2: Document CI and release boundaries**

In `ARCHITECTURE.md`:

- Replace `CI/CD: none defined in this repository` with GitHub Actions validation and Release Please release ownership.
- State that every plugin shares the root repository version.
- State that GitHub Releases and `vX.Y.Z` tags are produced from `main` and that no package registry publication occurs.
- Replace the root validation sentence with `./scripts/check-repository.sh` while preserving plugin-local verification routing.

- [ ] **Step 3: Document contributor-visible version behavior**

In `CONTRIBUTING.md`, extend `Versioning` with these exact rules:

```markdown
The repository uses one version across every plugin. Squash-merged pull-request
titles drive releases: `fix` increments patch, `feat` increments minor, and a
breaking-change marker increments major. Release Please proposes the version
change, and the maintainer decides when to merge the release pull request.
GitHub Releases are the release history; the repository does not maintain a
separate changelog.
```

In `Branching Model`, change the `develop` description from `integration and
alpha releases` to `integration`. Keep the existing git-flow branch names, and
clarify that automated Release Please pull requests target `main`.

- [ ] **Step 4: Verify canonical documentation and automation together**

Run:

```sh
./scripts/check-repository.sh
go run github.com/rhysd/actionlint/cmd/actionlint@v1.7.12
git diff --check develop...HEAD
```

Expected: all commands exit zero and the checker prints `Repository checks: OK`.

- [ ] **Step 5: Remove temporary design and plan artifacts**

Delete only:

```text
docs/superpowers/specs/2026-09-01-repository-automation-design.md
docs/superpowers/plans/2026-09-01-repository-automation.md
```

The approved snapshots remain on Issue #4.

- [ ] **Step 6: Commit durable documentation**

```sh
git add AGENTS.md ARCHITECTURE.md CONTRIBUTING.md docs/superpowers
git commit -S -m "docs: document repository automation" -m "Refs #4"
```

### Task 5: Verify, Review, and Deliver

**Files:**

- Verify: all files changed from `develop...HEAD`
- Remote: Issue #4 and the pull request targeting `develop`

**Interfaces:**

- Consumes: Completed implementation commits and the approved Issue #4 contract.
- Produces: A focused, reviewed pull request with reproducible verification evidence; the human retains merge and release authority.

- [ ] **Step 1: Run the complete local verification gate**

Run:

```sh
./scripts/check-repository.sh
go run github.com/rhysd/actionlint/cmd/actionlint@v1.7.12
jq empty .agents/plugins/marketplace.json .release-please-manifest.json release-please-config.json plugins/locus/plugin.json plugins/locus/.codex-plugin/plugin.json
git diff --check develop...HEAD
git status --short --branch
```

Expected: all checks exit zero, the checker prints `Repository checks: OK`, and
the worktree contains no uncommitted changes.

- [ ] **Step 2: Run Plugin Eval and focused review**

Use `plugin-eval:evaluate-plugin` against `plugins/locus`, record its score,
failures, and warnings, then use `superpowers:requesting-code-review` for the full
`develop...HEAD` diff. Resolve every Critical or Important finding and rerun the
complete verification gate.

- [ ] **Step 3: Verify scope**

Run:

```sh
git diff --name-only develop...HEAD
git log --oneline --decorate develop..HEAD
```

Expected: only the approved checker, workflow, release-state, and durable
documentation files remain. No `CHANGELOG.md`, package-manager files, GitLab
files, README formatting, skill-table formatting, auto-approval, auto-queue,
upgrade, or prerelease workflow appears.

- [ ] **Step 4: Push the feature branch to GitHub only**

```sh
git push origin feature/repository-automation
```

Do not push or mutate the `backup` GitLab remote.

- [ ] **Step 5: Open the pull request**

Create a pull request targeting `develop` with title:

```text
feat: automate repository validation and releases
```

Use this body:

```markdown
Fixes #4

## Summary

- Validate repository JSON, catalog paths, README entries, and shared versions in pull requests.
- Enforce Conventional Commit pull-request titles using the established TDK action pin.
- Use Release Please to synchronize one repository version and publish GitHub Releases from `main` without a checked-in changelog.

## Verification

- `./scripts/check-repository.sh`
- `go run github.com/rhysd/actionlint/cmd/actionlint@v1.7.12`
- `jq empty .agents/plugins/marketplace.json .release-please-manifest.json release-please-config.json plugins/locus/plugin.json plugins/locus/.codex-plugin/plugin.json`
- Release Please 17.11.2 dry run
- Plugin Eval
- `git diff --check develop...HEAD`

## Notes

- No auto-approval, auto-queue, dependency-upgrade, prerelease, package-publication, or GitLab automation is included.
- The maintainer owns merge, immutable-release configuration, and the first production release.
- Because this PR targets `develop`, Issue #4 closure must be verified when the change reaches the default branch.
```

- [ ] **Step 6: Verify remote delivery**

Run:

```sh
gh pr view --repo v41e/locus --json number,title,state,baseRefName,headRefName,files,commits,url
gh pr checks --repo v41e/locus
```

Expected: the PR targets `develop`, contains only the approved Feature scope, and
reports the new validation checks after GitHub schedules them.
