#!/usr/bin/env bash

# Set environment variables
DOTFILES_ROOT=$(pwd -P)
PLATFORM=$(uname -s)

# Exit on non-zero code
set -e

echo ""

# Logging functions
info () {
  printf "\r  [ \033[00;34m..\033[0m ] $1\n"
}

warn () {
  printf "\r\033[2K  [ \033[00;33mWARN\033[0m ] $1\n"
}

success () {
  printf "\r\033[2K  [ \033[00;32mOK\033[0m ] $1\n"
}

fail () {
  printf "\r\033[2K  [\033[0;31mFAIL\033[0m] $1\n"
  echo ""
  exit
}

# Check prerequirements
#if ! [ git --version 2>&1 >/dev/null ]
#then
  #fail "Git is not installed"
#fi

# Start installation
info "Starting configuration"
info "Dotfiles root directory: $DOTFILES_ROOT"
info "Platform: $PLATFORM"

# Neovim
info "Configuring Neovim"

mkdir -p ${XDG_CONFIG_HOME:=$HOME/.config}
ln -snf $DOTFILES_ROOT/nvim $XDG_CONFIG_HOME/nvim

success "Neovim is configured"

# Vim
info "Configuring vim"

ln -snf $DOTFILES_ROOT/vim/vimrc ~/.vimrc

success "Vim is configured"

# Tmux
info "Configuring tmux"

ln -snf $DOTFILES_ROOT/tmux/tmux.conf ~/.tmux.conf

success "Tmux is configured"

# Git
info "Configuring git"

ln -snf $DOTFILES_ROOT/git/gitconfig ~/.gitconfig
ln -snf $DOTFILES_ROOT/git/gitignore ~/.gitignore

success "Git is configured"

# Shell
info "Configuring shell"

ln -snf $DOTFILES_ROOT/bash/base16-shell ~/.config/base16-shell
ln -snf $DOTFILES_ROOT/bash/bashrc.d ~/.bashrc.d
ln -snf $DOTFILES_ROOT/bash/bashrc ~/.bashrc
ln -snf $DOTFILES_ROOT/bash/bash_profile ~/.bash_profile

success "Shell is configured"

info "Cleaning up"

unset DOTFILES_ROOT
unset PLATFORM

success "Clean is done"
success "Configuration is done"
