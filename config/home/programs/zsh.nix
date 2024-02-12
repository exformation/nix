{ user, ... }: {
  home-manager.users."${user}".programs = {
    zsh = {
      enable = true;
      autocd = true;
      enableAutosuggestions = true;
      enableCompletion = true;
      syntaxHighlighting = { enable = true; };
      sessionVariables = { DIRENV_LOG_FORMAT = ""; };
      shellAliases = {
        g = "git";
        v = "nvim";
        vio = "nvim --cmd 'set rtp+=/home/${user}/repos/nvim-iobuffers'";
        l = "eza";
        c = "code .";
        tree = "eza --tree --level=5 .";
        dr = "direnv reload";
        nr = "nix run";
        # TODO: I don't like this needing to be impure, should nvim be a submodule?
        nrs =
          "g a && sudo nixos-rebuild switch --flake '/home/${user}/repos/nix#${user}' --impure";
        nfu = "nix flake update";
        nfurs = "nfu && nrs && reboot";
        gg = "g a && g c 'boop' && g p";
        r =
          "cd $(cd ~ && fd -atd '^.git$' --hidden -E '.local/share' --max-depth=3 --exec dirname | rofi -dmenu)";
        pi = "kitty +kitten ssh pi@192.168.1.90";
        zaphod = "gh run watch && rm *.uf2 && gh run download -n firmware && sudo rm -rf /tmp/kb && mkdir /tmp/kb && sudo mount /dev/$(lsblk -n -l --output NAME | rofi -dmenu) /tmp/kb && sudo cp zaphod.uf2 /tmp/kb";
      };
      oh-my-zsh = {
        enable = true;
        theme = "robbyrussell";
        plugins = [ "command-not-found" "git" "history" ];
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
  };
}
