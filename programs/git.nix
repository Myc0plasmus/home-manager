{
  config,
  pkgs,
  ...
}:

{
  home.packages = [
    #git
    pkgs.git
    pkgs.git-lfs
    pkgs.hub
  ];
  programs.git = {
    enable = true;
    settings = {
      user = {
        name = "Myc0plasmus";
        email = "jablonski.natan@gmail.com";
      };
      aliases = {
        pu = "push";
        co = "checkout";
        cm = "commit";
      };
      extraConfig = {
        safe = {
          directory = [
            "/etc/nixos"
            "/etc/nixos/.git"
            "/etc/nixos/flakes/home-manager-config"
            "/etc/nixos/flakes/home-manager-config/.git"
            "/etc/nixos/flakes/i3-hm-module"
            "/etc/nixos/flakes/i3-hm-module/.git"
            "/etc/nixos/flakes/nixvim-hm-module"
            "/etc/nixos/flakes/nixvim-hm-module/.git"
          ];
        };
      };
    };
    
    lfs.enable = true;
  };
}
