#!/bin/zsh

brew install stow 

stow --target=$HOME dotcom
stow --target=$HOME dotmac

# Removes the stowed symlinks
remove-stow () {
  stow --target=$HOME -D dotcom
  stow --target=$HOME -D dotmac
}
