#!/usr/bin/env bash
DEV_DIR="${HOME}/Projects"

projects=$(ls "${DEV_DIR}/")
selected=$(echo "${projects}" | fuzzel -d -p "Open in Claude Code > ")

if [ ! "${selected}" ]; then
  echo "No project selected"
  exit 1
elif [[ "${projects}" != *"${selected}"* ]]; then
  echo "Invalid project selected"
  exit 1
fi

cd "${DEV_DIR}/${selected}" || exit 1

herdr_claude_ws() {
  local dir="${1:-$PWD}"
  local name="${2:-claude-$(date +%H%M%S)}"
  [ "$#" -gt 0 ] && shift
  [ "$#" -gt 0 ] && [ "$1" != "--" ] && shift
  [ "${1:-}" = "--" ] && shift
 
  # Agent-Namen müssen [a-z][a-z0-9_-]{0,31} entsprechen
  if ! printf '%s' "$name" | grep -Eq '^[a-z][a-z0-9_-]{0,31}$'; then
    echo "Ungültiger Agent-Name: $name" >&2
    return 64
  fi
 
  local created pane
  created=$(herdr workspace create --cwd "$dir" --label "$(basename "$dir")" --focus) || {
    echo "herdr: Workspace konnte nicht erstellt werden (läuft der Server?)" >&2
    return 1
  }
  pane=$(printf '%s' "$created" | jq -r '.result.root_pane.pane_id')
 
  if herdr agent start "$name" --kind claude --pane "$pane" -- "$@" >/dev/null; then
    echo "Claude '$name' läuft in $pane"
  else
    echo "herdr: Claude konnte in $pane nicht gestartet werden" >&2
    return 2
  fi
}

herdr_claude_ws "${DEV_DIR}/${selected}"
