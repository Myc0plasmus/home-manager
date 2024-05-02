{config, pkgs, ...}:

{
	home.packages = [
		pkgs.kitty
	];
	programs.rofi = {
		enable = true;
		terminal = "kitty";
		plugins = [
			pkgs.rofi-vpn
			pkgs.rofi-bluetooth
			pkgs.rofi-power-menu
			pkgs.rofi-pulse-select
			pkgs.rofi-file-browser
			pkgs.rofi-systemd
			pkgs.networkmanager_dmenu
		];
		# extraConfig = (builtins.readFile ../dotfiles/rofi/config.rasi);
	};
	home.file."$HOME/.config/rofi" = {
		source = ../dotfiles/rofi;
		
	# target = ".config/dotfiles";
	# directory = true;
    };
}
