{config, pkgs, ...}:

{
	home.packages = [
		pkgs.kitty
	];
	programs.rofi = {
		enable = true;
		terminal = "kitty";
		plugins.packages = [
			pkgs.rofi-vpn
			pkgs.rofi-bluetooth
			pkgs.rofi-power-menu
			pkgs.rofi-pulse-select
			pkgs.rofi-file-browser
			pkgs.rofi-systemd
			pkgs.networkmanager_dmenu
		];
		extraConfig = builtins.readFile ../dotfiles/rofi/config.rasi;
	};
}
