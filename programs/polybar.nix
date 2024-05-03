{config, pkgs,...}:

{
	home.packages = [
		pkgs.killall
	];
	services.polybar = {
		enable = true;
		script = "launchPolybar";
		config = ../dotfiles/polybar/config.ini;
	};
}
