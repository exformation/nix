# TODO: make a bind for easily switching between the windows
# youu could just override your normal one if you're focused on kitty
{ user, ... }: {
  home-manager.users."${user}".programs.kitty = let
    repos = [ "nix" "nvim" "osu" "pedd" "epsilon" "qmk_firmware" ];
    process = repo: ''
      new_tab ${repo}
      layout horizontal
      cd ~/repos/${repo}
      launch direnv exec . zsh

    '';
    startup = builtins.toFile "startup.conf"
      (builtins.concatStringsSep "\n" (map process repos));
  in {
    enable = true;
    keybindings = { };
    settings = {
      allow_remote_control = true;
      startup_session = startup;
      confirm_os_window_close = "0";
    };
  };
}
