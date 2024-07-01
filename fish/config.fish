set -x LANG en_US.UTF-8
set -x LC_LANG en_US.UTF-8
set -x LC_CTYPE en_US.UTF-8

set PATH /usr/local/bin $PATH

set -x EDITOR vim
if type -q nvim nvim
    set -x EDITOR nvim
    abbr v "nvim"
    abbr vi "nvim"
end

if test -e /opt/homebrew/bin
    abbr brwe "brew"
    set -U fish_user_paths /opt/homebrew/bin $fish_user_paths
end

if test -e /opt/homebrew/opt/python@3.11/libexec/bin
    set -U fish_user_paths /opt/homebrew/opt/python@3.11/libexec/bin $fish_user_paths
end

if test -e $HOME/.local/bin
    set -U fish_user_paths $HOME/.local/bin $fish_user_paths
end

if test -e $HOME/.cargo/bin
    set -U fish_user_paths $HOME/.cargo/bin $fish_user_paths
end

if type -q docker
    abbr d "docker"
    abbr dc "docker compose"
end

if type -q nerdctl
    abbr n "nerdctl"
    abbr nc "nerdctl compose"
end

if type -q colima
    abbr c "colima"
    abbr cn "colima nerdctl"
    abbr cnc "colima nerdctl compose"
end

if type -q kubectl
    abbr k "kubectl"
end

if type -q go
    set -x -U GOPATH $HOME/.go
    set PATH $GOPATH/bin $PATH
end

set --global hydro_symbol_git_dirty "*"

test -e $HOME/.fishrc_local; and . $HOME/.fishrc_local

# TokyoNight Color Palette
set -l foreground c8d3f5
set -l selection 3654a7
set -l comment 7a88cf
set -l red ff757f
set -l orange ff966c
set -l yellow ffc777
set -l green c3e88d
set -l purple fca7ea
set -l cyan 86e1fc
set -l pink c099ff

# Syntax Highlighting Colors
set -g fish_color_normal $foreground
set -g fish_color_command $cyan
set -g fish_color_keyword $pink
set -g fish_color_quote $yellow
set -g fish_color_redirection $foreground
set -g fish_color_end $orange
set -g fish_color_error $red
set -g fish_color_param $purple
set -g fish_color_comment $comment
set -g fish_color_selection --background=$selection
set -g fish_color_search_match --background=$selection
set -g fish_color_operator $green
set -g fish_color_escape $pink
set -g fish_color_autosuggestion $comment

# Completion Pager Colors
set -g fish_pager_color_progress $comment
set -g fish_pager_color_prefix $cyan
set -g fish_pager_color_completion $foreground
set -g fish_pager_color_description $comment
set -g fish_pager_color_selected_background --background=$selection
