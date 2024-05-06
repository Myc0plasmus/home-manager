{ config,inputs , pkgs, ... }:

{
	programs.nixvim = {
		extraPlugins = with pkgs.vimPlugins; [
			nvim-window-picker
		];
		
		keymaps = [
			{mode = ["n"]; key = "<leader>w"; action = "require('window-picker').pick_window()"; lua = true;}
		];
	};
}
