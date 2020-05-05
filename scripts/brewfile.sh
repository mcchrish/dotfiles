#!/bin/bash

# tap
brew tap homebrew/cask-fonts

# brew
brew install node
brew install fd
brew install fzf
brew install gnupg
brew install neovim
brew install nnn
brew install pass
brew install rbenv
brew install ripgrep
brew install stow
brew install tmux

# cask
brew cask install calibre
brew cask install firefox
brew cask install font-courier-prime
brew cask install font-iosevka
brew cask install font-iosevka-slab
brew cask install google-chrome
brew cask install insomnia
brew cask install iterm2
brew cask install java
brew cask install keybase
brew cask install marked
brew cask install mullvadvpn
brew cask install pinentry-mac
brew cask install qtpass
brew cask install spotify
brew cask install qbittorrent
brew cask install vlc

# npm
export npm_config_userconfig="$XDG_CONFIG_HOME/npm/config"
export npm_config_cache="$XDG_CACHE_HOME/npm"
export npm_config_prefix="$XDG_DATA_HOME/npm"
export npm_config_init_module="$XDG_DATA_HOME/npm/config/npm-init.js"
npm install -g trash-cli
npm install -g npm-check

# gem
rbenv init
rbenv install 2.7.1
rbenv global 2.7.1
rbenv shell 2.7.1

gem install tmuxinator
gem install cocoapods

# rust
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
