#!/bin/zsh

# Prevent npm update from using the wrong cache directory
export npm_config_prefix="$HOME"/Library/Caches/npm
# Prevent homebrew from building from source
export HOMEBREW_NO_BOTTLE_SOURCE_FALLBACK=1

printf "%80s\\n" "" | tr " " "#"
printf "%s\\n" "Updating" "$(date)"

brew upgrade

printf "%s\\n" "Updating npm..."
# npm-check --update-all --global --ignore "npm"

printf "%s\\n" "Updating pip..."
# pip3 freeze — local | grep -v '^\-e' | cut -d = -f 1 | xargs -n1 pip3 install -U

printf "%s\\n" "Updating neovim..."
nvim --headless +PlugUpdate +PlugUpgrade +CocUpdateSync +qall

printf "%s\\n" "Updating zsh..."
source "$HOME/Library/Preferences/zsh/.zinit/bin/zinit.zsh"
autoload -Uz _zinit
zinit update --all
zinit self-update

printf "%s\\n" "Cleaning up"
brew cleanup

printf "%s\\n" "Updating done on " "$(date)"
printf "%80s\\n" "" | tr " " "#"
