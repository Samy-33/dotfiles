#!/bin/zsh

sudo pacman -S stow 

stow --target=$HOME dotcom
stow --target=$HOME dotarch

# Removes the stowed symlinks
remove-stow () {
  stow --target=$HOME -D dotcom
  stow --target=$HOME -D dotarch
}
