# tmux-dynamic-pane-border

Plugin that automatically hides the pane status if only one pane if visible.

## Configuration

The following options are available to configure *tmux-dynamic-pane-border*.

```shell
# set whether dynamic pane border is enabled
set -g @dynami_pane_border_enabled = 1

# set the key mapping to toggle pane status
set -g @dynami_pane_border_key = "P"

# set the position of pane border status
set -g @dynami_pane_border_position = "top"
```
