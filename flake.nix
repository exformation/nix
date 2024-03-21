{
  inputs = {
    # nixpkgs.url = "github:nixos/nixpkgs/23.05";
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    hm = {
      url = "github:nix-community/home-manager/";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    stylix = {
      url = "github:danth/stylix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    # neovim = {
    #   url = "github:neovim/neovim?dir=contrib";
    #   inputs.nixpkgs.follows = "nixpkgs";
    # };
  };
  outputs = { self, nixpkgs, hm, stylix, ... }@inputs:
    let
      personal = builtins.fromJSON (builtins.readFile ./../.env);
      specialArgs = inputs // personal;
    in {
      nixosConfigurations."${specialArgs.user}" = nixpkgs.lib.nixosSystem {
        inherit specialArgs;
        modules = [
          ./config/nixos/configuration.nix
          ./config/home/home.nix
          hm.nixosModules.home-manager
          stylix.nixosModules.stylix
        ];
      };
    };
}
