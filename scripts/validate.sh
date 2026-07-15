#!/usr/bin/env bash
set -euo pipefail
script_dir="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"
skills_root="$(dirname "$script_dir")"; errors=0; count=0
report() { echo "ERROR: $1" >&2; errors=$((errors + 1)); }

for skill in "$skills_root"/*; do
  [[ -d "$skill" && -f "$skill/SKILL.md" ]] || continue
  count=$((count + 1)); name="$(basename "$skill")"; file="$skill/SKILL.md"
  [[ "$name" =~ ^[a-z0-9]+(-[a-z0-9]+)*$ ]] || report "$name: invalid directory name"
  if [[ ! -f "$file" ]]; then report "$name: missing SKILL.md"; continue; fi
  mapfile -t header < <(sed -n '1,4p' "$file" | tr -d '\r')
  [[ "${header[0]:-}" == "---" ]] || report "$name: frontmatter must start with ---"
  [[ "${header[1]:-}" == "name: $name" ]] || report "$name: frontmatter name does not match directory"
  [[ "${header[2]:-}" == description:* && ${#header[2]} -ge 53 ]] || report "$name: description is missing or too short"
  [[ "${header[3]:-}" == "---" ]] || report "$name: frontmatter must contain only name and description"
  grep -Eq 'TODO|\[TODO' "$file" && report "$name: contains TODO placeholder"
  [[ -f "$skill/agents/openai.yaml" ]] || report "$name: missing agents/openai.yaml"
done
if [[ $errors -gt 0 ]]; then echo "Validation failed with $errors error(s)." >&2; exit 1; fi
echo "Validated $count skills successfully."
