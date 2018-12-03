#!/bin/bash

if ! (command -v brew > /dev/null); then
  echo "Installing brew..."
  /user/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

echo "Install all programs..."
source "stash/brewfile.sh"

echo "Stowing config files..."
stow --restow --no-folding rg
stow --restow --no-folding cache
stow --restow --no-folding git
stow --restow --no-folding iterm2
stow --restow --no-folding kitty
stow --restow --no-folding neovim
stow --restow --no-folding ranger
stow --restow --no-folding tmux
stow --restow --no-folding vim
stow --restow --no-folding vscode
stow --restow --no-folding zsh

if ! (command -v zplugin > /dev/null); then
  echo "Installing Zplugin..."
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/zdharma/zplugin/master/doc/install.sh)"
fi

echo "Setting zsh as default shell..."
chsh -s "$(command -v zsh)"

echo "Done. :)"
