#!/usr/bin/env bash
# Write one release's changelog section to a file so it can be published as the release notes.
#
# The section is the "## v<version>" heading and everything after it, up to the next heading of the same
# level. The changelog's own preamble follows the oldest section, so it is never included: the output is
# exactly that version's notes.
#
# usage: tools/release-notes.sh <version> [output-file]
set -euo pipefail

version="${1:-}"
if [ -z "$version" ]; then
  echo "usage: $(basename "$0") <version> [output-file]" >&2
  exit 2
fi

root="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
changelog_name="CHANGELOG.md"
output="${2:-release-notes.md}"

awk -v heading="## v$version" '
  index($0, heading) == 1 { capture = 1; print; next }
  capture && /^## / { capture = 0 }
  capture { print }
' "$root/$changelog_name" > "$output"

if [ ! -s "$output" ]; then
  echo "::error::$changelog_name has no section for v$version"
  exit 1
fi

cat "$output"
