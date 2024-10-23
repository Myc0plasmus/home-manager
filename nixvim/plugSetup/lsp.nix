{ config,inputs , pkgs, ... }:

{
	programs.nixvim = {
		plugins = {
			lsp = {
				enable = true;
				# onAttach = ''
				# 	local function lspAttach(client)
				# 		print('LSP attached')
				# 		-- Example: Enable completion
				# 		require'completion'.on_attach(client)
				# 	end
				# '';
				servers = {
					ts-ls.enable = true;	
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
					# rnix.enable = true;	
					r-language-server.enable = true;	
					
				};
				# keymaps.diagnostic = {
				# 	"<space>e" = "open_float";
				# 	"<space>q" = "setloclist";
				# 	"[d" = "goto_prev";
				# 	"]d" = "goto_next";
				# 					};
				# keymaps.lspBuf = {
				# 	"K" = "hover";
				# 	"<space>ca" = "code_action";
				# 	"<leader>gD" = "declaration";
				# 	"<leader>rn" = "rename";
				# 	"<leader>gs" = "signature_help";
				# };
				# keymaps.extra = [
				# 	{mode = ["n"]; key = "<leader>gd"; action = "<cmd>Telescope lsp_definitions<cr>"; }
				# 	{mode = ["n"]; key = "<leader>gi"; action = "<cmd>Telescope lsp_implementations<cr>"; }
				# 	{mode = ["n"]; key = "<leader>go"; action = "<cmd>Telescope lsp_type_definitions<cr>"; }
				#
				# 	{mode = ["n"]; key = "<leader>gr"; action = "<cmd>Telescope lsp_references<cr>"; }
				# ];
			};
		};
		# keymaps = [
		# 	{mode = ["n"]; key = "<leader>gd"; action = "<cmd>Telescope lsp_definitions<cr>"; }
		# 	{mode = ["n"]; key = "<leader>gi"; action = "<cmd>Telescope lsp_implementations<cr>"; }
		# 	{mode = ["n"]; key = "<leader>go"; action = "<cmd>Telescope lsp_type_definitions<cr>"; }
		#
		# 	{mode = ["n"]; key = "<leader>gr"; action = "<cmd>Telescope lsp_references<cr>"; }
		# ];
		highlightOverride = {
			LspInfoBorder.fg = "#ffffff";
		};
	};
}
