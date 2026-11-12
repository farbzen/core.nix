#!/usr/bin/env bash
DEV_DIR="${HOME}/Projects"
TERMINAL=${1}

check_project() {
  if [ ! "${2}" ]; then
    echo "No project selected"
    exit 1
  elif [[ "${1}" != *"${2}"* ]]; then
    echo "Invalid project selected"
    exit 1
  fi
}

open_project() {
  if [ -d "${1}/.git" ]; then
    cd "${1}" || exit 1
    ${TERMINAL} -e nvim
  else
    select_project "${1}"
  fi
}

select_project() {
  cd "${1}" || exit 1

  projects=$(ls .)
  selected=$(echo "${projects}" | fuzzel -d -p "Open in Neovim > ")

  check_project "${projects}" "${selected}"
  open_project "${selected}"
}

select_project "${DEV_DIR}"
