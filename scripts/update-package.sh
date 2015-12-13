#!/bin/bash

printf "%80s\n" |tr " " "#"
printf "%s\n" "Updating" "$(date)"

printf "%s\n" "Updating brew..."
brew update && brew upgrade
brew cask update

printf "%s\n" "Updating npm..."
npm update -g

printf "%s\n" "Updating pip..."
pip list --local --outdated | grep -v '^\-e' | cut -d '(' -f 1 | xargs pip install -U
pip3 list --local --outdated | grep -v '^\-e' | cut -d '(' -f 1 | xargs pip3 install -U

printf "%s\n" "Updating neovim..."
nvim +PlugUpdate +PlugUpgrade +UpdateRemotePlugins +qall!

printf "%s\n" "Cleaning up"
brew cleanup

printf "%s\n" "Done"
printf "%80s\n" |tr " " "#"
