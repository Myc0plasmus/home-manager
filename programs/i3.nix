{home_username, inputs, config, pkgs, lib, ... }:

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
  home.packages = [
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
  home.file.".config/multilock" = {
	source = ../dotfiles/multilock;
	# target = ".config/dotfiles";
	# directory = true;
  };
  xsession.windowManager.i3 = {
	enable = true;
    config = rec {
	  workspaceOutputAssign = [
		{ workspace = "1"; output = sm; }
		{ workspace = "2"; output = fm; }
		{ workspace = "3"; output = sm; }
		{ workspace = "4"; output = fm; }
		{ workspace = "5"; output = sm; }
		{ workspace = "6"; output = fm; }
		{ workspace = "7"; output = sm; }
		{ workspace = "8"; output = fm; }
		{ workspace = "9"; output = sm; }
		{ workspace = "10"; output = fm; }
	  ];
	  bars = [];
	  colors = {
        focused = {
		  border = bl;
		  background = bl;
		  text = wh;
		  indicator = "#2e9ef4";
		  childBorder = bb;
		};
		unfocused = {
		  border = bg;
		  background = bb;
		  text = ia;
		  indicator = "#292d2e";
		  childBorder = bb;
		};
		focusedInactive = {
		  border = bg;
		  background = bb;
		  text = bl;
		  indicator = "#484e50";
		  childBorder = bb;
		};
		urgent = {
		  border = rd;
		  background = rd;
		  text = wh;
		  indicator = "#900000";
		  childBorder = bb;
		};
      };
	  modifier = "Mod4";
	  terminal = "kitty";
	  menu = "rofi -show drun";
	  keybindings = lib.mkOptionDefault {
		# lockscreen
	    "${modifier}+Ctrl+l"="exec lockscript";
		
		#start terminal
        "${modifier}+Return"="exec ${terminal}";

		#close window
		"${modifier}+Shift+q" = "kill";

		# Start your launcher
		"${modifier}+d" = "exec ${menu}";

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
          command = "monitorScript && sleep 1 && launchPolybar";
          always = true;
          notification = false;
        }
        {
          command = "feh --bg-scale $HOME/.config/user-wallpapers/wp12329536-nixos-wallpapers.png"; #bg color: #1d1f27
          always = true;
          notification = false;
        }
        {
          command = "setxkbmap -model pc105 -layout pl -option grp:alt_shift_toggle";
          always = true;
          notification = false;
        }
		{
          command = "xautolock -time 15 -locker 'lockscript'";
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
          command = "multiscreenlock -u $HOME/.config/user-wallpapers/lockscreen.png";
          always = false;
          notification = false;
        }
		 {
          command = "exec i3-msg workspace 1";
          always = false;
          notification = false;
        }




      ];
    };
  };
}
