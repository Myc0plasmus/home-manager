{ config,inputs , pkgs, ... }:

let
	toLua = str: "lua << EOF\n${str}\nEOF\n";
	toLuaFile = file: "lua << EOF\n${builtins.readFile file}\nEOF\n";
in
{
	programs.nixvim = {
		extraPlugins = with pkgs.vimPlugins; [
			asyncrun-vim
			asynctasks-vim
			{
				plugin = telescope-asynctasks-nvim;
			}
		];
		keymaps = [
			{mode = ["n"]; key = "<leader>rt"; action = "<cmd>Telescope asynctasks all<cr>"; }
		];

	};
}
