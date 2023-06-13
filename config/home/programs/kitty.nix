{ user, ... }: {
  home-manager.users."${user}".programs.kitty = {
    enable = true;
    # theme = theme.kitty-theme;
    keybindings = {
      # "ctrl+z" = "signal_child SIGTERM"; # this is a shell thing (used zsh for it)
    };
    settings = {
      # font_size = "24.0";
      # font_family = a.style.mono-font;
      # bold_font = "auto";
      # italic_font = "auto";
      # bold_italic_font = "auto";
      allow_remote_control = true;
      startup_session = "kitty.conf";
      confirm_os_window_close = "0";
    };
  };
}
