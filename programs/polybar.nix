{config, pkgs,...}:

{
	home.packages = [
		pkgs.killall
	];
	services.polybar = {
		enable = true;
		# script = "$HOME/.local/bin/launchPolybar &";
		script = "echo useless";
		config = ../dotfiles/polybar/config.ini;
	};
}
