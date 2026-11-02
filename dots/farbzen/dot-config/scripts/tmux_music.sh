#!/usr/bin/env bash
SESSION_NAME="music"
MUSIC_CLIENT="jellyfin-tui"
TITLE="music"

terminal="${1}"

if tmux has -t "${SESSION_NAME}"; then
  if tmux ls | grep "${SESSION_NAME}" | grep -q "(attached)"; then
    tmux detach -s "${SESSION_NAME}"
  else
    "${terminal}" -T ${TITLE} -e tmux attach -t "${SESSION_NAME}"
  fi
else
  "${terminal}" -T ${TITLE} -e tmux new -s "${SESSION_NAME}" "${MUSIC_CLIENT}"
fi
