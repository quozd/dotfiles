# Various easy completions

# Bash builtins
complete -A builtin builtin

# Bash options
complete -A setopt set

# Commands
complete -A command command complete coproc exec hash type

# Directories
complete -A directory cd pushd mkdir rmdir

# Functions
complete -A function function

# Help topics
complete -A helptopic help

# Jobspecs
complete -A job disown fg jobs
complete -A stopped bg

# Readline bindings
complete -A binding bind

# Shell options
complete -A shopt shopt

# Signal names
complete -A signal trap

# Variables
complete -A variable declare export readonly typeset

# Both functions and variables
complete -A function -A variable unset

# Add tab completion for SSH hostnames based on ~/.ssh/config, ignoring wildcards
[ -e "$HOME/.ssh/config" ] && complete -o "default" -o "nospace" -W "$(grep "^Host" ~/.ssh/config | grep -v "[?*]" | cut -d " " -f2- | tr ' ' '\n')" scp sftp ssh;

# Add tab completion for many Bash commands
if which brew &> /dev/null && [ -f "$(brew --prefix)/etc/bash_completion" ]; then
  source "$(brew --prefix)/etc/bash_completion";
elif [ -f /etc/bash_completion ]; then
  source /etc/bash_completion;
fi;
