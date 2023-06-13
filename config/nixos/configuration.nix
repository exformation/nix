{ pkgs, user, version, ... }: {
  imports =
    [ ./hardware-configuration.nix ./stylix.nix ./packages.nix ./services.nix ];

  sound = { enable = true; };
  hardware = {
    pulseaudio.enable = false;
    bluetooth.enable = true;
    opengl.enable = true;
    uinput.enable = true;
  };
  boot = {
    loader = {
      timeout = 5;
      systemd-boot.enable = true;
      efi = {
        canTouchEfiVariables = true;
        efiSysMountPoint = "/boot/efi";
      };
    };
  };
  networking = {
    hostName = "nixos";
    networkmanager.enable = true;
    useDHCP = false;
  };
  time = { timeZone = "America/Chicago"; };
  i18n = { defaultLocale = "en_US.utf8"; };
  security = {
    rtkit.enable = true;
    sudo.wheelNeedsPassword = false;
  };
  # sudo nmcli dev wifi connect "..." password "..."
  users = {
    defaultUserShell = pkgs.zsh;
    users."${user}" = {
      isNormalUser = true;
      # TODO: only active during flutter development? 
      # TODO: only active for pedd user?
      extraGroups = [ "networkmanager" "wheel" "adbusers" "input" "uinput" ];
    };
  };
  programs = {
    # adb.enable = true;
    zsh.enable = true;
    # gnupg.agent = {
    #   enable = true;
    #   pinentryFlavor = "curses";
    #   enableSSHSupport = true;
    # };
    hyprland = {
      enable = true;
      xwayland = {
        enable = true;
        hidpi = true;
      };
      nvidiaPatches = false;
    };
  };
  nixpkgs = { config.allowUnfree = true; };
  environment = {
    variables = {
      EDITOR = "nvim";
      VISUAL = "nvim";
      TERMINAL = "kitty";
      SHELL = "zsh";
      PAGER = "less";
      BROWSER = "firefox";
    };
    shells = with pkgs; [ zsh ];
  };
  fonts.fonts = with pkgs; [
    noto-fonts
    noto-fonts-cjk
    noto-fonts-emoji
    (nerdfonts.override { fonts = [ "FiraCode" ]; })
  ];
  nix = {
    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 7d";
    };
    package = pkgs.nixVersions.unstable;
    extraOptions = ''
      experimental-features = nix-command flakes
    '';
    settings = {
      auto-optimise-store = true;
      # if you use a cache like cachix, hyperland's input should follow nixpkgs in the flake
      # substituters = ["https://hyprland.cachix.org"];
      # trusted-public-keys = ["hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="];
    };

  };
  system.stateVersion = "${version}";
}
