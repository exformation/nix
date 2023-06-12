{ pkgs, ... }: {
  # TODO: how many of these can be moved to home.nix? and why?
  environment.systemPackages = with pkgs; [
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
    neofetch
    nodejs_20
    obs-studio
    pulseaudioFull
    pamixer
    # ripgrep
    # rofi
    tldr
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
    xdotool
    xkbset
    xorg.xinit
    zip
    zsh
    # ((vscode.override { isInsiders = true; }).overrideAttrs (oldAttrs: rec {
    #   src = (builtins.fetchTarball {
    #     url =
    #       "https://code.visualstudio.com/sha/download?build=insider&os=linux-x64";
    #     sha256 =
    #       "1nvmnf4w2894v21zcmh1xzcxzzilc10qsqhz2i5hqvrn2vcw0ivv";
    #   });
    #   version = "latest";
    # }))
  ];
}
