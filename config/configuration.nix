{ config, lib, pkgs, user, version, home-manager, ... }@inputs: {
  imports = [ ./hardware-configuration.nix ];
  home-manager = import ./home.nix { inherit inputs; };

  sound.enable = true;
  hardware = {
    pulseaudio.enable = false;
    bluetooth.enable = true;
    opengl.enable = true;
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

  security = {
    rtkit.enable = true;
    sudo.wheelNeedsPassword = false;
  };

  # sudo nmcli dev wifi connect "..." password "..."
  users = {
    defaultUserShell = pkgs.zsh;
    users."${user}" = {
      isNormalUser = true;
      extraGroups = [
        "networkmanager"
        "wheel"
        "adbusers"
        # TODO: remove
        "input"
        "uinput"
      ];
    };
  };

  programs = {
    adb.enable = true;
    zsh.enable = true;
  };

  nixpkgs.config.allowUnfree = true;

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
    systemPackages = (import ./packages.nix { inherit inputs; }).systemPackages;
  };

  nix = {
    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 30d";
    };
    package = pkgs.nixVersions.unstable;
    extraOptions = ''
      experimental-features = nix-command flakes
    '';
    settings = { auto-optimise-store = true; };
  };

  system.stateVersion = "${version}";

  # systemd.services.bouncekeys = {
  #   description = "Fix chatter on laptop";
  #   wantedBy = [ "default.target" ];
  #   after = [ "graphical-session.target" ];
  #   restartIfChanged = false;
  #   serviceConfig = {
  #     Restart = "on-failure";
  #     # ExecStart = "${pkgs.kanata}/bin/kanata -c /home/${user}/.config/kanata/kanata.kbd";
  #     ExecStart = "${pkgs.kanata}/bin/xkbset bo 50";
  #   };
  # };
}
