{ config,inputs , pkgs, ... }:

{
  programs.nixvim = {
	enable = true;
	enableMan = true;
	extraFiles = {
		"options.lua"
		"mapping.lua"
	};
	extraConfigLua = ''
		require('options')
		require('mappings')

	'';
    };
  };
}
