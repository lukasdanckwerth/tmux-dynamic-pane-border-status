# tmux-dynamic-pane-border

Plugin that automatically hides the pane status if only one pane if visible.

## Configuration

The following options are available to configure *tmux-dynamic-pane-border*.

```vim
# set whether automativ border hide / show is enabled
set -g @toggle_pane_border_status_automation_enabled 1

# set whether dynamic pane border is enabled
set -g @toggle_pane_border_status_key_enabled 1

# set the key mapping to toggle pane status
set -g @toggle_pane_border_status_key 'P'

# set the position of pane border status
set -g @toggle_pane_border_status_position 'top'
```
