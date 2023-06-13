{ user, version, stylix, hyprland, ... }: {
  imports = [ ./packages.nix ./programs/programs.nix ];
  home-manager = {
    sharedModules = [{ stylix.targets.vim.enable = false; }];
    useGlobalPkgs = true;
    users."${user}" = {config, ...}: {
      imports = [
        # why doesn't this work for stylix? says things are already set
        # stylix.homeManagerModules.stylix
        hyprland.homeManagerModules.default
      ];
      # stylix.targets.vim.enable = false;
      wayland.windowManager.hyprland = {
        enable = true;
        extraConfig = builtins.readFile ./hypr.conf;
      };
      home = {
        stateVersion = version;
      };
      xdg.configFile.nvim = {
        source = config.lib.file.mkOutOfStoreSymlink /home/${user}/repos/nvim;
        recursive = true;
      };
    };
  };
}

# If you want to configure Firefox (consult Home Manager's docs for options):
# programs.firefox.enable = true;

# If you don't want to configure Firefox:
# home.packages = with pkgs; [ firefox ];
