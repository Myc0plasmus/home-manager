{
  description = "Home Manager basic configuration of myc0plasmus";

  inputs = {
    # nixpkgs.url = "github:/nixos/nixpkgs?ref=nixos-unstable"; # Technically this is not needed
  };

  outputs = inputs:
    {
      homeModule = {home_username, modules, dev, config, pkgs, lib, ...}:
      import ./home.nix {
        inherit home_username modules dev config pkgs lib inputs;
      };
    };
}
