#!/bin/bash

# Lock screen displaying this image.
# i3lock -i /etc/nixos/dotfiles/i3/lockscreen_3440x1440.png
multilockscreen -l --off 5

# Turn the screen off after a delay.
# sleep 300 && pgrep i3lock && xset dpms force off
