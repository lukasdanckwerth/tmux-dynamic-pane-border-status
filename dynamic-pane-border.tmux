#!/usr/bin/env bash

# exit immdeiately if apipeline returns a non-zero status
# set -e

dynamic_pane_border_enabled="@dynamic_pane_border_enabled"
dynamic_pane_border_toggle_key="@toggle_pane_border_key"
dynamic_pane_border_position="@pane_border_position"

tmux_option() {
    local -r option=$(tmux show-option -gqv "$1")
    local -r fallback="$2"
    echo "${option:-$fallback}"
}

# auto hide pane-border-status line when only one pane is displayed (see tmux/tmux#566)
tmux set-hook -g 'after-new-window'   'run-shell -b "if [ \#{window_panes} -eq 1 ]; then tmux set pane-border-status off; fi"'
tmux set-hook -g 'after-kill-pane'    'run-shell -b "if [ \#{window_panes} -eq 1 ]; then tmux set pane-border-status off; fi"'
tmux set-hook -g 'pane-exited'        'run-shell -b "if [ \#{window_panes} -eq 1 ]; then tmux set pane-border-status off; fi"'
tmux set-hook -g 'after-split-window' 'run-shell -b "if [ \#{window_panes} -gt 1 ]; then tmux set pane-border-status top; fi"'

# bind key to toggle pane border
tmux bind-key -N 'Toggle pane border.' P run-shell -b '$HOME/.tmux/plugins/tmux-dynamic-pane-border/toggle-pane-border.sh'

