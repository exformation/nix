{ config, lib, pkgs, user, version, home-manager, ...}@a:
let
  python-libs = p:
    with p; [
      numpy
      more-itertools
      pyserial
      pillow
      python-lsp-server
      nix-prefetch-github
      # https://pypi.org/project/vosk/#copy-hash-modal-0be01fd6-9e74-4cd0-a21f-1109352df8f5
      (buildPythonPackage rec {
        pname = "vosk";
        version = "0.3.45";
        src = fetchPypi {
          inherit pname version;
          sha256 = "25e025093c4399d7278f543568ed8cc5460ac3a4bf48c23673ace1e25d26619f";
        };
        doCheck = false;
        propagatedBuildInputs = [
          # Specify dependencies
          # pkgs.python3Packages.numpy
        ];
      })
    ];
in {
  imports = [ ./hardware-configuration.nix home-manager.nixosModule ];

  home-manager = import ./home.nix { inherit a; };

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
  };

  networking = {
    hostName = "nixos";
    networkmanager.enable = true;
    useDHCP = false;
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

#   programs.gpg.enable = true;
# services.gpg-agent = {
#   enable = true;
#   enableSshSupport = true;
#   };

  # sudo nmcli dev wifi connect "..." password "..."
  users = {
    defaultUserShell = pkgs.zsh;
    users."${user}" = {
      isNormalUser = true;
      extraGroups = [ "networkmanager" "wheel" "adbusers" ]; # "uinput" "input" ];
    };
  };

  programs.adb.enable = true;

  services.gnome.gnome-keyring.enable = true;

  systemd.services.bouncekeys = {
    description = "Fix chatter on laptop";
    wantedBy = [ "default.target" ];
    after = [ "graphical-session.target" ];
    restartIfChanged = false;
    serviceConfig = {
      Restart = "on-failure";
      # ExecStart = "${pkgs.kanata}/bin/kanata -c /home/${user}/.config/kanata/kanata.kbd";
      ExecStart = "${pkgs.kanata}/bin/xkbset bo 20";
    };
  };



  nixpkgs.config.allowUnfree = true;
  # programs.java = { enable = true; package = pkgs.oraclejre; };

  environment = {
    variables = {
      EDITOR = "nvim";
      VISUAL = "nvim";
      TERMINAL = "kitty";
      SHELL = "zsh";
      PAGER = "less";
      BROWSER = "firefox";
      # CHROME_EXECUTABLE = "google-chrome-stable";
      # JAVA_HOME = pkgs.jdk17; # change whether either of these have .home or not?
      # ANDROID_JAVA_HOME = pkgs.jdk17;
      # no ANDROID_HOME -> breaks flutter run, but flutter doctor says the Android toolchain is good
      # ANDROID_HOME = pkgs.android-tools; #tools?
      # ANDROID_HOME = "/home/exform/Android"; # flutter doctor doesn't like this?
      # ANDROID_SDK_ROOT = "/home/exform/Android/Sdk";
      # FLUTTER_SDK = pkgs.flutter.unwrapped;
      # ANDROID_HOME = "${android.androidsdk}/libexec/android-sdk";

    };
    shells = with pkgs; [ zsh ];
    # TODO: get vosk python package working so I can nerd-dictation so I can have STT binds 
    # TODO: add both vosk and nerd-dictation to nixpkgs
    systemPackages = with pkgs; [
      (python310.withPackages (ps:
        with ps;
        [
          numpy
          more-itertools
          pyserial
          pillow
          python-lsp-server
          nix-prefetch-github
        ]))
      # (python39.withPackages python-libs)
      # TODO: add REP key to altGr, MEH key to burgerkey, ESC to caps
      # TODO: don't allow repeats within certain ms to reduce double presses
      kanata

      direnv

      # flutter????
      # android-studio
      # android-tools
      # jdk17
      # jre17_minimal
      # adb

      pulseaudioFull
      # kaldi
      openai-whisper
      xkbset
      obs-studio
      acpi
      anki
      bat
      brightnessctl
      bspwm
      clang
      cmake
      coreutils
      discord
      # flutter
      dmenu
      dunst
      exa
      fd
      feh
      ffmpeg
      file
      firefox
      google-chrome
      fish
      fzf
      gh
      gimp
      git
      gnumake
      gotop
      jq
      killall
      kitty
      kitty-themes
      lf
      # lua.withPackages (ps: with ps; [ lain ])
      lua
      luarocks
      maim
      mpv
      neofetch
      nixfmt
      nodejs
      pamixer
      qmk
      ripgrep
      rofi
      spotify
      stylua
      thefuck
      tldr
      unzip
      vlc
      vscode
      wget
      wmctrl
      xclip
      xdotool
      xorg.xinit
      zip
      zoxide
      zsh
    ];
  };

  hardware = { opengl.enable = true; };
  programs.zsh.enable = true;

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
