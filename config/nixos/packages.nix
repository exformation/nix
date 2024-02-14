{ pkgs, ... }: {
  # TODO: how many of these can be moved to home.nix? and why?
  environment.systemPackages = with pkgs;
    [
      # amdgpu-pro
      # anki
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
      acpi
      brightnessctl
      clipman
      direnv
      discord
      dotnet-sdk_8
      fd
      feh
      ffmpeg
      file
      fzf
      gamemode
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
      nixfmt
      nodePackages.alex
      nodejs_20
      ntfs3g
      obs-studio
      osu-lazer
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
      xdg-desktop-portal-hyprland
      xdg-utils
      zip
      zsh
      python311
      pyright
      black
      isort
      (python311.withPackages (p: [
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
      ]))
    ] ++ osu-lazer.nativeBuildInputs;
}
