{ user, pkgs, ... }: {
  home-manager.users."${user}".home.packages = with pkgs; [
    # minecraft
    # prismlauncher
    # acpi
    # brightnessctl
    # direnv
    # discord
    # exa
    # fd
    # feh
    # ffmpeg
    # file
    # firefox
    # fzf
    # gimp
    # google-chrome
    # jq
    # killall
    # kitty
    # kitty-themes
    # lf
    # libnotify
    # maim
    # mpv
    # neofetch
    # nodejs_20
    # obs-studio
    # pulseaudioFull
    # ripgrep
    # rofi
    # tldr
    # unzip
    # vlc
    # vscode
    # warpd
    # wget
    # wmctrl
    # xclip
    # xdotool
    # xkbset
    # xorg.xinit
    # zip
    # zsh
  ];
}
