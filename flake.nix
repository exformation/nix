# nixos-rebuild switch --flake '/home/exform/nix#exform'
{
  inputs = {
    nixpkgs = {
      url = "github:nixos/nixpkgs/nixos-unstable";
    };
    home-manager = {
      url = "github:nix-community/home-manager/";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    neovim = {
      url = "github:neovim/neovim?dir=contrib";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };
  outputs = { self, nixpkgs, home-manager, ... } @ inputs: {
    nixosConfigurations.exform = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      specialArgs = inputs // {
        user = "exform";
        email = "mmillwood256@gmail.com";
        version = "23.05";
      };
      modules = [
        ./config/nixos/configuration.nix
        home-manager.nixosModules.home-manager
      ];
    };
  };
}