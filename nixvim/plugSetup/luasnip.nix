{ config,inputs , pkgs, ... }:

{
	programs.nixvim = {
		plugins = {
			luasnip.enable = true;
		};
	};
}
