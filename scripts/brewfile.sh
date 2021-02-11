#!/bin/sh

# tap
brew tap homebrew/cask-fonts

# brew
brew install node
brew install fd
brew install fzf
brew install gnupg
brew install neovim
brew install nnn
brew install openjdk
brew install pass
brew install rbenv
brew install ripgrep
brew install stow
brew install tmux

# cask
brew install calibre
brew install dash
brew install firefox
brew install font-iosevka-curly-slab
brew install font-iosevka-etoile
brew install font-iosevka-sparkle
brew install google-chrome
brew install insomnia
brew install iterm2
brew install marked
brew install monitorcontrol
brew install mullvadvpn
brew install pinentry-mac
brew install qtpass
brew install spotify
brew install tableplus
brew install qbittorrent
brew install vlc

# npm
export npm_config_userconfig="$XDG_CONFIG_HOME/npm/config"
export npm_config_cache="$XDG_CACHE_HOME/npm"
export npm_config_prefix="$XDG_DATA_HOME/npm"
export npm_config_init_module="$XDG_DATA_HOME/npm/config/npm-init.js"
npm install -g trash-cli
npm install -g npm-check

# gem
rbenv init
rbenv install 2.7.2
rbenv global 2.7.2
rbenv shell 2.7.2

gem install tmuxinator
gem install cocoapods

# rust
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
