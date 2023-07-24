{
  inputs = {
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
    hyprland = {
      url = "github:hyprwm/Hyprland?rev=f6b340cc19d2b1fdca0ae2e72a18c87c63893507";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    # discord-bot = {
    #   url = "github:exformation/discord-bot";
    #   inputs.nixpkgs.follows = "nixpkgs";
    # };
    # pedd = {
    #   url = "github:exformation/pedd";
    #   inputs.nixpkgs.follows = "nixpkgs";
    # };
  };
  outputs = { self, nixpkgs, hm, stylix, hyprland, ... }@inputs:
    let
      pkgs = nixpkgs.legacyPackages.x86_64-linux.pkgs;
      system = "x86_64-linux";
      specialArgs = inputs // {
        user = "exform";
        email = "mmillwood256@gmail.com";
        version = "23.05";
      };
    in {
      nixosConfigurations."${specialArgs.user}" = nixpkgs.lib.nixosSystem {
        inherit system specialArgs;
        modules = [
          ./config/nixos/configuration.nix
          ./config/home/home.nix
          hm.nixosModules.home-manager
          stylix.nixosModules.stylix
          hyprland.nixosModules.default
        ];
      };
      devShells.x86_64-linux.default =
        # TODO: nixd can complete packages
        pkgs.mkShell {
          buildInputs = with pkgs; [
            # nix
            nil
            nixfmt
            # bash
            nodePackages.bash-language-server
            shellcheck
            shfmt
          ];
        };
    };
}

# nix repl
# :lf .
# inputs.<tab>
