{ user, pkgs, ... }: {
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
    waybar.enable = true;
    waybar.settings = {
      mainBar = {
        layer = "top";
        position = "top";
        height = 30;
        output = [ "eDP-1" "HDMI-A-1" ];
        modules-left = [ "sway/workspaces" "sway/mode" "wlr/taskbar" ];
        modules-center = [ "sway/window" "custom/hello-from-waybar" ];
        modules-right = [ "mpd" "custom/mymodule#with-css-id" "temperature" ];

        "sway/workspaces" = {
          disable-scroll = true;
          all-outputs = true;
        };
        "custom/hello-from-waybar" = {
          format = "hello {}";
          max-length = 40;
          interval = "once";
          exec = pkgs.writeShellScript "hello-from-waybar" ''
            echo "from within waybar"
          '';
        };
      };
    };
    # spotify.enable = true;
    # mako.enable = true;
    # fd.enable = true;
    # neofetch.enable = true;
    # tldr.enable = true;

  };
}
