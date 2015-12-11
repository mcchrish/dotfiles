#!/bin/bash

printf %"$(tput cols)"s |tr " " "#"
printf  "Updating" "$(date)"

printf  "Updating brew..."
brew update && brew upgrade
brew cask update

printf  "Updating npm..."
npm update -g

printf  "Updating pip..."
pip list --local --outdated | grep -v '^\-e' | cut -d '(' -f 1 | xargs pip install -U

printf  "Updating neovim..."
nvim +PlugUpdate +PlugUpgrade +UpdateRemotePlugins +qall!

printf  "Cleaning up"
brew cleanup
printf  "removing .DS_Store"
osx-rm-dir-metadata

printf  "Done"
printf %"$(tput cols)"s |tr " " "#"
