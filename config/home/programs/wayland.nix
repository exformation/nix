{ user, ... }: {
  home-manager.users."${user}" = {
    wayland = {
      windowManager.hyprland = {
        enable = true;
        systemd.enable = true;
        xwayland.enable = true;
        settings = {
          "$mod" = "SUPER";
          monitor=",1920x1080@240,auto,auto";
          windowrule = [
            "workspace 11 silent,^(Google Chrome)$"
            "workspace 12 silent,^(kitty)$"
          ];
          bind = [
            "$mod, Return, exec, kitty --session none"
            "$mod SHIFT, Q, killactive,"
            "$mod SHIFT, R, exec, rofi -show drun"
            "$mod SHIFT, S, exec, grim -g '$(slurp)' - | wl-copy -t image/png"
            "$mod SHIFT, F, fullscreen"
            "$mod, TAB, focuscurrentorlast"
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
            "$mod, F, workspace, 11"
            "$mod, J, workspace, 12"
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
          ];
          bindm = [
            "SUPER, mouse:272, movewindow"
            "SUPER, mouse:273, resizewindow"
          ];
          exec-once = [
            "waybar & kitty & google-chrome-stable"
          ];
          animations = {
            enabled = false;
          };
          general = {
            gaps_in = 0;
            gaps_out = 0;
          };
        };
      };
    };
  };
}
# TODO: pin chrome, organize wayland (not a program)
