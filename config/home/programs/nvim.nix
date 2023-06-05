{ user, pkgs, lib, ... }@inputs:
let
  # installs a vim plugin from git with a given tag / branch
  pluginGit = rev: owner: repo: sha256:
    pkgs.vimUtils.buildVimPluginFrom2Nix {
      pname = repo;
      version = rev;
      src = pkgs.fetchFromGitHub {
        rev = rev;
        owner = owner;
        repo = repo;
        sha256 = sha256;
      };
    };
  plugin = pluginGit "HEAD";
in {
  home-manager.users."${user}".programs.neovim = {
    enable = true;
    # package = neovim.packages.${pkgs.system}.default;
    # extraConfig = "luafile ~/.config/nvim/config.lua";
    extraPackages = with pkgs;
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
    plugins = with pkgs.vimPlugins;
      [
        (plugin "neovim" "nvim-lspconfig"
          "sha256-+lq+a5Fk481W/TbUZrhxwwGJue4PTZ7m7j2zaSgyQDg=")
        # (pluginGit "branch" "own" "repo" "sha256")
        
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
  };
}

# idea: gd(?) in vim on vimPlugins takes me to the github page

# neovim = {
#   enable = true;
#   plugins = with pkgs.vimPlugins;
#     [
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
# ];
# put these here for package dependences?? don't think so 
# extraPackages = with pkgs; [ ripgrep fd ];
# };
