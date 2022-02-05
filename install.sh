#!/usr/bin/env bash

# Set environment variables
DOTFILES_ROOT=$(pwd -P)
PLATFORM=$(uname -s)

# Exit on non-zero code
set -e

ln -snf $DOTFILES_ROOT/input/inputrc ~/.inputrc

ln -snf $DOTFILES_ROOT/vim/vimrc ~/.vimrc

ln -snf $DOTFILES_ROOT/tmux/tmux.conf ~/.tmux.conf

ln -snf $DOTFILES_ROOT/git/gitconfig ~/.gitconfig
ln -snf $DOTFILES_ROOT/git/gitignore ~/.gitignore

mkdir -p ~/.config/fish
ln -snf $DOTFILES_ROOT/fish/config.fish ~/.config/fish/config.fish

ln -snf $DOTFILES_ROOT/idea/ideavimrc ~/.ideavimrc

unset DOTFILES_ROOT
unset PLATFORM
