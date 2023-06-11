{ user, ... }@inputs: {
  home-manager.users."${user}".programs.zsh = {
    enable = true;
    autocd = false;
    enableAutosuggestions = true;
    enableCompletion = true;
    enableSyntaxHighlighting = true;
    shellAliases = {
      g = "git";
      v = "nvim";
      l = "exa";
      c = "code .";
      tree = "exa --tree --level=5 .";
      nrs =
        "g a && sudo nixos-rebuild switch --flake '/home/${user}/nix#${user}'";
      nrsu = "nix flake update && nrs && reboot";
      gg = "g a && g c 'boop' && g p";
      r = "cd $(cd ~ && fd -atd '^.git$' --hidden -E '.local/share' --max-depth=3 --exec dirname | rofi -dmenu)";
    };
    oh-my-zsh = {
      enable = true;
      theme = "robbyrussell";
      plugins = [ "command-not-found" "git" "history" ];
    };
    initExtra = ''
      bindkey '^ ' autosuggest-accept
      bindkey -s '^Z' 'fg^M'
    '';
  };
}
