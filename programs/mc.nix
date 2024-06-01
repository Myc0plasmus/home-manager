{ config, pkgs, ...}:

{
	home.file = {
		".config/mc".source = ../dotfiles/mc;
	};
}
