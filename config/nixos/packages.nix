{ pkgs, ... }: {
  # TODO: how many of these can be moved to home.nix? and why?
  # nixpkgs.overlays = [ (import ./overlay.nix) ];
  environment.systemPackages = with pkgs;
  # let
  #   # overrideAttrs, overrideDerivation
  #   customOsuLazer = pkgs.osu-lazer-bin.overrideAttrs (oldAttrs: rec {
  #     version = "2024.302.0";
  #     src = fetchurl {
  #       url =
  #         "https://github.com/ppy/osu/releases/download/${version}/osu.AppImage";
  #       hash = "sha256-XzrrtzoxLJ/uKNDi8IuCg3JRRHDq/jFo344ngII/x9g=";
  #     };
  #     meta = { mainProgram = "myosu"; };
  #   });
  # in [
    [
      # amdgpu-pro
      anki
      gcc
      udev
      alsa-lib
      vulkan-loader
      xorg.libX11
      xorg.libXcursor
      xorg.libXi
      xorg.libXrandr
      libxkbcommon
      wayland
      pkg-config
      godot_4
      # blender
      alacritty

      # appimage-run
      # exa
      # firefox
      # google-chrome
      # helix
      # jq
      # kitty
      # kitty-themes
      # lf
      # libreoffice-fresh
      # linuxKernel.packages.linux_zen.amdgpu-pro
      # lmms
      # mumble
      # ripgrep
      # rofi
      # wl-clip-persists
      #dolphin
      #newsflash
      #spotify
      # godot_4
      # jetbrains.rider
      gettext
      gnumake
      acpi
      brightnessctl
      clipman
      direnv
      discord
      dotnet-sdk_8
      csharp-ls
      netcoredbg
      fd
      feh
      ffmpeg
      file
      fzf
      gimp
      glxinfo
      gotop
      grim
      killall
      lazygit
      libnotify
      lsof
      lua-language-server
      maim
      mako
      marksman
      mpd
      mpv
      nil
      nixfmt-classic
      # nimpretty # nph https://github.com/arnetheduck/nph
      # nodePackages.alex
      nodejs_20
      ntfs3g
      obs-studio
      osu-lazer-bin
      pamixer
      pavucontrol
      proselint
      protontricks
      pulseaudioFull
      slurp
      stylua
      tldr
      unzip
      usbutils
      vlc
      vulkan-tools
      wev
      wget
      wl-clipboard
      write-good
      xdg-desktop-portal-gtk
      xdg-utils
      zip
      zed-editor
      fish
      pyright
      black
      isort
      prettierd
      ollama
      (python311.withPackages (p: [
        # p.playsound
        p.pygame
        p.genanki
        p.git-filter-repo
        p.pygments
        p.scikit-learn
        p.beautifulsoup4
        p.lxml
        p.huggingface-hub
        p.autopep8
        p.debugpy
        p.discordpy
        p.evdev
        p.fire
        p.more-itertools
        p.numpy
        p.pandas
        p.pynput
        p.pytest
        p.pytest-benchmark
        p.requests
        p.scipy
        p.sympy
        p.watchdog
        p.cmake
      ]))
    ] ++ osu-lazer.nativeBuildInputs;
}
