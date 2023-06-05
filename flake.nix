{
  inputs = {
    nixpkgs = { url = "github:nixos/nixpkgs/nixos-unstable"; };
    hm = {
      url = "github:nix-community/home-manager/";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    lspconfig = {
      type = "github";
      owner = "neovim";
      repo = "nvim-lspconfig";
      flake = false;
    };
  };
  outputs = { self, nixpkgs, hm, ... }@inputs:
    let pkgs = nixpkgs.legacyPackages.x86_64-linux.pkgs;
    in {
      nixosConfigurations.exform = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = inputs // {
          user = "exform";
          email = "mmillwood256@gmail.com";
          version = "23.05";
          theme = import ./config/util/theme.nix;
        };
        modules = [
          ./config/nixos/configuration.nix
          hm.nixosModules.home-manager
        ];
      };
      devShells.x86_64-linux.default =
        pkgs.mkShell { buildInputs = with pkgs; [ nixfmt nil ]; };
    };
}

# nix repl
# :lf .
# inputs.<tab>