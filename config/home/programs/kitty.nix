{ user, ... }: {
  home-manager.users."${user}".programs = {
    kitty = {
      enable = true;
      keybindings = { "alt+tab" = "next_window"; };
      settings = {
        allow_remote_control = true;
        confirm_os_window_close = "0";
        enabled_layouts = "stack";
      };
    };
  };
}
