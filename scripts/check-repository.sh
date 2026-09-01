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

jq -er '.packages["."]."extra-files"[]
  | select(.type == "json" and .jsonpath == "$.version")
  | .path' release-please-config.json | while IFS= read -r manifest
do
  if [ ! -f "$manifest" ]; then
    echo "Release Please points to missing version file $manifest" >&2
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
