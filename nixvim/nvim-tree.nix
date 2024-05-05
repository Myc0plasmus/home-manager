{ config,inputs , pkgs, ... }:

{
	programs.nixvim = {
		plugins = {
			nvim-tree.enable = true;
		};
	}
}
