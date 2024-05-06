{ config,inputs , pkgs, ... }:

{
	programs.nixvim = {
		plugins = {
			harpoon = {
				enable = true;
				keymaps = {
					addFile = "<leader>ha";	
					cmdToggleQuickMenu = "<leader>hh";	
					navNext = "<leader>hu";	
					navPrev = "<leader>hb";	
				};
			};
		};
	};
}
