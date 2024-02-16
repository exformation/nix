{ user, ... }: {
  home-manager.users."${user}".programs = {
    kitty = let
      repos = [ ".config/nvim" "repos/nix" "repos/lacuna" ];
      process = repo: ''
        new_tab ${repo}
        cd ~/${repo}
        launch --title ${repo} zsh
        launch nvim
      '';
      startup = builtins.toFile "startup.conf"
        (builtins.concatStringsSep "\n" (map process repos));
    in {
      enable = true;
      keybindings = {
        "alt+tab" = "next_tab";
        "alt+shift+tab" = "previous_tab";
      };
      settings = {
        allow_remote_control = true;
        confirm_os_window_close = "0";
        enabled_layouts = "stack";
        startup_session = startup;
      };
    };
  };
}
