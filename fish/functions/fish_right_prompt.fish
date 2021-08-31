function fish_right_prompt -d "Write out the right prompt"
    set -l gray (set_color b0bec4)
    set -l current_time (date '+%r')
    echo "$gray$current_time"
end
