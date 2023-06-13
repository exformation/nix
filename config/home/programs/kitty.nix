# TODO: make a bind for easily switching between the windows
# youu could just override your normal one if you're focused on kitty
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
      # TODO: create this programmatically for all your tabs by looping through the projects and ~/repos 
      # hmmm that way if people don't even have a repos folder it can still make a valid config
      startup_session = "startup.conf";
      confirm_os_window_close = "0";
    };
  };
}
