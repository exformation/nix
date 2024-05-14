{ pkgs, user, version, nixpkgs, lib, ... }: {
  imports =
    [ ./hardware-configuration.nix ./stylix.nix ./packages.nix ./services.nix ];
  sound = { enable = true; };
  #boot.loader.efi.efiSysMountPoint to "/boot"
  # what?
  hardware.keyboard.qmk.enable = true;
  hardware = {
    # pulseaudio.enable = false;
    # bluetooth.enable = true;
    opengl = {
      enable = true;
      driSupport = true;
      driSupport32Bit = true;
    };
    # enableAllFirmware = true;
    # uinput.enable = true;
  };
  boot = {
    kernelPackages = pkgs.linuxPackages_latest;
    loader = {
      timeout = 5;
      systemd-boot.enable = true;
      efi = {
        canTouchEfiVariables = true;
        efiSysMountPoint = "/boot";
      };
    };
    kernelModules = [ "amdgpu" ];
    kernel = {
      sysctl = {
        "fs.inotify.max_user_instances" = 512;
        # "usbcore.autosuspend" = -1;
      };
    };
  };
  networking = {
    hostName = "nixos";
    networkmanager.enable = true;
    useDHCP = false;
  };

  # virtualization
  virtualisation.virtualbox.host.enable = false;
  users.extraGroups.vboxusers.members = [ "${user}" ];

  time = { timeZone = "America/Chicago"; };
  i18n = { defaultLocale = "en_US.utf8"; };
  security = {
    rtkit.enable = true;
    sudo.wheelNeedsPassword = false;
  };
  # sudo nmcli dev wifi connect "..." password "..."
  users = {
    defaultUserShell = pkgs.fish;
    users."${user}" = {
      isNormalUser = true;
      # TODO: only have adbusers for flutter development
      # TODO: only have input and uinput for the user that's using an evdev thing 
      extraGroups =
        [ "networkmanager" "wheel" "adbusers" ]; # "input" "uinput" ];
    };
  };
  programs = {
    # adb.enable = true;
    # gnupg.agent = {
    #   enable = true;
    #   pinentryFlavor = "curses";
    #   enableSSHSupport = true;
    # };
    fish.enable = true;
    hyprland = {
      enable = true;
      xwayland = {
        enable = true;
        #hidpi = true;
      };
      # nvidiaPatches = false;
    };
    steam = {
      enable = true;
      # Open ports in the firewall for Steam Remote Play
      remotePlay.openFirewall = true;
      # Open ports in the firewall for Source Dedicated Server
      # dedicatedServer.openFirewall = true;
      gamescopeSession.enable = true;
    };
    gamemode.enable = true;
  };
  nixpkgs = { config.allowUnfree = true; };
  environment = {
    variables = {
      EDITOR = "nvim";
      VISUAL = "nvim";
      TERMINAL = "kitty";
      SHELL = "fish";
      PAGER = "less";
      BROWSER = "google-chrome-stable";
      DEFAULT_BROWSER = "google-chrome-stable";
      # TODO: this is stinky but I can't put this in a devshell
      # LD_LIBRARY_PATH = lib.makeLibraryPath pkgs.osu-lazer.runtimeDeps;
    };
    shells = with pkgs; [ fish ];
  };
  fonts.packages = with pkgs; [
    noto-fonts
    noto-fonts-cjk
    noto-fonts-emoji
    (nerdfonts.override { fonts = [ "FiraCode" ]; })
  ];
  nix = {
    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 20d";
    };
    registry = { nixpkgs.flake = nixpkgs; };
    package = pkgs.nixVersions.latest;
    extraOptions = ''
      experimental-features = nix-command flakes
    '';
    settings = { auto-optimise-store = true; };

  };
  system.stateVersion = version;
}
