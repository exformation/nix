{ user, pkgs, lib, ... }@inputs:
with builtins;
let
  nvim-plugin-names = filter (p: substring 0 4 p == "nvim") (attrNames inputs);
  plugins = map (p: ({ name = p; } // inputs."${p}")) nvim-plugin-names;
in {
  home-manager.users."${user}".programs.neovim = {
    enable = true;
    plugins = plugins;
    # package = neovim.packages.${pkgs.system}.default;
    # plugins = with pkgs.vimPlugins;
    #   with inputs;
    #   [
    # TODO: I want to just provide a link to the repo and have it install the latest version
    # "https://github.com/neovim/nvim-lspconfig" 

    # nvchad
    # nvchad-ui
    # nvchad-extensions

    # (plugin "lspconfig" lspconfig)
    # builtins.attrNames inputs -> [ "hm" "lspconfig" "nixpkgs" ]

    # nvim-treesitter.withAllGrammars
    # nvim-lspconfig
    # telescope-nvim
    # nvim-cmp
    # cmp-buffer
    # cmp-path
    # cmp-cmdline
    # cmp-nvim-lsp
    # cmp-nvim-lua
    # cmp-spell
    # cmp-rg
    # cmp-zsh
    # cmp-copilot
    # cmp-dap
    # cmp-emoji
    # cmp_luasnip
    # luasnip
    # friendly-snippets
    # surround
    # vim-easymotion
    # which-key-nvim
    # nvim-ts-rainbow
    # onedark-nvim
    # plenary-nvim
    # vim-nix
    # delimitMate
    # telescope-file-browser-nvim
    # gitsigns-nvim
    # neogit
    # ];
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

# extraPackages = with pkgs;
#   [
#     # tree-sitter
#     # tree-sitter-python
#     # tree-sitter-cpp
#     # nodePackages.neovim
#     # nodePackages.npm
#     # lua-language-server
#     # sumneko-lua-language-server
#     # clangs-tools
#     # cppcheck
#     # nodePackages.pyright
#     # rust-analyzer
#   ];
