#!/bin/sh

echo 'Installing dotfiles...'

SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

echo 'Symlinking config files...'

ln -s "${SCRIPT_DIR}/.vimrc" ~/.vimrc
ln -s "${SCRIPT_DIR}/.tmux.conf" ~/.tmux.conf
ln -s "${SCRIPT_DIR}/.gitconfig" ~/.gitconfig

echo 'Done.'

echo 'Installing Prezto...'

ln -s "${SCRIPT_DIR}/zsh" ~/.zprezto
ln -s "${SCRIPT_DIR}/zsh/runcoms/zshrc" ~/.zshrc
ln -s "${SCRIPT_DIR}/zsh/runcoms/zlogin" ~/.zlogin
ln -s "${SCRIPT_DIR}/zsh/runcoms/zlogout" ~/.zlogout
ln -s "${SCRIPT_DIR}/zsh/runcoms/zpreztorc" ~/.zpreztorc
ln -s "${SCRIPT_DIR}/zsh/runcoms/zprofile" ~/.zprofile
ln -s "${SCRIPT_DIR}/zsh/runcoms/zshenv" ~/.zshenv

echo 'Done.'

