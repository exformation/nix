{ user, pkgs, neovim, ... }: {
  imports = [ ./bar.nix ./git.nix ./shell.nix ./term.nix ];
  home-manager.users."${user}".programs = {
    neovim = {
      enable = true;
      # package = neovim.packages.${pkgs.system}.default;
    };
    direnv = {
      enable = true;
      enableBashIntegration = true;
      nix-direnv.enable = true;
    };
    fzf = {
      enable = true;
      enableFishIntegration = true;
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
