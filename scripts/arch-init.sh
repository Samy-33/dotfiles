#!/bin/zsh

stow --restow --target=$HOME dotcom
stow --restow --target=$HOME dotarch

# Removes the stowed symlinks
stow_clean () {
  stow --target=$HOME -D dotcom
  stow --target=$HOME -D dotarch
}
