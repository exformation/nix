# nixos-rebuild switch --flake '/home/exform/nix#exform'
# TODO: firefox login, bookmarks, tabs, extensions

{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
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
        ./config/configuration.nix
        home-manager.nixosModules.home-manager
      ];
    };
  };
}



# nixos-rebuild switch --flake '/home/exform/nix#exform'
# TODO: firefox login, bookmarks, tabs, extensions
# {
#   inputs = {
#     nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable"; #/nixos-22.05 /nixos-unstable
#     home-manager = {
#       url = "github:nix-community/home-manager/"; #/release-22.05 /
#       inputs.nixpkgs.follows = "nixpkgs";
#     };
#     # neovim = {
#     #   url = "github:neovim/neovim?dir=contrib";
#     #   # inputs.nixpkgs.follows = "nixpkgs";
#     # };
#   };
#   # TODO: use a HM flake instead of a nixosSystem flake?
#   # TODO: manage style more cleanly
#   outputs = { self, nixpkgs, home-manager, ... }@attrs: {

#     # nixosModules = import ./nixos/modules inputs;

#     nixosConfigurations.exform = nixpkgs.lib.nixosSystem {
#       system = "x86_64-linux";
#       specialArgs = attrs // {
#         user = "exform";
#         email = "mmillwood256@gmail.com";
#         version = "23.05";
#         style = (import ./config/style.nix) { lib = self.lib; };
#       };
#       modules = [
#         ./config/configuration.nix
#         home-manager.nixosModules.home-manager
#       ];
#     };
#   };
# }
