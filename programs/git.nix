{home_username, inputs, config, pkgs, ... }:

{
	home.packages = [
		#git
		pkgs.git
		pkgs.git-lfs
		pkgs.hub
	];
	programs.git = {
		enable = true;
		userName = "Myc0plasmus";
		userEmail = "jablonski.natan@gmail.com";
		aliases = {
			pu = "push";
			co = "checkout";
			cm = "commit";
		};
		lfs.enable = true;
		extraConfig = {
			safe = {
				directory = "/etc/nixos";
			};
		};
	};
}
