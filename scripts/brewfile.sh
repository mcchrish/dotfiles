#!/bin/sh

# tap
brew tap homebrew/cask-fonts

# brew
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
brew install volta
brew install zoxide

# cask
brew install dash
brew install firefox
brew install font-iosevka-curly-slab
brew install font-iosevka-etoile
brew install google-chrome
brew install iterm2
brew install marked
brew install pinentry-mac
brew install qtpass
brew install tableplus
brew install transmission --cask
brew install vlc

# gem
rbenv init
rbenv install 2.7.2
rbenv global 2.7.2
rbenv shell 2.7.2

gem install tmuxinator
gem install cocoapods

# rust
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
