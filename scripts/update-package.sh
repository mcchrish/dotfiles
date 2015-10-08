#!/bin/bash

echo "###############################"
echo "Updating" `date`
brew update && brew upgrade
brew cask update
npm update -g
vim +PlugUpdate +PlugUpgrade +qall!
echo "Done"
echo "###############################"
