DOTFILES_ROOT = $(CURDIR)
XDG_CONFIG_HOME = $(HOME)/.config

define subtarget
	@$(MAKE) -s -f $(lastword $(MAKEFILE_LIST)) $(1)
endef

define success_message
	@tput setaf 2
	@echo [OK] $1
	@tput sgr0
endef

all: help

.PHONY: vim
vim:
	ln -snf $(DOTFILES_ROOT)/vim/vimrc ~/.vimrc
	$(call log_info,Vim)

.PHONY: neovim
neovim:
	mkdir -p $(XDG_CONFIG_HOME)
	ln -snf $(DOTFILES_ROOT)/nvim $(XDG_CONFIG_HOME)/nvim
	$(call log_info,Neovim)

.PHONY: linux-base
linux-base:
	$(call subtarget,neovim)

help:
	@echo Following OS-based targets are available:
	#@echo
	#@echo   - Linux make linux
	#@echo       * vim
	#@echo       * neovim
	#@echo       * bash
	#@echo       * neovim
	#@echo       * neovim
	#@echo       * neovim
	#@echo       * neovim
	#@echo   - OS X (make osx)
	#@echo
	#@echo Also there are targets per application:
	#@echo
	#@echo   - Vim (make vim)
	#@echo   - Neovim (make neovim)
	#@echo   - Bash (make bash)
	#@echo   - Git (make git)
	#@echo   - i3wm (make i3wm)
	#@echo   - Readline (make input)
	#@echo   - Termite (make termite)
	#@echo   - iTerm2 (make iterm)
	#@echo   - Tmux (make tmux)
