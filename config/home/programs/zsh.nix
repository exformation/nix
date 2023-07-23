{ user, ... }: {
  home-manager.users."${user}".programs.zsh = {
    enable = true;
    autocd = false;
    enableAutosuggestions = true;
    enableCompletion = true;
    syntaxHighlighting = { enable = true; };
    sessionVariables = { DIRENV_LOG_FORMAT = ""; };
    shellAliases = {
      g = "git";
      v = "nvim";
      vio = "nvim --cmd 'set rtp+=/home/${user}/repos/nvim-iobuffers'";
      l = "exa";
      c = "code .";
      tree = "exa --tree --level=5 .";
      nr = "nix run";
      nrs =
        "g a && sudo nixos-rebuild switch --flake '/home/${user}/repos/nix#${user}'";
      nfu = "nix flake update";
      nfurs = "nfu && nrs && reboot";
      gg = "g a && g c 'boop' && g p";
      r =
        "cd $(cd ~ && fd -atd '^.git$' --hidden -E '.local/share' --max-depth=3 --exec dirname | rofi -dmenu)";
      pi = "kitty +kitten ssh pi@192.168.1.90";
    };
    zplug = {
      enable = true;
      plugins = [
        { name = "zsh-users/zsh-autosuggestions"; } # Simple plugin installation
        {
          name = "starship/starship";
          tags = [ "as:theme" "depth:1" ];
        }
        { name = "MichaelAquilina/zsh-auto-notify"; }
        {
          name = "marlonrichert/zsh-autocomplete";
        }
        # {
        #   name = "romkatv/powerlevel10k";
        #   tags = [ "as:theme" "depth:1" ];
        # } # Installations with additional options. For the list of options, please refer to Zplug README.
      ];
    };
    initExtra = ''
      bindkey '^ ' autosuggest-accept
      bindkey -s '^Z' 'fg^M'
      setopt HIST_IGNORE_ALL_DUPS
      setopt HIST_FIND_NO_DUPS
      setopt HIST_SAVE_NO_DUPS
      #source ~/.p10k.zsh
    '';
    # TODO: how to have history contained in a develop/direnv shell? it's annoying seeing 'nrs' in history of other projects, for example
    history = {
      ignoreDups = true;
      share = false;
      extended = false;
      expireDuplicatesFirst = true;
    };
  };
}
