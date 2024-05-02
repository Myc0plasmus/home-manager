{home_username, inputs, config, pkgs, ... }:

let
  # colors
  bg = "#2c2c2e";
  fg = "#9f9f9f";
  hi = "#efef8f";
  ac = "#a0afa0";
  tx = "#040404";
  ia = "#8f8f8f";
  be = "#8faf9f";
  yw = "#ccdc90";
  gn = "#88b090";
  rd = "#e89393";
  bl = "#b00404";
  bb = "#000000";
  wh = "#ffffff";

  # vars
  fm = "eDP-1";
  sm = "HDMI-1";
  Left = "h";
  Down = "j";
  Up = "k";
  Right = "l";

in
{
  pkgs.home.packages = [
        pkgs.dracula-theme
		pkgs.glib

		#terminal emulator
	    pkgs.kitty

		#screenshots
		pkgs.feh

		#utils
		pkgs.xorg.setxkbmap

		#locking screen
		pkgs.maim
		pkgs.xdotool
		pkgs.xautolock
		pkgs.multilockscreen
		pkgs.imagemagick

		#services
		pkgs.dunst #popup notification
		pkgs.clipit #clipboard manager applet
		pkgs.blueman
		pkgs.bluez
		pkgs.networkmanager-openvpn
		pkgs.networkmanagerapplet
		pkgs.polkit
		pkgs.playerctl
		pkgs.zscroll
		
		#desktop manager
		pkgs.gnome.gdm
		pkgs.sddm
		pkgs.ly
  ];
  xsession.windowManager.i3 = {
	enable = true;
    config = {
	  colors = {
        focused = {
		  border = bl;
		  background = bl;
		  text = wh;
		};
		unfocused = {
		  border = bg;
		  background = bb;
		  text = ia;
		};
		focusedInactive = {
		  border = bg;
		  background = bb;
		  text = bl;
		};
		urgent = {
		  border = rd;
		  background = rd;
		  text = wh;
	
		};
      };
	  modifier = "Mod4";
	  terminal = "kitty";
	  menu = "rofi -show drun";
	  keybindings = lib.mkOptionDefault {
		# lockscreen
	    "${modifier}+Ctrl+l"="exec \"$HOME/.config/dotfiles/i3/lockscript.sh\"";
		
		#start terminal
        "${modifier}+Return"="exec ${terminal}";

		#close window
		"${modifier}+Shift+q" = "kill";

		# Start your launcher
		"${modifier}+d" = "exec $menu";

		# Start your bin launcher
		"${modifier}+Ctrl+d" = "exec rofi -show run";

		#Start bluetooth
		"${modifier}+Ctrl+b" = "exec rofi-bluetooth";

		#Start vpn
		"${modifier}+Ctrl+v" = "exec rofi-vpn";

		#Start systemd
		"${modifier}+Ctrl+Shift+s" = "exec rofi-systemd";

		#Start file browser
		"${modifier}+Ctrl+f" = "exec rofi -show filebrowser";

		#Start window
		"${modifier}+Ctrl+w" = "exec rofi -show window";
		
		#Start ssh
		"${modifier}+Ctrl+s" = "exec rofi -show ssh";

		#Start power menu
		"${modifier}+Ctrl+p" = "exec rofi -show p -modi p:rofi-power-menu";

		#move workspaces to displays 
		"${modifier}+Control+Shift+Right" = "move workspace to output right";
		"${modifier}+Control+Shift+Left" = "move workspace to output left";
		"${modifier}+Control+Shift+Down" = "move workspace to output down";
		"${modifier}+Control+Shift+Up" = "move workspace to output up";

		"${modifier}+Control+Shift+${Right}" = "move workspace to output right";
		"${modifier}+Control+Shift+${Left}" = "move workspace to output left";
		"${modifier}+Control+Shift+${Down}" = "move workspace to output down";
		"${modifier}+Control+Shift+${Up}" = "move workspace to output up";


		#focus urgent window
		"${modifier}+x" = "[urgent=latest] focus";
		
		#vertical and horizontal split
        "${modifier}+b" = "splith";
        "${modifier}+v" = "splitv";

		#move focus with hjkl
        "${modifier}+${Left}" = "focus left";
        "${modifier}+${Down}" = "focus down";
        "${modifier}+${Up}" = "focus up";
        "${modifier}+${Right}" = "focus right";

	  };
      startup = [
        {
          command = "$HOME/.config/dotfiles/i3/monitorScript.sh && sleep 1 && systemctl --user restart polybar.service";
          always = true;
          notification = false;
        }
        {
          command = "feh --bg-fill $HOME/.config/dotfiles/i3/wp12329536-nixos-wallpapers.png";
          always = true;
          notification = false;
        }
        {
          command = "setxkbmap -model pc105 -layout pl -option grp:alt_shift_toggle";
          always = true;
          notification = false;
        }
		{
          command = "xautolock -time 15 -locker '$HOME/.config/dotfiles/i3/lockscript.sh'";
          always = true;
          notification = false;
        }
		{
          command = "xdg-user-dirs-update";
          always = false;
          notification = false;
        }
		{
          command = "nm-applet";
          always = false;
          notification = false;
        }
		{
          command = "clipit";
          always = false;
          notification = false;
        }
		{
          command = "blueman-applet";
          always = false;
          notification = false;
        }
		{
          command = "multiscreenlock -u $HOME/.config/dotfiles/i3/lockscreen.png";
          always = false;
          notification = false;
        }





      ];
    };
  };
}
