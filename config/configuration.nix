{ config, lib, pkgs, user, version, ... }@a: {
  imports = [ ./hardware-configuration.nix a.home-manager.nixosModule ];

  home-manager = import ./home.nix { inherit a; };

  # TODO: try out wayland with hyprland

  sound.enable = true;
  hardware = {
    pulseaudio.enable = false;
    bluetooth.enable = true;
  };

  # TODO: remove this in favor of a rofi script 
  services.blueman.enable = true;

  boot = {
    # kernelPackages = pkgs.linuxPackages_latest; # why crash?
    loader = {
      timeout = 5;
      systemd-boot.enable = true;
      efi = {
        canTouchEfiVariables = true;
        efiSysMountPoint = "/boot/efi";
      };
    };
    # Laptop shenanigans
    # kernelParams = [ "module_blacklist=i915" ];
  };

  networking = {
    hostName = "nixos";
    networkmanager.enable = true;
  };

  time.timeZone = "America/Chicago";
  i18n.defaultLocale = "en_US.utf8";

  services = {
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

  users = {
    defaultUserShell = pkgs.zsh;
    users."${user}" = {
      isNormalUser = true;
      extraGroups = [ "networkmanager" "wheel" ];
    };
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
    systemPackages = with pkgs; [
      (python3.withPackages
        (ps: with ps; [ numpy more-itertools pyserial pillow python-lsp-server ]))
      bat
      brightnessctl
      bspwm
      clang
      nodejs
      luarocks
      gimp
      cmake
      stylua
      coreutils
      ffmpeg
      unzip
      discord
      dmenu
      pamixer
      dunst
      zip
      exa
      fd
      feh
      file
      xorg.xinit
      fish
      fzf
      zoxide
      gh
      gnumake
      # neovim
      # sqlite
      git
      firefox
      gotop
      jq
      killall
      kitty
      kitty-themes
      lua
      maim
      neofetch
      nixfmt
      ripgrep
      rofi
      thefuck
      tldr
      vscode
      wget
      wmctrl
      xclip
      xdotool
      zsh
      mpv
      anki
      vlc
      qmk
      # emacsGcc
      acpi
    ];
  };

  hardware = {
    opengl.enable = true;
  };

  # nixpkgs.overlays = [
  #   (import (builtins.fetchTarball https://github.com/nix-community/emacs-overlay/archive/master.tar.gz))
  # ];

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
}
