{
  description = "Home Manager configuration of myc0plasmus";

  inputs = {
    # Specify the source of Home Manager and Nixpkgs.
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
	polybar-spotify = {
	  url = "github:PrayagS/polybar-spotify";
	  flake = false;
	};
    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { nixpkgs, home-manager, polybar-spotify, nixvim, ... }@inputs:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
    in {
      homeConfigurations."${(import ./user.nix).home_username}" = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
		
		extraSpecialArgs = { inherit inputs; home_username = (import ./user.nix).home_username; };
        # Specify your home configuration modules here, for example,
        # the path to your home.nix.
        modules = [ ./home.nix ];

        # Optionally use extraSpecialArgs
        # to pass through arguments to home.nix
      };
    };
}
