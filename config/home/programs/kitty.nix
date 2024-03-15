{ user, ... }: {
  home-manager.users."${user}".programs = {
    kitty = let
      repos = [
        ".config/nvim"
        "repos/nvim-plugins"
        "repos/osu"
        "repos/osu-rulesets"
        "repos/nix"
        "repos/qmk_firmware"
        "repos/lacuna"
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
        # https://sw.kovidgoyal.net/kitty/actions
        "ctrl+shift+c" = "copy_to_clipboard";
        "ctrl+shift+v" = "paste_from_clipboard";
        "alt+shift+j" = "next_tab";
        "alt+shift+k" = "previous_tab";
        "alt+enter" = "new_tab";
        "alt+x" = "close_tab";
        "alt+b" = "goto_tab 0";
        "alt+v" = "goto_tab 1";
        "alt+p" = "goto_tab 2";
        "alt+o" = "goto_tab 3";
        "alt+r" = "goto_tab 4";
        "alt+n" = "goto_tab 5";
        "alt+q" = "goto_tab 6";
        "alt+l" = "goto_tab 7";
        "alt+e" = "goto_tab 99";
      };
      settings = {
        allow_remote_control = true;
        confirm_os_window_close = "0";
        enabled_layouts = "stack";
        tab_bar_edge = "top";
        tab_bar_style = "slant";
        startup_session = startup;
        clear_all_shortcuts = true;
      };
    };
  };
}
