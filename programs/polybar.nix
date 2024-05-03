{config, pkgs,...}:

{
	home.packages = [
		pkgs.killall
	];
	services.polybar = {
		enable = true;
		# script = "launchPolybar &";
		script = "echo useless &";
		config = ../dotfiles/polybar/config.ini;
	};
}
