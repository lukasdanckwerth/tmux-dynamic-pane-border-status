# tmux-dynamic-pane-border-status

Plugin that automatically hides the pane status if only one pane if visible and toggles if multiple
panes are shown. Also gives you a key to toggle the pane status manually.

> Please note, the idea came from this discussion
[https://github.com/tmux/tmux/issues/566](https://github.com/tmux/tmux/issues/566).

<!-- ## Install -->

## Configuration

The following options are available to configure *tmux-dynamic-pane-border-status*. The shown
configuration also presents the defaults.

```tmux
# set whether automativ border hide / show is enabled
set -g @dynamic_pane_border_status_automation_enabled 1

# set whether dynamic pane border is enabled
set -g @dynamic_pane_border_status_key_enabled 1

# set the key mapping to toggle pane status
set -g @dynamic_pane_border_status_key 'P'

# set the position of pane border status
set -g @dynamic_pane_border_status_position 'top'

# set whether to display a tmux message after toggling
set -g @dynamic_pane_border_status_display_message 1
```


