{ a }: {
  enable = true;
  withPython3 = true;
  package = a.pkgs.neovim;
  # package = a.neovim.packages.${a.pkgs.system}.default;
  # extraConfig = "luafile ~/.config/nvim/config.lua";
  extraPackages = with a.pkgs;
    [
      # tree-sitter
      # tree-sitter-python
      # tree-sitter-cpp
      # nodePackages.neovim
      # nodePackages.npm
      # lua-language-server
      # sumneko-lua-language-server
      # clangs-tools
      # cppcheck
      # nodePackages.pyright
      # rust-analyzer
    ];
  plugins = with a.pkgs.vimPlugins;
    [
      # nvim-treesitter.withAllGrammars
      # (nvim-treesitter.withPlugins (p: [
      #   p.tree-sitter-query
      #   p.tree-sitter-python
      #   p.python
      # ]))
      # nvim-lspconfig
      #   telescope-nvim

      #   # COMPLETION
      #   nvim-cmp
      #   cmp-buffer
      #   cmp-path
      #   cmp-cmdline
      #   cmp-nvim-lsp
      #   cmp-nvim-lua
      #   cmp-spell
      #   # cmp-rg
      #   # cmp-zsh
      #   # cmp-copilot
      #   # cmp-dap
      #   # cmp-emoji
      #   cmp_luasnip

      #   # SNIPPETS
      #   luasnip
      #   friendly-snippets

      #   # 
      #   surround

      #   # 
      #   vim-easymotion

      #   # 
      #   which-key-nvim

      #   #
      #   nvim-ts-rainbow

      #   # THEME
      #   onedark-nvim

      #   # UTILITY
      #   plenary-nvim

      #   # LANGUAGES
      #   vim-nix

      #   # FORMATTING

      #   # delimitMate
      #   # telescope-file-browser-nvim
      #   # gitsigns-nvim
      #   # neogit
    ];
}

# idea: gd(?) in vim on vimPlugins takes me to the github page
