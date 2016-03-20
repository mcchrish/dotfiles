#!/bin/bash
# From https://github.com/mathiasbynens/dotfiles/issues/507

# Exporting spectacle key mappings
for key in MakeLarger MakeSmaller MoveToBottomDisplay MoveToBottomHalf MoveToCenter MoveToFullscreen MoveToLeftDisplay MoveToLeftHalf MoveToLowerLeft MoveToLowerRight MoveToNextDisplay MoveToNextThird MoveToPreviousDisplay MoveToPreviousThird MoveToRightDisplay MoveToRightHalf MoveToTopDisplay MoveToTopHalf MoveToUpperLeft MoveToUpperRight RedoLastMove UndoLastMove; do
  printf "defaults write com.divisiblebyzero.Spectacle %s -data " "${key}";
  defaults read com.divisiblebyzero.Spectacle ${key} | sed 's/[^0-9a-f]//g';
done
