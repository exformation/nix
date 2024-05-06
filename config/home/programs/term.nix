{ lib, user, ... }: {
  home-manager.users."${user}".programs = {
    kitty = with builtins;
      with lib.lists;
      let
        repos = [
          [ "v" ".config/nvim" ]
          [ "p" "repos/nvim-plugins/prsr.nvim" ]
          [ "o" "repos/osu" ]
          [ "r" "repos/osu-rulesets" ]
          [ "n" "repos/nix" ]
          [ "q" "repos/qmk_firmware" ]
          [ "l" "repos/lacuna" ]
          [ "b" "bevy" ]
        ];
        process = repo: ''
          new_tab ${baseNameOf (last repo)}
          cd ~/${last repo}
          launch fish
        '';
        startup =
          toFile "startup.conf" (concatStringsSep "\n" (map process repos));
        binds = listToAttrs (imap0 (i: repo: {
          name = "alt+${head repo}";
          value = "goto_tab ${toString (1 + i)}";
        }) repos);
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
          "alt+e" = "goto_tab 99";
        } // binds;
        settings = {
          allow_remote_control = true;
          confirm_os_window_close = "0";
          enabled_layouts = "stack";
          tab_bar_edge = "top";
          tab_bar_style = "slant";
          startup_session = startup;
          clear_all_shortcuts = true;
        };
        shellIntegration.enableFishIntegration = true;
      };
  };
}
