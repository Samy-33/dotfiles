#!/bin/zsh

sudo pacman -S stow 

stow --target=$HOME dotcom

# Removes the stowed symlinks
remove-stow () {
  stow --target=$HOME -D dotcom
}
