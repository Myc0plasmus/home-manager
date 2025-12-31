{
  description = "Home Manager basic configuration of myc0plasmus";

  inputs = {
    nixpkgs.url = "github:/nixos/nixpkgs?ref=nixos-unstable"; # Technically this is not needed
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = 
    {
      home-manager,
      ...
    }@inputs:
    let

    in
    {
      homeModule = {home_username, modules, dev, ...}:
      {
        imports = [
          home-manager.nixosModules.home-manager
        ];
        home-manager.useGlobalPkgs = true;
        home-manager.useUserPackages = true;
        home-manager.extraSpecialArgs = {
          inherit home_username modules dev inputs;
        };
        home-manager.users."${home_username}" = ./home.nix;
      };
    };
}
