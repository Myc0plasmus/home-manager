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
  home.packages = with pkgs; [
        dracula-theme
		glib

		#terminal emulator
	    kitty

		#screenshots
		feh

		#utils
		xorg.setxkbmap

		#locking screen
		maim
		xdotool
		xautolock
		multilockscreen
		imagemagick

		#services
		dunst #popup notification
		clipit #clipboard manager applet
		blueman
		bluez
		networkmanager-openvpn
		networkmanagerapplet
		polkit_gnome
		polkit
		playerctl
		zscroll
		
		#desktop manager
		gdm
		sddm
		ly

		# settings
		pulsemixer
		upower
		pavucontrol
		xlayoutdisplay
		xorg.xdpyinfo
		arandr
		brightnessctl
		xdg-user-dirs
		swaytools
		swaysettings
		patray
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
	  gaps = {
		smartGaps = true;
		smartBorders = "off";
	  };
	  bars = [];
	  colors = {
        focused = {
		  border = bg;
		  background = bl;
		  text = wh;
		  indicator = ia;
		  childBorder = bg;
		};
		unfocused = {
		  border = bg;
		  background = bb;
		  text = ia;
		  indicator = ia;
		  childBorder = bg;
		};
		focusedInactive = {
		  border = bg;
		  background = bb;
		  text = bl;
		  indicator = ia;
		  childBorder = bg;
		};
		urgent = {
		  border = rd;
		  background = rd;
		  text = wh;
		  indicator = ia;
		  childBorder = bg;
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
		"${modifier}+Space" = "exec rofi -show window";
		
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

		"Print" = "exec --no-startup-id maim \"/home/$USER/Pictures/$(date)\"";
		"${modifier}+Print" = "exec --no-startup-id maim --window $(xdotool getactivewindow) \"/home/$USER/Pictures/$(date)\"";
		"Shift+Print" = "exec --no-startup-id maim --select \"/home/$USER/Pictures/$(date)\"";

		## Clipboard Screenshots
		"Ctrl+Print" = "exec --no-startup-id maim | xclip -selection clipboard -t image/png";
		"Ctrl+${modifier}+Print" = "exec --no-startup-id maim --window $(xdotool getactivewindow) | xclip -selection clipboard -t image/png";
		"Ctrl+Shift+Print" = "exec --no-startup-id maim --select | xclip -selection clipboard -t image/png";


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

		#move windows with hjkl
        "${modifier}+Shift+${Left}" = "move left";
        "${modifier}+Shift+${Down}" = "move down";
        "${modifier}+Shift+${Up}" = "move up";
        "${modifier}+Shift+${Right}" = "move right";


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
	  fonts = {
	    names = [
          "monospace"
		];
		size = 0.0;
	  };
    };
  };
}
