set -x EDITOR vim
set -x LANG en_US.UTF-8
set -x LC_LANG en_US.UTF-8
set -x LC_CTYPE en_US.UTF-8

abbr brwe "brew"
abbr dc "docker-compose"
abbr v "nvim"

# Local fish config
test -e $HOME/.fishrc_local; and . $HOME/.fishrc_local

