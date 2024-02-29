{ user, ... }: {
  home-manager.users."${user}" = {
    wayland = {
      windowManager.hyprland = {
        enable = true;
        systemd.enable = true;
        xwayland.enable = true;
        settings = {
          "$mod" = "SUPER";
          monitor = ",1920x1080@240,auto,auto";
          windowrule = [
            "workspace 11 silent,^(main-terminal)$"
            "workspace 12 silent,^(steam)$"
            "workspace 13 silent,^(discord)$"
            "workspace 14 silent,title:^(.*)(Google Chrome)(.*)$"
            "workspace 15 silent,^(.*)(osu!)(.*)$"
          ];
          bind = [
            "$mod SHIFT, Escape, exec, systemctl suspend"
            "$mod SHIFT, Q, killactive,"
            "$mod SHIFT, R, exec, rofi -show drun"
            ''$mod SHIFT, S, exec, grim -g "$(slurp)" - | wl-copy -t image/png''
            "$mod SHIFT, F, fullscreen"
            "$mod, TAB, focuscurrentorlast"
            "$mod, Return, exec, kitty --session none"
            "$mod CTRL, Return, exec, kitty --session main-terminal"
            "$mod, 1, workspace, 1"
            "$mod, 2, workspace, 2"
            "$mod, 3, workspace, 3"
            "$mod, 4, workspace, 4"
            "$mod, 5, workspace, 5"
            "$mod, 6, workspace, 6"
            "$mod, 7, workspace, 7"
            "$mod, 8, workspace, 8"
            "$mod, 9, workspace, 9"
            "$mod, 0, workspace, 10"
            "$mod, A, workspace, 11"
            "$mod, S, workspace, 12"
            "$mod, D, workspace, 13"
            "$mod, F, workspace, 14"
            "$mod, O, workspace, 15"
            "$mod SHIFT, 1, movetoworkspace, 1"
            "$mod SHIFT, 2, movetoworkspace, 2"
            "$mod SHIFT, 3, movetoworkspace, 3"
            "$mod SHIFT, 4, movetoworkspace, 4"
            "$mod SHIFT, 5, movetoworkspace, 5"
            "$mod SHIFT, 6, movetoworkspace, 6"
            "$mod SHIFT, 7, movetoworkspace, 7"
            "$mod SHIFT, 8, movetoworkspace, 8"
            "$mod SHIFT, 9, movetoworkspace, 9"
            "$mod SHIFT, 0, movetoworkspace, 10"
            "$mod, l, movefocus, l"
            "$mod, h, movefocus, r"
            "$mod, k, movefocus, u"
            "$mod, j, movefocus, d"
          ];
          bindm =
            [ "SUPER, mouse:272, movewindow" "SUPER, mouse:273, resizewindow" ];
          exec-once = [
            "waybar & kitty --title 'main-terminal' & google-chrome-stable & discord & steam"
            "hyprctl dispatch workspace 11"
          ];
          animations = { enabled = false; };
          general = {
            gaps_in = 0;
            gaps_out = 0;
            border_size = 1;
            no_cursor_warps = true;
          };
          misc = { disable_hyprland_logo = true; };
        };
      };
    };
  };
}
