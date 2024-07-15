{ config,inputs , pkgs, ... }:

{
	programs.nixvim = {
		plugins = {
			lspsaga = {
				enable = true;
			};
		};
		keymaps = [
			{mode = ["n"]; key = "<space>ca"; action = "<cmd>Lspsaga code_action<cr>"; }
			{mode = ["n"]; key = "]d"; action = "<cmd>Lspsaga diagnostic_jump_next<cr>"; }
			{mode = ["n"]; key = "[d"; action = "<cmd>Lspsaga diagnostic_jump_prev<cr>"; }
			{mode = ["n"]; key = "K"; action = "<cmd>Lspsaga hover_doc<cr>"; }
			{mode = ["n"]; key = "<leader>sd"; action = "<cmd>Lspsaga peek_definition<cr>"; }
			{mode = ["n"]; key = "<leader>st"; action = "<cmd>Lspsaga peek_type_definition<cr>"; }
			{mode = ["n"]; key = "<leader>gd"; action = "<cmd>Lspsaga goto_definition<cr>"; }
			{mode = ["n"]; key = "<leader>gt"; action = "<cmd>Lspsaga goto_type_definition<cr>"; }
			{mode = ["n"]; key = "<leader>lf"; action = "<cmd>Lspsaga finder<cr>"; }
			{mode = ["n"]; key = "<leader>li"; action = "<cmd>Lspsaga finder imp<cr>"; }
			{mode = ["n"]; key = "<leader>rn"; action = "<cmd>Lspsaga lsp_rename ++project<cr>"; }
		];
	};
}
