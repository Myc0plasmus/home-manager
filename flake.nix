{
  description = "Home Manager basic configuration of myc0plasmus";

  inputs = {
    # Specify the source of Home Manager and Nixpkgs.
    nixpkgs.url = "github:/nixos/nixpkgs?ref=nixos-unstable";
    # home-manager = {
    #   url = "github:nix-community/home-manager";
    #   inputs.nixpkgs.follows = "nixpkgs";
    # };
  };

  outputs = inputs:
    {
      homeModule = {home_username, modules, dev, config, pkgs, lib, ...}:
      import ./home.nix {
        inherit home_username modules dev config pkgs lib inputs;
      };
    };
}
