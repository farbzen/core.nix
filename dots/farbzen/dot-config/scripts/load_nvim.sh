#!/usr/bin/env bash
DEV_DIR="${HOME}/Projects"

terminal=${1}

projects=$(ls "${DEV_DIR}/")
selected=$(echo "${projects}" | fuzzel -d -p "Open in Neovim > ")

if [ ! "${selected}" ]; then
  echo "No project selected"
  exit 1
elif [[ "${projects}" != *"${selected}"* ]]; then
  echo "Invalid project selected"
  exit 1
fi

cd "${DEV_DIR}/${selected}" || exit 1
${terminal} -e nvim
