{ pkgs, user, theme, lspconfig, ... }@inputs: {
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
      plugins = with pkgs.vimPlugins;
        [
          # Binding
          # which-key-nvim
          # Navigation
          # Modification
          # Visual
          # Text Objects
          # Search
          # telescope-nvim
          # Git
          # TS 
          # nvim-treesitter.withAllGrammars
          # LSP

          # (buildVimPluginFrom2Nix {
          #   pname = lspconfig.name;
          #   version = lspconfig.version;
          #   src = fetchFromGitHub {
          #     owner = lspconfig.owner;
          #     repo = lspconfig.repo;
          #     rev = lspconfig.rev;
          #     sha256 = lspconfig.narhash;
          #   };
          #   # meta.homepage = lspconfig.url;
          # })
          # CMP
          # Snippets
          # DAP
          # Sessions
          # AI

          # vim-nix
        ];
      # put these here for package dependences?? don't think so 
      # extraPackages = with pkgs; [ ripgrep fd ];
    };
  };
}
