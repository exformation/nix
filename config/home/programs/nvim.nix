{ user, pkgs, lib, ... }@inputs:
# with builtins;
# let
#   # i'm a genius 
#   nvim-plugin-names = filter (p: substring 0 4 p == "nvim") (attrNames inputs);
#   plugins = map (p: ({ name = p; } // inputs."${p}")) nvim-plugin-names;
# in
{
  home-manager.users."${user}".programs.neovim = {
    enable = true;
    # package = neovim.packages.${pkgs.system}.default;
    plugins = with pkgs.vimPlugins; [
      nvim-treesitter.withAllGrammars
      nvim-ts-rainbow
      nvim-lspconfig
      telescope-nvim
      plenary-nvim
      nvim-cmp
      which-key-nvim
      onedark-nvim
      nvim-dap
      luasnip
      persistence-nvim
      better-escape-nvim
      vim-fugitive
      comment-nvim
      # ChatGPT-nvim
      # copilot-lua copilot-cmp
      # copilot-vim cmp-copilot

      # todo-comments-nvim
      # lualine-nvim
      # nvchad
      # nvchad-ui
      # nvchad-extensions
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
      # cmp-copilot
      # cmp_luasnip
      # friendly-snippets
      # surround
      # vim-easymotion
      # vim-nix
      # delimitMate
      # telescope-file-browser-nvim
      # gitsigns-nvim
      # neogit
    ];
  };
}

# idea: gd(?) in vim on vimPlugins takes me to the github page