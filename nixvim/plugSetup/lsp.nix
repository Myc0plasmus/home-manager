{ config,inputs , pkgs, ... }:

{
	programs.nixvim = {
		plugins = {
			lsp = {
				enable = true;
				servers = {
					
				};
			};
		};
	};
}
