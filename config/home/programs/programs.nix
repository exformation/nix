{ pkgs, user, theme, lspconfig, ... }@inputs: {
  imports = [ ./git.nix ./zsh.nix ./kitty.nix ./nvim.nix ];
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
    exa = {
      enable = true;
      git = true;
      icons = true;
      extraOptions = [
        "--long"
        "--header"
        "--group-directories-first"
        "--sort=modified"
        "--reverse"
      ];
    };
  };
}
