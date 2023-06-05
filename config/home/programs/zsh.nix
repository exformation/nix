{ user, theme, ... }@inputs: {
  home-manager.users."${user}".programs.zsh = {
    enable = true;
    autocd = false;
    enableAutosuggestions = true;
    enableCompletion = true;
    enableSyntaxHighlighting = true;
    shellAliases = {
      g = "git";
      v = "nvim";
      l =
        "exa --long --header --icons --git --group-directories-first --color-scale --color=always --sort=modified --reverse --tree";
      c = "code .";
      tree = "exa --tree --level=5 .";
      nrs =
        "g a && sudo nixos-rebuild switch --flake '/home/${user}/nix#${user}'";
      nrsu = "nix flake update && nrs && reboot";
      gg = "g a && g c 'boop' && g p";
    };
    oh-my-zsh = {
      enable = true;
      theme = theme.zsh-theme;
      plugins = [ "command-not-found" "git" "history" ];
    };
    initExtra = ''
      bindkey '^ ' autosuggest-accept
      bindkey -s '^Z' 'fg^M'
    '';
  };
}
