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
}
