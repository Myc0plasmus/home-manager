{ config, pkgs, ...}:

{
  home.packages = [
	#shells
	pkgs.zsh
    pkgs.oh-my-zsh
	pkgs.thefuck

	#terminal utils
	pkgs.htop
	pkgs.nethogs
	pkgs.man-db
	pkgs.man-pages
	pkgs.tmux
	pkgs.porsmo
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
