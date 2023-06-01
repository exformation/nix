{ user, version, ... } @ inputs: {
  imports = [ ./git.nix ./zsh.nix ./kitty.nix ./programs.nix ];
  home-manager = {
    useGlobalPkgs = true;
    users."${user}" = {
      home = {
        stateVersion = version;
      };
      # home.file.".config/nvim/init.lua".source = ./nvim/init.lua;
      # xdg.configFile.nvim = {
      #   source = ./nvim;
      #   recursive = true;
      # };
      # home.file.".config/kitty/startup.conf".source = ./kitty-startup.conf;
    };
  };
}

# If you want to configure Firefox (consult Home Manager's docs for options):
# programs.firefox.enable = true;

# If you don't want to configure Firefox:
# home.packages = with pkgs; [ firefox ];