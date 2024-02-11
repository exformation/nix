{ pkgs, user, lib, hyprland, discord-bot, ... }: {
  services = {
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
