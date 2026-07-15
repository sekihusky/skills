#!/usr/bin/env bash
set -euo pipefail

project_path="${1:-}"; [[ $# -gt 0 ]] && shift || true
ide="${1:-}"; [[ $# -gt 0 ]] && shift || true
requested=("$@")
assume_yes="false"
filtered=()
for value in "${requested[@]}"; do
  if [[ "$value" == "-y" || "$value" == "--yes" ]]; then assume_yes="true"; else filtered+=("$value"); fi
done
requested=("${filtered[@]}")

ide_keys=(antigravity codex cursor gemini-cli github-copilot claude-code kiro windsurf custom)
ide_labels=("Antigravity" "Codex" "Cursor" "Gemini CLI" "GitHub Copilot" "Claude Code" "Kiro" "Windsurf" "Custom path")
ide_paths=(.agents/skills .agents/skills .agents/skills .agents/skills .agents/skills .claude/skills .kiro/skills .windsurf/skills '')

if [[ -z "$project_path" ]]; then read -r -p "Project path: " project_path; fi
[[ -n "$project_path" && -d "$project_path" ]] || { echo "Project directory does not exist: $project_path" >&2; exit 2; }
project_root="$(cd -- "$project_path" && pwd)"

if [[ -z "$ide" ]]; then
  echo "Select AI IDE:"
  for i in "${!ide_keys[@]}"; do
    suffix=""; [[ -n "${ide_paths[$i]}" ]] && suffix=" -> ${ide_paths[$i]}"
    echo "  $((i + 1)). ${ide_labels[$i]}$suffix"
  done
  read -r -p "IDE number or name: " ide
fi
if [[ "$ide" =~ ^[0-9]+$ && "$ide" -ge 1 && "$ide" -le ${#ide_keys[@]} ]]; then ide="${ide_keys[$((ide - 1))]}"; fi

ide_index=-1
for i in "${!ide_keys[@]}"; do [[ "${ide_keys[$i]}" == "$ide" ]] && ide_index=$i && break; done
[[ $ide_index -ge 0 ]] || { echo "Unknown IDE: $ide" >&2; exit 2; }
relative_path="${ide_paths[$ide_index]}"
if [[ "$ide" == "custom" ]]; then
  read -r -p "Skills directory relative to project root: " relative_path
  [[ -n "$relative_path" && "$relative_path" != /* ]] || { echo "Custom path must be non-empty and relative." >&2; exit 2; }
  case "/$relative_path/" in */../*) echo "Custom path cannot contain '..'." >&2; exit 2 ;; esac
fi
[[ ${#selected[@]} -gt 0 ]] || { echo "Select at least one skill." >&2; exit 2; }

script_dir="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"; repo_root="$(dirname "$script_dir")"
available=()
for candidate in "$repo_root"/*; do [[ -d "$candidate" && -f "$candidate/SKILL.md" ]] && available+=("$(basename "$candidate")"); done
IFS=$'\n' available=($(printf '%s\n' "${available[@]}" | sort)); unset IFS

if [[ ${#requested[@]} -eq 0 ]]; then
  echo "Available skills:"
  for i in "${!available[@]}"; do echo "  $((i + 1)). ${available[$i]}"; done
  read -r -p "Enter all, skill names, or numbers (comma/space separated): " answer
  answer="${answer:-all}"; IFS=', ' read -r -a requested <<< "$answer"
fi

selected=()
if [[ " ${requested[*]} " == *" all "* || " ${requested[*]} " == *" * "* ]]; then
  selected=("${available[@]}")
else
  for item in "${requested[@]}"; do
    [[ -n "$item" ]] || continue
    if [[ "$item" =~ ^[0-9]+$ && "$item" -ge 1 && "$item" -le ${#available[@]} ]]; then item="${available[$((item - 1))]}"; fi
    found="false"; for name in "${available[@]}"; do [[ "$name" == "$item" ]] && found="true" && break; done
    [[ "$found" == "true" ]] || { echo "Unknown skill: $item" >&2; exit 2; }
    [[ " ${selected[*]} " == *" $item "* ]] || selected+=("$item")
  done
fi

destination_root="$project_root/$relative_path"
echo; echo "IDE:         ${ide_labels[$ide_index]}"; echo "Project:     $project_root"; echo "Destination: $destination_root"; echo "Skills:      ${selected[*]}"
if [[ "$assume_yes" != "true" ]]; then
  read -r -p "Install? [y/N] " confirm
  [[ "$confirm" =~ ^([yY]|[yY][eE][sS])$ ]] || { echo "Cancelled."; exit 0; }
fi

mkdir -p "$destination_root"
for name in "${selected[@]}"; do mkdir -p "$destination_root/$name"; cp -R "$repo_root/$name"/. "$destination_root/$name"/; echo "Installed: $name"; done
echo "Installed ${#selected[@]} skill(s) to $destination_root"
