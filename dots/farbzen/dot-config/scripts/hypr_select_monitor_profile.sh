#!/usr/bin/env bash
MONITOR_ACTIVE_PROFILE_PATH="${HOME}/.config/hypr/outputs.lua"
MONITOR_PROFILE_DIR="${HOME}/.config/hypr/monitors"

profiles=$(ls "${MONITOR_PROFILE_DIR}")

if [ -z "${profiles}" ]; then exit 1; fi

profile=$(echo "${profiles}" | fuzzel -d -p "Select monitor profile > ")

if [ ! -z "${profile}" ] && [[ "${profiles}" == *"${profile}"* ]]; then
  cp -f "${MONITOR_PROFILE_DIR}/${profile}" "${MONITOR_ACTIVE_PROFILE_PATH}"
fi
