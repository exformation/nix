{ pkgs, user, version, ... }: {
  imports = [ ./programs/programs.nix ./wayland.nix ];
  home-manager = {
    useGlobalPkgs = true;
    users."${user}" = {config,...}: {
      stylix.targets.vim.enable = false;
      home = { stateVersion = version; };
      xdg.configFile."nvim/lua" = {
        source = ./nvim/lua;
	recursive = true;
      };
      xdg.configFile."nvim/init.lua" = {
        source = ./nvim/init.lua;
      };	
    };
  };
}
