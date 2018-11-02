set -x EDITOR vim
set -x LANG en_US.UTF-8
set -x LC_LANG en_US.UTF-8
set -x LC_CTYPE en_US.UTF-8

abbr brwe="brew"
abbr mux="tmuxinator"

# Local bash config
test -e $HOME/.fishrc_local; and . $HOME/.fishrc_local

# Iterm2 shell integration
test -e $HOME/.iterm2_shell_integration.fish; and . $HOME/.iterm2_shell_integration.fish
