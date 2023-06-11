{ user, version, ... }: {
  imports = [ ./packages.nix ./programs/programs.nix ];
  home-manager = {
    sharedModules = [{
      stylix.targets.vim.enable = false;
      # wayland.windowManager.hyprland = {
      #   enable = true;
      #   extraConfig = ''
      #     bind = SUPER, Return, exec, kitty
      #   '';
      # };
    }];
    useGlobalPkgs = true;
    users."${user}" = {
      # wayland.windowManager.hyprland = {
      #   enable = true;
      #   hyprland.extraConfig = ''
      #     bind = SUPER, Return, exec, kitty
      #   '';
      # };
      home = {
        stateVersion = version;
        # home.file.".config/nvim/init.lua".source = ./nvim/init.lua;
        # home.file.".config/kitty/startup.conf".source = ./kitty-startup.conf;
      };
      # xdg.configFile.nvim = {
      #   source = ./nvim;
      #   recursive = true;
      # };
    };
  };
}

# If you want to configure Firefox (consult Home Manager's docs for options):
# programs.firefox.enable = true;

# If you don't want to configure Firefox:
# home.packages = with pkgs; [ firefox ];
