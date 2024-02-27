{ user, ... }: {
  home-manager.users."${user}".programs = {
    kitty = let
      repos = [
        ".config/nvim"
        "repos/file-hints.nvim"
        "repos/ts-hints.nvim"
        "repos/nix"
        "repos/lacuna"
        "repos/osu"
        "repos/qmk_firmware"
      ];
      process = repo: ''
        new_tab ${builtins.baseNameOf repo}
        cd ~/${repo}
        launch zsh
      '';
      startup = builtins.toFile "startup.conf"
        (builtins.concatStringsSep "\n" (map process repos));
    in {
      enable = true;
      keybindings = {
        "alt+tab" = "next_tab";
        "alt+shift+tab" = "previous_tab";
        "alt+v" = "goto_tab 1";
        "alt+f" = "goto_tab 2";
        "alt+t" = "goto_tab 3";
        "alt+n" = "goto_tab 4";
        "alt+l" = "goto_tab 5";
        "alt+o" = "goto_tab 6";
        "alt+q" = "goto_tab 7";
      };
      settings = {
        allow_remote_control = true;
        confirm_os_window_close = "0";
        enabled_layouts = "stack";
        tab_bar_edge = "top";
        tab_bar_style = "slant";
        startup_session = startup;
      };
    };
  };
}
