{ user, theme, ... }@inputs: {
  imports = [ ./git.nix ./zsh.nix ./kitty.nix ];
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
      config.theme = theme.bat-theme;
    };
  };
}
