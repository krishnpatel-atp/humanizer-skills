#!/usr/bin/env bash
# Sync shared references into every skill, then build one upload-ready zip per skill
# plus an all-in-one zip in dist/. Run from anywhere: bash scripts/build.sh
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/.." && pwd)"
cd "$ROOT"

# 1. Shared references go into every skill so each zip is self-contained.
for dir in skills/*/; do
  mkdir -p "$dir/references"
  cp shared/core-patterns.md shared/word-list.md "$dir/references/"
done

# 2. The main humanizer skill also carries each genre skill's rules as a reference.
declare -a MAP=(
  "humanize-spreadsheets:spreadsheets.md"
  "humanize-slides:slides.md"
  "humanize-documents:documents.md"
  "humanize-research-papers:research-papers.md"
  "humanize-emails:emails.md"
  "humanize-essays:essays.md"
  "humanize-code:coding.md"
)
for pair in "${MAP[@]}"; do
  skill="${pair%%:*}"; out="${pair##*:}"
  # strip YAML frontmatter (everything up to the second '---')
  awk 'BEGIN{n=0} /^---$/ && n<2 {n++; next} n>=2' "skills/$skill/SKILL.md" \
    > "skills/humanizer/references/$out"
done

# 3. Zips: each contains a top-level folder named after the skill with SKILL.md inside.
rm -rf dist && mkdir -p dist
for dir in skills/*/; do
  name="$(basename "$dir")"
  (cd skills && zip -qr "../dist/$name.zip" "$name" -x '*.DS_Store')
done
(cd "$ROOT/.." && zip -qr "$ROOT/dist/humanizer-skills-all.zip" "$(basename "$ROOT")" \
  -x '*/dist/*' '*.DS_Store' '*/.git/*')

echo "Built:"; ls -1 dist
