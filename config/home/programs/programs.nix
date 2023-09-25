{ user, pkgs, ... }: {
  imports = [ ./waybar.nix ./git.nix ./zsh.nix ./kitty.nix ./nvim.nix ];
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
      # config.theme = theme.bat-theme;
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
    rofi = {
      enable = true;
      package = pkgs.rofi-wayland.override { plugins = [ ]; };
    };
    wofi.enable = true;
    ripgrep.enable = true;
    firefox.enable = true;
    google-chrome.enable = true;
    jq.enable = true;
    lf.enable = true;
    helix.enable = true;
    # spotify.enable = true;
    # mako.enable = true;
    # fd.enable = true;
    # neofetch.enable = true;
    # tldr.enable = true;

  };
}
