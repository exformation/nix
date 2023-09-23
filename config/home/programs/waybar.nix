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
          "temperature"
          "pulseaudio"
          "backlight"
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
        };
        "battery" = {
          interval = 60;
          states = {
            "warning" = 30;
            "critical" = 15;
          };
          format = "{capacity}% {icon}";
          format-icons = [ "" "" "" "" "" ];
          max-length = 25;
        };
        "backlight" = {
          format = "{percent}% {icon}";
          format-icons = [ "" "" ];
        };
        "clock" = {
          interval = 60;
          format = "{:%I:%M}";
          max-length = 25;
        };
        "pulseaudio" = {
          format = "{volume}% {icon}";
          format-bluetooth = "{volume}% {icon}";
          format-muted = "";
          format-icons = {
            "headphone" = "";
            "hands-free" = "";
            "headset" = "";
            "phone" = "";
            "portable" = "";
            "car" = "";
            "default" = [ "" "" ];
          };
          scroll-step = 1;
          on-click = "pavucontrol";
          ignored-sinks = [ "Easy Effects Sink" ];
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
    style = ''
      #temperature, #pulseaudio, #backlight, #battery, #clock, #network, #bluetooth {
        border-right: 1px solid white;
        border-left: 1px solid white;
        padding: 0 10;
      }
      #battery.critical {
        color: #e06c75;
      }
    '';
  };
}
