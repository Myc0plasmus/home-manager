{ config,inputs , pkgs, ... }:

{
	programs.nixvim = {
		extraPlugins = with pkgs.vimPlugins; [
			suda-vim
		];

	};
}
