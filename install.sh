#!/bin/sh

# XDG
if [[ -z "$XDG_CONFIG_HOME" ]]; then
  export XDG_CONFIG_HOME="$HOME/.config"
fi

if [[ -z "$XDG_CACHE_HOME" ]]; then
  export XDG_CACHE_HOME="$HOME/.cache"
fi

if [[ -z "$XDG_DATA_HOME" ]]; then
  export XDG_DATA_HOME="$HOME/.local/share"
fi

if [[ -z "$XDG_STATE_HOME" ]]; then
  export XDG_STATE_HOME="$HOME/.local/state"
fi

if [[ -z "$XDG_DATA_DIRS" ]]; then
  export XDG_DATA_DIRS="/usr/local/share:/usr/share"
fi

if [[ -z "$XDG_CONFIG_DIRS" ]]; then
  export XDG_CONFIG_DIRS="/etc/xdg"
else
  export XDG_CONFIG_DIRS="/etc/xdg:$XDG_CONFIG_DIRS"
fi

cd "$HOME" || exit

git clone https://github.com/mcchrish/dotfiles .dotfiles

cd .dotfiles || exit

if ! (command -v brew > /dev/null); then
  echo "Installing brew..."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

echo "Install all programs..."
/usr/local/bin/brew bundle install

echo "Stowing config files..."
/usr/local/bin/stow --restow --no-folding git
/usr/local/bin/stow --restow --no-folding gnupg
/usr/local/bin/stow --restow --no-folding rg
/usr/local/bin/stow --restow --no-folding system
# /usr/local/bin/stow --restow --no-folding tmux
/usr/local/bin/stow --restow --no-folding wezterm
/usr/local/bin/stow --restow --no-folding kitty
/usr/local/bin/stow --restow --no-folding vim
/usr/local/bin/stow --restow --no-folding zsh

echo "Done. :)"
