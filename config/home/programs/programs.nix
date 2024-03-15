{ user, pkgs, neovim, ... }: {
  imports = [ ./waybar.nix ./git.nix ./zsh.nix ./kitty.nix ];
  home-manager.users."${user}".programs = {
    neovim = {
      enable = true;
      package = neovim.packages.${pkgs.system}.default;
    };
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
    bat = { enable = true; };
    eza = {
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
    ripgrep.enable = true;
    google-chrome.enable = true;
    jq.enable = true;
  };
}
