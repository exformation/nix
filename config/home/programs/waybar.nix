{ user, pkgs, ... }: {
  home-manager.users."${user}".programs.waybar = {
    enable = true;
    settings = {
      mainBar = {
        layer = "top";
        position = "top";
        height = 16;
        # margin = "20 5";
        modules-left = [ "hyprland/window" ];
        modules-center = [ "tray" ];
        modules-right = [
          "pulseaudio"
          "backlight"
          "temperature"
          "battery"
          "clock"
          "network"
          "bluetooth"
        ];
        "network" = {
          format = "{ifname}";
          format-wifi = "{essid} ({signalStrength}%) ";
          format-ethernet = "{ipaddr}/{cidr} ";
          format-disconnected = ""; # An empty format will hide the module.
          tooltip-format = "{ifname} via {gwaddr} ";
          tooltip-format-wifi = "{essid} ({signalStrength}%) ";
          tooltip-format-ethernet = "{ifname} ";
          tooltip-format-disconnected = "Disconnected";
          max-length = 50;
          padding = 10;
        };
        "battery" = {
          bat = "BAT2";
          interval = 60;
          states = {
            "warning" = 30;
            "critical" = 15;
          };
          format = "{capacity}% {icon}";
          format-icons = [ "" "" "" "" "" ];
          max-length = 25;
        };
        "clock" = { format-alt = "{:%a, %d. %b  %H:%M}"; };
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
    style = ''
      * {
        border: none;
        border-radius: 0;
        padding: 0 10;
      }
    '';
  };
}
