# nixos-rebuild switch --flake '/home/exform/nix#exform'
# TODO: add theming back now that you understand modules
# TODO: make this a shell with access to nixfmt, nil, etc. for development
{
  inputs = {
    nixpkgs = { url = "github:nixos/nixpkgs/nixos-unstable"; };
    home-manager = {
      url = "github:nix-community/home-manager/";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    neovim = {
      url = "github:neovim/neovim?dir=contrib";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };
  outputs = { self, nixpkgs, home-manager, ... }@inputs:
    let pkgs = nixpkgs.legacyPackages.x86_64-linux.pkgs;
    in {
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
      devShells.x86_64-linux.default =
        pkgs.mkShell { buildInputs = with pkgs; [ nixfmt nil ]; };
    };
}
