{
  description = "Home Manager configuration of myc0plasmus";

  inputs = {
    # Specify the source of Home Manager and Nixpkgs.
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.11";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    polybar-spotify = {
      url = "github:PrayagS/polybar-spotify";
      flake = false;
    };
    polybar-calendar = {
      url = "github:nevarman/polybar-calendar";
      flake = false;
    };
    polybar-scripts = {
      url = "github:/polybar/polybar-scripts";
      flake = false;
    };
    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    stylix = {
      url = "github:danth/stylix";
    };
  };

  outputs =
    {
      nixpkgs,
      home-manager,
      polybar-spotify,
      polybar-scripts,
      polybar-calendar,
      nixvim,
      stylix,
      ...
    }@inputs:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
    in
    {
      homeConfigurations."${(import ./user.nix).home_username}" =
        home-manager.lib.homeManagerConfiguration
          {
            inherit pkgs;

            extraSpecialArgs = {
              inherit inputs;
              home_username = (import ./user.nix).home_username;
              dev = (import ./user.nix).home_username;
            };
            # Specify your home configuration modules here, for example,
            # the path to your home.nix.
            modules = [
              ./home.nix
              stylix.homeManagerModules.stylix
            ];

            # Optionally use extraSpecialArgs
            # to pass through arguments to home.nix
          };
    };
}
