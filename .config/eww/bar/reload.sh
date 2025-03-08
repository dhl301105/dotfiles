#!/bin/bash

# Paths to the files or directories you want to monitor
TARGETS="$HOME/.config/eww/bar/eww.yuck $HOME/.config/eww/bar/eww.scss"

# Use inotifywait to monitor the targets
inotifywait -m -e create,delete,modify,move $TARGETS | while read -r directory event file; do
  killall eww
  ~/dotfiles/release/eww  -c $HOME/.config/eww/bar open bar
done
