set -x LANG en_US.UTF-8
set -x LC_LANG en_US.UTF-8
set -x LC_CTYPE en_US.UTF-8

set PATH /usr/local/bin $PATH

set -x EDITOR vim
if type -q nvim nvim
    set -x EDITOR nvim
    abbr v "nvim"
end

if test -e /opt/homebrew/bin
    abbr brwe "brew"
    set -U fish_user_paths /opt/homebrew/bin $fish_user_paths
end

if type -q docker
    abbr dc "docker compose"
end

if type -q go
    set -x -U GOPATH $HOME/.go
    set PATH $GOPATH/bin $PATH
end

set --global hydro_symbol_git_dirty "*"

test -e $HOME/.fishrc_local; and . $HOME/.fishrc_local
