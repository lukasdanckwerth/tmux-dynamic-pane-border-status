#!/usr/bin/env bash

# receive script arguments
target_position="${1:-"top"}"
is_display_message="${2:-1}"

# receive current tmux pane-border-status option
cur_position=$(tmux show-option -v pane-border-status)
cur_position=${cur_position:-"off"}

if [[ "$cur_position" == "off" ]] ; then
    new_position="$target_position"
else
    new_position="off"
fi

# do the actual pane border toggle
tmux set pane-border-status "$new_position"

# display message if deliberate
if [[ "$is_display_message" == "1" ]] ; then
    tmux display "toggled, new position: $new_position"
fi

unset cur_position
unset new_position
unset target_position
unset is_display_message

