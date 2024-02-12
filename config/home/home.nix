{ pkgs, user, version, ... }: {
  imports = [ ./programs/programs.nix ./wayland.nix ];
  home-manager = {
    useGlobalPkgs = true;
    users."${user}" = {
      stylix.targets.vim.enable = false;
      home = { stateVersion = version; };
    };
  };
}
