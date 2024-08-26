{ user, version, ... }: {
  imports = [ ./programs/programs.nix ./wayland.nix ];
  home-manager = {
    backupFileExtension = "hm-backup";
    useGlobalPkgs = true;
    users."${user}" = { config, ... }: {
      stylix.targets.neovim.enable = false;
      home = { stateVersion = version; };
      xdg = { portal = { xdgOpenUsePortal = true; }; };
      #xdg.configFile."nvim/lua" = {
      #  source = config.lib.file.mkOutOfStoreSymlink "/home/exform/repos/nvim/lua";
      #	recursive = true;
      #     };
      #     xdg.configFile."nvim/init.lua" = {
      #       source = config.lib.file.mkOutOfStoreSymlink "/home/exform/repos/nvim/init.lua";
      #     };
    };
  };
}
