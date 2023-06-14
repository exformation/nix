# TODO: make a bind for easily switching between the windows
# youu could just override your normal one if you're focused on kitty
{ user, ... }: {
  home-manager.users."${user}".programs.kitty = let
    repos =
      [ "nix" "nvim" "pedd" "epsilon" "qmk_firmware" "nixpkgs" "osu" ];
    process = repo: ''
      ${if repo != "nix" then "new_os_window" else ""}
      os_window_class ${repo}
      new_tab ${repo}
      cd ~/repos/${repo}
      launch direnv exec . zsh
      launch direnv exec . nvim

    '';
    startup = builtins.toFile "startup.conf"
      (builtins.concatStringsSep "\n" (map process repos));
  in {
    enable = true;
    keybindings = { "alt+tab" = "next_window"; };
    settings = {
      allow_remote_control = true;
      startup_session = startup;
      confirm_os_window_close = "0";
      enabled_layouts = "stack";
    };
  };
}
