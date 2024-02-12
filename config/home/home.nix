{ pkgs, user, version, ... }: {
  imports = [ ./programs/programs.nix ./wayland.nix ];
  home-manager = {
    useGlobalPkgs = true;
    users."${user}" = {config,...}: {
      stylix.targets.vim.enable = false;
      home = { stateVersion = version; };
      xdg.configFile.nvim = {
        source = "${config.home.homeDirectory}/repos/nvim";
        recursive = false;
      };
    };
  };
}
