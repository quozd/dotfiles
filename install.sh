#!/bin/sh

echo 'Installing dotfiles...'

SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

echo 'Symlinking config files...'

ln -s "${SCRIPT_DIR}/vim/.vimrc" ~/.vimrc
ln -s "${SCRIPT_DIR}/tmux/.tmux.conf" ~/.tmux.conf
ln -s "${SCRIPT_DIR}/git/.gitconfig" ~/.gitconfig

ln -s "${SCRIPT_DIR}/shell/base16-shell" ~/.config/base16-shell

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

