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
      url = "github:hyprwm/Hyprland?rev=34d845da13711ffdc4fdd5409f36dcc7e79fd676"; #good
      # url = "github:hyprwm/Hyprland?rev=d2a8b8c2de91b748f0c03ef36ecc3e2b7e4fceab"; #good
      # url = "github:hyprwm/Hyprland?rev=2e323a56716e7ac8f391579857a06d424bbed59b"; #good
      # url = "github:hyprwm/Hyprland?rev=833d73df09ee8925b7b4f5592611ad320b25e363"; #bad
      # url = "github:hyprwm/Hyprland?rev=7091d4e5979720ddb30f540b2d7da48080bf2487"; #good
      # url = "github:hyprwm/Hyprland?rev=3a1496b4ebc6f66eb85e509d2e1e90ee989b47bc"; #good
      # url = "github:hyprwm/Hyprland?rev=a3e1e5e8baaa805a84aa6274904cdc48aafe2374"; #good
      # url = "github:hyprwm/Hyprland?rev=ff598b0827ca179c57ff2e97806cd65b69374699"; #good
      # url = "github:hyprwm/Hyprland?rev=23eda1411b2dc990a159b64ad73ac182d12fb4f9"; #bad
      # url = "github:hyprwm/Hyprland";
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
          # hyprland.nixosModules.default
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
