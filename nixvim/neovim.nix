{ config,inputs , pkgs, ... }:

let
  getConfig = str: ./plugSetup/${str};
in
{
  imports = [
	(getConfig "nvim-tree.nix")
	(getConfig "telescope.nix")
	# (getConfig "toggleterm.nix")
	# (getConfig "toggleterm.nix")
	(getConfig "lsp.nix")
	(getConfig "which-key.nix")

  ];
  programs.nixvim = {
	enable = true;
	enableMan = true;
	extraConfigLuaPre = builtins.readFile ./options.lua;
	extraConfigLua = builtins.readFile ./mappings.lua;
	clipboard.providers.xclip.enable = true;
	
	# colorschemes.ayu.enable = true;
	colorschemes.base16 ={
	enable = true;
		colorscheme = "primer-dark";
	};
	plugins = {
		lualine.enable = true;
		comment.enable = true;
		# treesitter.enable = true;
		marks.enable = true;
		gitsigns.enable = true;
	};
  };
}
