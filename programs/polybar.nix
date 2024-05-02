{config, pkgs,...}:

{
	home.packages = [
		pkgs.killall
	];
	services.polybar = {
		enable = true;
		script = "$HOME/.config/dotfiles/polybar/launch.sh";
		config = "$HOME/.config/dotfiles/polybar/config.ini";
	};
}
