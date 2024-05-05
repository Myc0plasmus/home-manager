{ config,inputs , pkgs, ... }:

{
	programs.nixvim = {
		plugins = {
			telescope = {
				enable = true;
				keymaps = {
					"<leader>ff" = {mode = ["n"]; action = "find_files";};
					"<leader>fg" = {mode = ["n"]; action = "live_grep";};
					"<leader>fb" = {mode = ["n"]; action = "buffers";};
				};
			};
		};
		keymaps = [
			{mode = ["n"]; key = "<leader>t"; action = "<cmd>Telescope<cr>"}
		];
	};
}
