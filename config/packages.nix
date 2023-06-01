{ inputs }: {
  systemPackages = with inputs.pkgs; [
    acpi
      bat
      brightnessctl
      direnv
      discord
      exa
      fd
      feh
      ffmpeg
      file
      firefox
      fzf
      gh
      gimp
      git
      google-chrome
      jq
      killall
      kitty
      kitty-themes
      lf
      libnotify
      maim
      mpv
      neofetch
      nil
      obs-studio
      pulseaudioFull
      ripgrep
      rofi
      tldr
      unzip
      vlc
      vscode
      wget
      wmctrl
      xclip
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