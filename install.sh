#!/bin/sh

# XDG
if [[ -z "$XDG_CONFIG_HOME" ]]; then
  export XDG_CONFIG_HOME="$HOME/Library/Preferences"
fi

if [[ -z "$XDG_CACHE_HOME" ]]; then
  export XDG_CACHE_HOME="$HOME/Library/Caches"
fi

if [[ -z "$XDG_DATA_HOME" ]]; then
  export XDG_DATA_HOME="$HOME/Library/Application\ Support"
fi

if [[ -z "$XDG_DATA_DIRS" ]]; then
  export XDG_DATA_DIRS="/usr/local/share:/usr/share"
fi

if [[ -z "$XDG_CONFIG_DIRS" ]]; then
  export XDG_CONFIG_DIRS="/Library/Preferences"
else
  export XDG_CONFIG_DIRS="/Library/Preferences:$XDG_CONFIG_DIRS"
fi

cd "$HOME" || exit

git clone https://github.com/mcchrish/dotfiles .dotfiles

cd .dotfiles || exit

if ! (command -v brew > /dev/null); then
  echo "Installing brew..."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

echo "Install all programs..."
source "stash/brewfile.sh"

echo "Stowing config files..."
/usr/local/bin/stow --restow --no-folding git
/usr/local/bin/stow --restow --no-folding gnupg
/usr/local/bin/stow --restow --no-folding rg
/usr/local/bin/stow --restow --no-folding system
/usr/local/bin/stow --restow --no-folding tmux
/usr/local/bin/stow --restow --no-folding vim
/usr/local/bin/stow --restow --no-folding zsh

if ! (command -v zinit > /dev/null); then
  echo "Installing zinit..."
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/zdharma/zinit/master/doc/install.sh)"
fi

echo "Installing packer..."
git clone https://github.com/wbthomason/packer.nvim\
  "$XDG_DATA_HOME"/nvim/site/pack/packer/start/packer.nvim

echo "Done. :)"
