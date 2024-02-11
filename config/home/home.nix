{ pkgs, user, version, stylix, hyprland, ... }: {
  home-manager = {
    # why do I need to do this???
    sharedModules = [{ stylix.targets.vim.enable = false; }];
    useGlobalPkgs = true;
    users."${user}" = { config, ... }: {
      imports = [ ./programs/programs.nix ];
      #imports = [
        # stylix.homeManagerModules.stylix
      #];
      home = { stateVersion = version; };
    };
  };
}
