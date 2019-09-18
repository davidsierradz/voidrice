#!/bin/bash

# You can enable both at the same time

# copy an url to clipboard
printf "%s" "$1" | xclip -selection clipboard
# copy to tmux
#printf "%s" "$1" | tmux loadb -
