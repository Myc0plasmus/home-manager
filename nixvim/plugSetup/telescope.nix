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
				settings = {
					defaults = {
						layout_strategy = "flex";
						border = true;
						borderchars = [ "─" "│" "─" "│" "┌" "┐" "┘" "└" ];
					};
				};
			};
		};
		keymaps = [
			{mode = ["n"]; key = "<leader>t"; action = "<cmd>Telescope<cr>";}
		];
		highlightOverride = {
			TelescopeBorder.fg = "#ffffff";
			TelescopeResultsTitle.fg = "#ffffff";
			TelescopePromptTitle.fg = "#ffffff";
		};
	};
}
