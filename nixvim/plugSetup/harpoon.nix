{ config,inputs , pkgs, ... }:

{
	programs.nixvim = {
		plugins = {
			harpoon = {
				enable = true;
				enableTelescope = true;
				keymaps = {
					addFile = "<leader>ha";	
					cmdToggleQuickMenu = "<leader>hc";	
					toggleQuickMenu = "<leader>hh";	
					navNext = "<leader>hu";	
					navPrev = "<leader>hb";	
				};
			};
		};
		keymaps = [
			{mode = ["n"]; key = "<leader>fh"; action = "<cmd>Telescope harpoon marks<cr>";}
		];
	};
}
