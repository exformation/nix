{ user, ... }: {
  home-manager.users."${user}".services = { dunst.enable = true; };
}
