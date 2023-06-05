{ pkgs, user, theme, ... }@inputs: {
  imports = [ ./git.nix ./zsh.nix ./kitty.nix ];
  home-manager.users."${user}".programs = {
    direnv = {
      enable = true;
      enableZshIntegration = true;
      enableBashIntegration = true;
      nix-direnv.enable = true;
    };
    fzf = {
      enable = true;
      enableZshIntegration = true;
    };
    bat = {
      enable = true;
      config.theme = theme.bat-theme;
    };
    exa = {
      enable = true;
      git = true;
      icons = true;
      extraOptions = [
        "--long"
        "--header"
        "--group-directories-first"
        "--sort=modified"
        "--reverse"
      ];
    };
    neovim = {
      enable = true;
      plugins = with pkgs.vimPlugins; [
        # Binding
        which-key-nvim
        # Navigation
        # Modification
        # Visual
        # Text Objects
        # Search
        telescope-nvim
        # Git
        # TS 
        nvim-treesitter.withAllGrammars
        # LSP
        nvim-lspconfig
        # CMP
        # Snippets
        # DAP
        # Sessions
        # AI

        vim-nix
      ];
    };
  };
}
