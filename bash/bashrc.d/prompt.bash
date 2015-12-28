# colors

#'\[\033[00m\]'   foreground white
#'\[\033[0;30m\]' foreground black
#'\[\033[0;31m\]' foreground red
#'\[\033[0;32m\]' foreground green
#'\[\033[0;33m\]' foreground yellow
#'\[\033[0;34m\]' foreground blue
#'\[\033[0;35m\]' foreground magenta
#'\[\033[0;36m\]' foreground cyan
#'\[\033[0;37m\]' foreground gray
#'\[\033[1;30m\]' foreground black bright
#'\[\033[1;31m\]' foreground red bright
#'\[\033[1;32m\]' foreground green bright
#'\[\033[1;33m\]' foreground yellow bright
#'\[\033[1;34m\]' foreground blue bright
#'\[\033[1;35m\]' foreground magenta bright
#'\[\033[1;36m\]' foreground cyan bright
#'\[\033[1;37m\]' foreground gray bright

export GIT_PS1_SHOWDIRTYSTATE=1

function set_bash_prompt() {
  # \u - username
  # \H - host
  # \w - pwd
  # \$ - prompt char
  # \@ - time 12h AM/PM

  # Singleline
  #PS1='\[\033[0;32m\]\u@\h \[\033[0;34m\]\w\[\033[00m\]$(__git_ps1 " (%s)") \$ '

  # Multiline
  PS1='\[\033[0;32m\]\u@\H \[\033[0;34m\]\w\[\033[00m\]$(__git_ps1 " (%s)")\n\[\033[0;34m\]\$\[\033[00m\] '
}

export PROMPT_COMMAND=set_bash_prompt
