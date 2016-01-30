export HISTFILESIZE=1000
export HISTSIZE=1000
# Ignore duplicate commands and whitespace in history
export HISTCONTROL=ignoreboth
# Keep the times of the commands in history
export HISTTIMEFORMAT='%F %T  '

export EDITOR='vim'
export VISUAL='vim'
export PAGER='less'

if [[ -z "$LANG" ]]; then
  export LANG='en_US.UTF-8'
  export LC_ALL='en_US.UTF-8'
fi

# Set the default Less options.
# Mouse-wheel scrolling has been disabled by -X (disable screen clearing).
# Remove -X and -F (exit if the content fits on one screen) to enable it.
export LESS='-F -g -i -M -R -S -w -X -z-4'

export NVM_DIR=~/.nvm

export BASE16_THEME="tomorrow.dark"
export BASE16_SHELL="$HOME/.config/base16-shell/base16-${BASE16_THEME}.sh"
