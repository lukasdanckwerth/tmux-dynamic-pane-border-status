#!/usr/bin/env bash

position=$(tmux show-option -v pane-border-status)

if [[ "$position" == "off" ]]; then
    tmux set pane-border-status "top"
elif [[ "$position" == "top" ]]; then
    tmux set pane-border-status "off"
fi

unset position
