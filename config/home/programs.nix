{ user, ... }@inputs: {
  home-manager.users."${user}".programs = {
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
}
