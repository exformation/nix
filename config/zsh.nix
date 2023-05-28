{ a }: {
  enable = true;
  autocd = false;
  enableAutosuggestions = true;
  enableCompletion = true;
  # defaultKeymap = "viins";
  shellAliases = {
    g = "git";
    v = "nvim";
    # l = "exa -la";
    l = "exa --long --header --icons --git --group-directories-first --color-scale --color=always --sort=modified --reverse --tree";
    h = "gh";
    c = "code .";
    tree = "exa --tree --level=5 .";
    nrs = "sudo nixos-rebuild switch --flake '/home/${a.user}/nix#${a.user}'";
    nrsu = "nix flake update && nrs && reboot";
    gg = "g a && g c 'boop' && g p";
  };
  oh-my-zsh = {
    enable = true;
    theme = "robbyrussell";
    plugins = [ "thefuck" "command-not-found" "git" "history" "sudo" ];
  };
  initExtra = ''
    bindkey '^ ' autosuggest-accept
    bindkey -s '^Z' 'fg^M'
  '';
}
