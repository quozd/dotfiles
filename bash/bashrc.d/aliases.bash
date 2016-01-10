alias ..="cd .."
alias ~="cd ~"

# Detect which `ls` flavor is in use
if ls --color > /dev/null 2>&1; then # GNU `ls`
  alias ls="command ls --color"
else # OS X `ls`
  alias ls="command ls -G"
fi
alias ll="ls -lF"
alias la="ls -laF"

alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

alias reload="exec $SHELL -l"

if [ $(uname -s) == 'Darwin' ]; then
  alias vi="/usr/local/bin/vim"
fi

alias vim="nvim"

