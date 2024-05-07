#!/usr/bin/env bash

# exit immediately if a pipeline returns a non-zero status
set -e

# receive current directory
CURRENT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}"  )" && pwd  )"

# receive the tmux option for $1, falling back to $2
tmux_option() {
    local -r option=$(tmux show-option -gqv "$1")
    local -r fallback="$2"
    echo "${option:-$fallback}"
}

# auto hide pane-border-status line when only one pane is displayed (see tmux/tmux#566)
tmux_add_toggle_pane_border_status_hooks() {
    local -r position=$(tmux_option "@dynamic_pane_border_status_position" "top")
    tmux set-hook -g 'after-new-window'   'run-shell -b "if [ \#{window_panes} -eq 1 ]; then tmux set pane-border-status off; fi"'
    tmux set-hook -g 'after-kill-pane'    'run-shell -b "if [ \#{window_panes} -eq 1 ]; then tmux set pane-border-status off; fi"'
    tmux set-hook -g 'pane-exited'        'run-shell -b "if [ \#{window_panes} -eq 1 ]; then tmux set pane-border-status off; fi"'
    tmux set-hook -g 'after-split-window' 'run-shell -b "if [ \#{window_panes} -gt 1 ]; then tmux set pane-border-status $position; fi"'
}

# bind key to toggle pane border
tmux_bind_key() {
    local -r the_key=$(tmux_option "@dynamic_pane_border_status_key" "P")
    local -r the_position=$(tmux_option "@dynamic_pane_border_status_position" "top")
    local -r the_is_display_message=$(tmux_option "@dynamic_pane_border_status_display_message" "1")
    tmux bind-key -N 'Toggle pane border.' $the_key run-shell "$CURRENT_DIR/scripts/toggle-pane-border-status.sh ${the_position} ${the_is_display_message}"
}

is_enabled=$(tmux_option "@dynamic_pane_border_status_automation_enabled" "1")
if [[ $is_enabled -eq "1" ]]; then
    tmux_add_toggle_pane_border_status_hooks
fi

is_key_enabled=$(tmux_option "@dynamic_pane_border_status_key_enabled" "1")
if [[ $is_key_enabled -eq "1" ]]; then
    tmux_bind_key
fi

