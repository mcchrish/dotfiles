#!/bin/bash

echo "###############################"
echo "Updating" + `date`
brew update && brew upgrade
cask update
npm update -g
echo "Done"
echo "###############################"
