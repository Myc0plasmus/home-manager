{ config,inputs , pkgs, ... }:

{
	programs.nixvim = {
		plugins = {
			lsp = {
				enable = true;
				servers = {
					tsserver.enable = true;	
					lua-ls.enable = true;	
					rust-analyzer = {
						enable = true;	
						installCargo = true;
						installRustc = true;
					};
					dockerls.enable = true;	
					clangd.enable = true;	
					jsonls.enable = true;	
					html.enable = true;	
					cmake.enable = true;	
					csharp-ls.enable = true;	
					kotlin-language-server.enable = true;	
					pyright.enable = true;	
					rnix-lsp.enable = true;	
					
				};
				keymaps.diagnostic = {
					"<space>e" = "open_float";
					"<space>q" = "setloclist";
					"[d" = "goto_prev";
					"]d" = "goto_next";
									};
				keymaps.lspBuf = {
					"K" = "hover";
					"<space>ca" = "code_action";
					"<leader>gD" = "declaration";
					"<leader>rn" = "rename";
					"<leader>gs" = "signature_help";
				};
				keymaps.extra = [
					{mode = ["n"]; key = "<leader>gd"; action = "require('telescope.builtin').lsp_definitions()"; lua = true;}
					{mode = ["n"]; key = "<leader>gi"; action = "require('telescope.builtin').lsp_implementations()"; lua = true;}
					{mode = ["n"]; key = "<leader>go"; action = "require('telescope.builtin').lsp_type_definitions()"; lua = true;}
  
					{mode = ["n"]; key = "<leader>gr"; action = "require('telescope.builtin').lsp_references()"; lua = true;}
				];
			};
		};
	};
}
