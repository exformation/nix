{ pkgs, user, lib, ... }: {
  services = {
    greetd = {
      enable = true;
      settings = rec {
        initial_session = {
          command = "${pkgs.hyprland}/bin/Hyprland";
          user = "exform";
        };
        default_session = initial_session;
      };
    };
    gnome.gnome-keyring.enable = true;
    # pcscd.enable = true;
    blueman.enable = true;
    printing.enable = true;
    pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
    };
  };
}
