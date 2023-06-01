{ inputs }: {
  useGlobalPkgs = true;
  users."${inputs.user}" = {
    home.stateVersion = inputs.version;
    # home.file.".config/nvim/init.lua".source = ./nvim/init.lua;
    # xdg.configFile.nvim = {
    #   source = ./nvim;
    #   recursive = true;
    # };
    # home.file.".config/kitty/startup.conf".source = ./kitty-startup.conf;
    programs = {
      git = (import ./git.nix) { inherit inputs; };
      zsh = (import ./zsh.nix) { inherit inputs; };
      kitty = (import ./kitty.nix) { inherit inputs; };
      # neovim = (import ./nvim.nix) { inherit a; };
      direnv = {
        enable = true;
        enableZshIntegration = true;
        enableBashIntegration = true;
        nix-direnv.enable = true;
      };
      fzf = {
        enable = true;
        enableZshIntegration = true;
      };
      bat = {
        enable = true;
        config.theme = "base16";
      };
    };
  };
}
