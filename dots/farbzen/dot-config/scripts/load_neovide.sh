#!/usr/bin/env bash
DEV_DIR="${HOME}/Projects"

projects=$(ls "${DEV_DIR}/")
selected=$(echo "${projects}" | fuzzel -d -p "Open in Neovide > ")

if [ ! "${selected}" ]; then
  echo "No project selected"
  exit 1
elif [[ "${projects}" != *"${selected}"* ]]; then
  echo "Invalid project selected"
  exit 1
fi

cd "${DEV_DIR}/${selected}" || exit 1
neovide
