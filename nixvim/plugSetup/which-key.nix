{ config,inputs , pkgs, ... }:

{
  programs.nixvim = {
	plugins = {
	  which-key = {
		enable = true;
		settings.triggersBlackList = {
			i = [
			  ";"
			  "\\"
			];
		};
	  };
	};
  };
}
