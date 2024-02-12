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
  };
  outputs = { self, nixpkgs, hm, stylix, ... }@inputs:
    let
      pkgs = nixpkgs.legacyPackages.x86_64-linux.pkgs;
      system = "x86_64-linux";
      specialArgs = inputs // {
        user = "exform";
        email = "mmillwood256@gmail.com";
        version = "23.11";
      };
    in {
      nixosConfigurations."${specialArgs.user}" = nixpkgs.lib.nixosSystem {
        inherit system specialArgs;
        modules = [
          ./config/nixos/configuration.nix
          ./config/home/home.nix
          hm.nixosModules.home-manager
          stylix.nixosModules.stylix
        ];
      };
      devShells.x86_64-linux.default =
        with pkgs; mkShell {
          packages = [
            # nixd
            nil
            nixfmt
          ];
        };
    };
}

