{ user, pkgs, ... }:
# with builtins;
# let
#   # i'm a genius 
#   nvim-plugin-names = filter (p: substring 0 4 p == "nvim") (attrNames inputs);
#   plugins = map (p: ({ name = p; } // inputs."${p}")) nvim-plugin-names;
# in
{

  home-manager.users."${user}".programs.neovim = {
    enable = true;
    # whether I'm using the flake or not
    # package = neovim.packages.${pkgs.system}.default;
    plugins = with pkgs.vimPlugins; [
      nvim-treesitter.withAllGrammars
      nvim-lspconfig
      null-ls-nvim
      telescope-nvim
      plenary-nvim
      nvim-cmp
      which-key-nvim
      onedark-nvim
      nvim-dap
      nvim-dap-ui
      luasnip
      persistence-nvim
      better-escape-nvim
      vim-fugitive
      comment-nvim
      nvim-tree-lua
      lualine-nvim
      auto-pairs
      nvim-surround
      friendly-snippets
      hop-nvim
      rainbow-delimiters-nvim
      flutter-tools-nvim
      trouble-nvim

      # project-nvim
      # telescope-project-nvim

      # ChatGPT-nvim
      copilot-lua
      copilot-cmp
      # copilot-vim cmp-copilot

      cmp-copilot
      cmp_luasnip
      # cmp-buffer
      # cmp-path
      # cmp-cmdline
      cmp-nvim-lsp
      cmp-nvim-lua
      # cmp-spell
      # cmp-zsh
      # cmp-dap
      # cmp-emoji
      neodev-nvim
    ];
  };
}

# idea: gd(?) in vim on vimPlugins takes me to the github page
