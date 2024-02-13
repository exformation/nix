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
      dunst
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
      kbd
      killall
      lazygit
      libnotify
      lsof
      lua-language-server
      maim
      mako
      mangohud
      marksman
      mpd
      mpv
      neofetch
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
      vscode
      vulkan-tools
      warpd
      wev
      wget
      wl-clipboard
      wmctrl
      write-good
      xclip
      xdg-desktop-portal-hyprland
      xdg-utils
      xdotool
      xkbset
      xorg.xinit
      zip
      zsh
    ] ++ osu-lazer.nativeBuildInputs;
}
