#!/bin/bash

LOG_DIR="${HOME}/.cache/personal/logs"

LOG_FILE="${LOG_DIR}/updates.log"

# Prevent npm update from using the wrong cache directory
export NPM_CONFIG_CACHE="${HOME}/.cache/npm"

if [[ ! -d "${LOG_DIR}" ]]; then
  mkdir -p "${LOG_DIR}"
  touch "${LOG_FILE}"
fi

printf "%80s\n" |tr " " "#" | tee -a "${LOG_FILE}"
printf "%s\n" "Updating" "$(date)" | tee -a "${LOG_FILE}"

printf "%s\n" "Updating brew..." | tee -a "${LOG_FILE}"
brew update && brew upgrade 2>> "${LOG_FILE}"

printf "%s\n" "Updating npm..." | tee -a "${LOG_FILE}"
npm update -g 2>> "${LOG_FILE}"

printf "%s\n" "Updating pip..." | tee -a "${LOG_FILE}"
pip2 list --local --outdated | grep -v '^\-e' | cut -d '(' -f 1 | xargs pip2 install -U 2>> "${LOG_FILE}"
pip3 list --local --outdated | grep -v '^\-e' | cut -d '(' -f 1 | xargs pip3 install -U 2>> "${LOG_FILE}"

printf "%s\n" "Updating neovim..." | tee -a "${LOG_FILE}"
nvim +PlugUpdate +PlugUpgrade +UpdateRemotePlugins +qall

printf "%s\n" "Cleaning up" | tee -a "${LOG_FILE}"
brew cleanup 2>> "${LOG_FILE}"

# printf "%s\n" "Removing .DS_Store" | tee -a "${LOG_FILE}"
# find "${@:-$PWD}" \( \
#   -type f -name '.DS_Store' -o \
#   -type d -name '__MACOSX' \
# \) -print0 | xargs -0 rm -rf

printf "%s\n" "Updating done on " "$(date)" | tee -a "${LOG_FILE}"
printf "%80s\n" |tr " " "#" | tee -a "${LOG_FILE}"
