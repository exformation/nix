{ pkgs, user, ... }: {
  services = {
    gnome.gnome-keyring.enable = true;
    blueman.enable = true;
    printing.enable = true;
    xserver = {
      enable = true;
      layout = "us";
      xkbVariant = "";
      libinput.enable = true;
      windowManager = {
        awesome = {
          enable = true;
          luaModules = with pkgs.luaPackages; [
            luarocks
            # lain
            luadbi-mysql
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

  # systemd.services.pedd = {
  #   description = "Programmable Event Device Layer";
  #   wantedBy = [ "default.target" ];
  #   after = [ "graphical-session.target" ];
  #   restartIfChanged = false;
  #   serviceConfig = {
  #     # Restart = "on-failure";
  #     # ExecStart = "${pkgs.kanata}/bin/kanata -c /home/${user}/.config/kanata/kanata.kbd";
  #     # ExecStart = "${pkgs.kanata}/bin/xkbset bo 50";
  #     ExecStart =
  #       "${pkgs.python310} /home/${user}/pedd/examples/tinkering/__init__.py";
  #   };
  # };
}
