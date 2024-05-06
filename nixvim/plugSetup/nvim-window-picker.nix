{ config,inputs , pkgs, ... }:

{
	programs.nixvim = {
		extraPlugins = with pkgs.vimPlugins; [
			{
				plugin = nvim-window-picker;
				config = builtins.readFile ./nvim-window-picker-config.lua;
			}
		];
		
		keymaps = [
			{mode = ["n"]; key = "<leader>w"; action = "require('window-picker').pick_window()"; lua = true;}
		];
	};
}
