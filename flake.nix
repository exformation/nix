{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    hm = {
      url = "github:nix-community/home-manager/";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    # hyprland = {
    #   url = "github:hyprwm/Hyprland";
    #   inputs.nixpkgs.follows = "nixpkgs";
    # };
    # neovim = {
    #   url = "github:neovim/neovim?dir=contrib";
    #   inputs.nixpkgs.follows = "nixpkgs";
    # };
  };
  outputs = { self, nixpkgs, hm, ... }@inputs:
    let
      pkgs = nixpkgs.legacyPackages.x86_64-linux.pkgs;
      system = "x86_64-linux";
      args = {
        user = "exform";
        email = "mmillwood256@gmail.com";
        version = "23.05";
        theme = import ./config/util/theme.nix;
      };
    in {
      nixosConfigurations.exform = nixpkgs.lib.nixosSystem {
        system = system;
        specialArgs = inputs // args;
        modules = [
          ./config/nixos/configuration.nix
          hm.nixosModules.home-manager

          # inputs.hyprland.nixosModules.default
          # { programs.hyprland.enable = false; }
        ];
      };
      # homeConfigurations."${args.user}@nixos" = hm.lib.homeManagerConfiguration {
      #   pkgs = pkgs;
      #   modules = [
      #     inputs.hyprland.homeManagerModules.default
      #     { wayland.windowManager.hyprland.enable = false; }
      #   ];
      # };
      devShells.x86_64-linux.default =
        # TODO: nixd can complete packages
        pkgs.mkShell { buildInputs = with pkgs; [ nixfmt nil ]; };
    };
}

# nix repl
# :lf .
# inputs.<tab>
