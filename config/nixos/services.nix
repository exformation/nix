{ pkgs, user, lib, hyprland, discord-bot, ... }: {
  services = {
    greetd = {
      enable = true;
      settings = rec {
        initial_session = {
          inherit user;
          command = lib.getExe hyprland.packages.${pkgs.system}.default;
        };
        default_session = initial_session;
      };
    };
    gnome.gnome-keyring.enable = true;
    # pcscd.enable = true;
    blueman.enable = true;
    printing.enable = true;
    # disabled for now but leaving for an exmaple 
    xserver = {
      enable = false;
      layout = "us";
      xkbVariant = "";
      libinput.enable = true;
      windowManager = {
        awesome = {
          enable = true;
          luaModules = with pkgs.luaPackages;
            [
              luarocks
              # lain
              # luadbi-mysql
            ];
        };
      };
      displayManager = {
        defaultSession = "none+awesome";
        autoLogin = {
          enable = true;
          user = "${user}";
        };
        # sessionCommands = "xkbset bo 50";
      };
    };
    pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
    };
  };

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
  #   description = "Programmable Event Device Layer";
  #   wantedBy = [ "default.target" ];
  #   after = [ "graphical-session.target" ];
  #   restartIfChanged = false;
  #   serviceConfig = {
  #     User = "${user}";
  #     WorkingDirectory = "/home/${user}/.config/pedd";
  #     ExecStart = "${pkgs.nix}/bin/nix run";
  #   };
  # };
}
