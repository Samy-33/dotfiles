#!/bin/zsh

stow --target=$HOME dotcom
stow --target=$HOME dotarch

# Removes the stowed symlinks
stow_clean () {
  stow --target=$HOME -D dotcom
  stow --target=$HOME -D dotarch
}
