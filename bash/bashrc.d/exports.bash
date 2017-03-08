export HISTFILESIZE=1000
export HISTSIZE=1000
# Ignore duplicate commands and whitespace in history
export HISTCONTROL=ignoreboth
# Keep the times of the commands in history
export HISTTIMEFORMAT='%F %T  '

export EDITOR='nvim'
export VISUAL='nvim'
export PAGER='less'

export IGNOREEOF=2

if [[ -z "$LANG" ]]; then
  export LANG='en_US.UTF-8'
  export LC_ALL='en_US.UTF-8'
fi

# Set the default Less options.
# Mouse-wheel scrolling has been disabled by -X (disable screen clearing).
# Remove -X and -F (exit if the content fits on one screen) to enable it.
export LESS='-F -g -i -M -R -S -w -X -z-4'

export NVM_DIR=~/.nvm
