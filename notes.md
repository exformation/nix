discord-bot = {
  url = "github:exformation/discord-bot";
  inputs.nixpkgs.follows = "nixpkgs";
};
pedd = {
  url = "github:exformation/pedd";
  inputs.nixpkgs.follows = "nixpkgs";
};

# nix repl
# :lf .
# inputs.<tab>

wl-paste -t text --watch clipman store --no-persist

bind = ,XF86AudioLowerVolume, exec, pamixer -d 5 && hyprctl notify -1 1000 "rgb(ff1ea3)" $(pamixer --get-volume)
bind = ,XF86AudioRaiseVolume, exec, pamixer -i 5 && hyprctl notify -1 1000 "rgb(ff1ea3)" $(pamixer --get-volume)
bind = ,XF86AudioMute, exec, pamixer --toggle-mute && hyprctl notify -1 1000 "rgb(ff1ea3)" $([ $(pamixer --get-mute) = "true" ] && echo "muted" || echo "unmuted")
bind = ,XF86MonBrightnessDown, exec, brightnessctl set 5%- && hyprctl notify -1 1000 "rgb(ff1ea3)" $(brightnessctl get) 
bind = ,XF86MonBrightnessUp, exec, brightnessctl set +5% && hyprctl notify -1 1000 "rgb(ff1ea3)" $(brightnessctl get) 
bind = ,Print, exec, grim - | wl-copy -t imae/png

"$mod SHIFT, P, exec, clipman pick -t rofi"

let
    repos = [
      "nix"
      # "pedd"
      # "pedd-config"
      "nvim"
      # "journal"
      # "lacuna"
      # "tutoring"
      # "discord-bot"
      # "osu"
      # "nvim-iobuffers"
      # "qmk_firmware"
      # "layout-analysis"
      # "nvim-quicktree"
      # "epsilon"
      # "nixpkgs"
    ];
    # TODO: replace zsh and nvim with SHELL and EDITOR
    process = repo: ''
      ${if repo != "nix" then "new_os_window" else ""}
      os_window_class ${repo}
      new_tab ${repo}
      cd ~/repos/${repo}
      launch --title ${repo} direnv exec . zsh
      launch --title ${repo} direnv exec . nvim

    '';
    startup = builtins.toFile "startup.conf"
      (builtins.concatStringsSep "\n" (map process repos));
  in 


      # xdg.configFile.nvim = {
        # source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/repos/nvim";
        # recursive = true;
      # };


# If you want to configure Firefox (consult Home Manager's docs for options):
# programs.firefox.enable = true;

# If you don't want to configure Firefox:
# home.packages = with pkgs; [ firefox ];

{ user, ... }: {
  home-manager.users."${user}".services = {
    mako.enable = true;
    dunst.enable = true;
    clipman.enable = true;
  };
}


  # systemd.services.discord-bot = {
  #   description = "Discord Bot";
  #   after = [ "network.target" ];
  #   wantedBy = [ "multi-user.target" ];
  #   serviceConfig = {
  #     User = user;
  #     WorkingDirectory = "/home/${user}/repos/discord-bot";
  #     ExecStart = lib.getExe discord-bot.packages.${pkgs.system}.default;
  #   };
  # };

  # systemd.services.pedd = {
  #   description = "Programmable Event Device Daemon";
  #   wantedBy = [ "default.target" ];
  #   after = [ "graphical-session.target" ];
  #   serviceConfig = {
  #     User = user;
  #     WorkingDirectory = "/home/${user}/repos/pedd-config";
  #     ExecStart = lib.getExe pedd.packages.${pkgs.system}.default;
  #   };
  # };
}

