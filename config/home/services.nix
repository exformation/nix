{ user, ... }: {
  home-manager.users."${user}".services = {
    mako.enable = true;
    dunst.enable = true;
  };
}
