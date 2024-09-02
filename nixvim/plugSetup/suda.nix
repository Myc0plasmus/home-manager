{ config,inputs , pkgs, ... }:

{
	programs.nixvim = {
		extraPlugins = with pkgs.vimPlugins; [
			vim-suda
		];

	};
}
