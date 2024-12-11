{ pkgs, user, lib, ... }: {
  services = {
    xserver = {
      enable = true;
      videoDrivers = [ "amdgpu" ];
    };
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
      enable = false;
      # alsa.enable = true;
      # alsa.support32Bit = true;
      # pulse.enable = true;
      # extraConfig = {
      #   "pipewire/pipewire.conf.d/92-low-latency.conf".text = ''
      #     context.properties = {
      #       default.clock.rate = 48000
      #       default.clock.quantum = 32
      #       default.clock.min-quantum = 32
      #       default.clock.max-quantum = 32
      #     }
      #   '';
      # };
    };
  };
}
