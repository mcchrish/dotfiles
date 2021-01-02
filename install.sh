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

echo "Installing xcode command line tools..."
xcode-select --install

if ! (command -v brew > /dev/null); then
  echo "Installing brew..."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
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

echo "Installing vim-plug..."
curl -fLo ~/Library/Application\ Support/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
# Symlink for vim
mkdir -p ~/.vim/autoload/
ln -s ~/Library/Application\ Support/nvim/site/autoload/plug.vim ~/.vim/autoload/plug.vim

echo "Done. :)"
