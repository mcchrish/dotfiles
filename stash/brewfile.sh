# tap
brew tap caskroom/cask
brew tap caskroom/fonts

# brew
brew install node
brew install rust
brew install python
brew install yarn
brew install bat
brew install diff-so-fancy --HEAD
brew install exa --HEAD
brew install fd
brew install fzf
brew install git-extras
brew install gnupg
brew install neovim --HEAD
brew install nnn --HEAD
brew install pass
brew install ripgrep
brew install stow
brew install tmux

# cask
brew cask install aerial
brew cask install alfred
brew cask install android-file-transfer
brew cask install calibre
brew cask install dash
brew cask install firefox
brew cask install font-courier-prime
brew cask install font-fira-sans
brew cask install font-iosevka
brew cask install google-chrome
brew cask install gpgtools
brew cask install iina
brew cask install iterm2
brew cask install java
brew cask install keepingyouawake
brew cask install keybase
brew cask install marked
brew cask install postman
brew cask install qtpass
brew cask install signal
brew cask install skype
brew cask install spotify
brew cask install spotify-notifications
brew cask install qbittorrent
brew cask install visual-studio-code
brew cask install vlc

# npm
export npm_config_userconfig="$XDG_CONFIG_HOME/npm/config"
export npm_config_cache="$XDG_CACHE_HOME/npm"
export npm_config_prefix="$XDG_DATA_HOME/npm"
export npm_config_init_module="$XDG_DATA_HOME/npm/config/npm-init.js"
npm install -g trash-cli npm-check

# pip
pip2 install pynvim
pip3 install pynvim
pip3 install --user neovim-remote
pip3 install --user tmuxp
pip3 install --user virtualenv
