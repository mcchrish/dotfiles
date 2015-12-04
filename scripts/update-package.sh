#!/bin/bash

echo "###############################"
echo "Updating" `date`

echo "Updating brew..."
brew update && brew upgrade
brew cask update

echo "Updating npm..."
npm update -g

echo "Updating pip..."
# pip freeze --local | grep -v '^\-e' | cut -d = -f 1  | xargs pip install -U
pip list --local --outdated | grep -v '^\-e' | cut -d '(' -f 1 | xargs pip install -U

echo "Updating neovim..."
nvim +PlugUpdate +PlugUpgrade +UpdateRemotePlugins +qall!

echo "Cleaning up"
brew cleanup

echo "Done"
echo "###############################"
