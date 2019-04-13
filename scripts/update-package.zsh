#!/bin/zsh

# Prevent npm update from using the wrong cache directory
export npm_config_prefix="$HOME"/.cache/npm

printf "%80s\\n" "" | tr " " "#"
printf "%s\\n" "Updating" "$(date)"

printf "%s\\n" "Updating brew..."
brew upgrade

printf "%s\\n" "Updating npm..."
npm-check --update-all --global --ignore "npm"

printf "%s\\n" "Updating pip..."
pip3 freeze — local | grep -v '^\-e' | cut -d = -f 1 | xargs -n1 pip3 install -U

printf "%s\\n" "Updating neovim..."
nvim --headless +PlugUpdate +PlugUpgrade +qall

printf "%s\\n" "Updating zsh..."
source "$HOME/.config/zsh/.zplugin/bin/zplugin.zsh"
autoload -Uz _zplugin
zplugin update --all
zplugin self-update

printf "%s\\n" "Cleaning up"
brew cleanup

printf "%s\\n" "Updating done on " "$(date)"
printf "%80s\\n" "" | tr " " "#"
