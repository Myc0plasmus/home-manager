{home_username, inputs, config, pkgs, ... }:

{
	home.packages = [
		#git
		git
		git-lfs
		hub
	]
	programs.git = {
		enable = true;
		userName = "Myc0plasmus";
		userEmail = "jablonski.natan@gmail.com";
		aliases = {
			pu = "push";
			co = "checkout";
			cm = "commit";
		};
	}
}
