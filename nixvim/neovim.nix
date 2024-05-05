{ config,inputs , pkgs, ... }:

{
  imports = [
	./nvim-tree.nix
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
		treesitter.enable = true;
		which-key.enable = true;
	};
  };
}
