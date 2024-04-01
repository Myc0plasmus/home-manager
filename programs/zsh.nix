{ config, pkgs, ...}:

{
  home.packages = [
	#shells
	# zsh
    oh-my-zsh
	thefuck

	#terminal utils
	htop
	nethogs
	man-db
	man-pages
	tmux
	porsmo
  ];
  programs.zsh = { 
    enable = true;
    syntaxHighlighting.enable = true;
    autosuggestions.enable = true;
    enableCompletion = true;
    ohMyZsh = {
      enable = true;
      theme = "mh";
      plugins = [ "git" "thefuck" ];
    };
 #    loginShellInit = ''
 #    if test $(id --user $USER) -ge 1000 && test $(tty) = "/dev/tty1" 
	# then
 #      sway # -c /etc/nixos/dotfiles/sway/sway-config
 #    fi
 #    '';
  };
}
