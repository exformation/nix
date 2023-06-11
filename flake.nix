{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    hm = {
      url = "github:nix-community/home-manager/";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    stylix.url = "github:danth/stylix";
    # hyprland = {
    #   url = "github:hyprwm/Hyprland";
    #   inputs.nixpkgs.follows = "nixpkgs";
    # };
    # neovim = {
    #   url = "github:neovim/neovim?dir=contrib";
    #   inputs.nixpkgs.follows = "nixpkgs";
    # };
  };
  outputs = { self, nixpkgs, hm, stylix, ... }@inputs:
    let
      pkgs = nixpkgs.legacyPackages.x86_64-linux.pkgs;
      system = "x86_64-linux";
      args = {
        user = "exform";
        email = "mmillwood256@gmail.com";
        version = "23.05";
      };
    in {
      nixosConfigurations.exform = nixpkgs.lib.nixosSystem {
        inherit system; 
        specialArgs = inputs // args;
        modules = [
          ./config/nixos/configuration.nix
          hm.nixosModules.home-manager
          stylix.nixosModules.stylix
        ];
      };
      devShells.x86_64-linux.default =
        # TODO: nixd can complete packages
        pkgs.mkShell { buildInputs = with pkgs; [ nixfmt nil ]; };
    };
}

# nix repl
# :lf .
# inputs.<tab>
