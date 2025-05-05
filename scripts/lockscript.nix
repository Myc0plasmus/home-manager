{ pkgs }:

pkgs.writeShellScriptBin "lockscript" ''
  # Lock screen displaying this image.
  # i3lock -i /etc/nixos/dotfiles/i3/lockscreen_3440x1440.png
  export XAUTHORITY="$HOME/.Xauthority"
  export DISPLAY=":0"
  ${pkgs.betterlockscreen}/bin/betterlockscreen -l --off 1

  # Turn the screen off after a delay.
  # sleep 300 && pgrep i3lock && xset dpms force off
''
