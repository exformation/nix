{ pkgs, ... }: {
  # TODO: how many of these can be moved to home.nix? and why?
  environment.systemPackages = with pkgs; [
    (lutris.override {
      # extraLibraries = [ ];
      # extraPkgs = [ ];
    })
    newsflash
    # anki
    # libreoffice-fresh
    # helix
    # lmms
    glxinfo
    vulkan-tools
    pavucontrol
    # appimage-run
    mangohud
    protontricks
    dolphin
    ntfs3g
    kbd
    # mumble
    gotop
    usbutils
    lsof
    gamemode
    spotify
    clipman
    wev
    dunst
    mako
    acpi
    brightnessctl
    direnv
    discord
    # exa
    fd
    feh
    ffmpeg
    file
    # firefox
    fzf
    gimp
    # google-chrome
    # jq
    killall
    # kitty
    # kitty-themes
    # lf
    libnotify
    maim
    mpv
    mpd
    neofetch
    nodejs_20
    obs-studio
    pulseaudioFull
    pamixer
    # ripgrep
    # rofi
    tldr
    osu-lazer
    # amdgpu-pro
    # linuxKernel.packages.linux_zen.amdgpu-pro
    unzip
    vlc
    vscode
    warpd
    wget
    wl-clipboard
    # wl-clip-persists
    grim
    slurp
    wmctrl
    xclip
    xdg-desktop-portal-hyprland
    xdg-utils
    xdotool
    xkbset
    xorg.xinit
    zip
    zsh
    dotnet-sdk_8
  ] ++ osu-lazer.nativeBuildInputs;
}
