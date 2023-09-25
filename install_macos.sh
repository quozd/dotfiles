#!/usr/bin/env bash

set -e

packages=(
    neovim
    tmux
    alacritty
    fish

    python
    go
    rustup

    # neovim
    ripgrep
    tree-sitter
)

brew install "${packages[@]}"
