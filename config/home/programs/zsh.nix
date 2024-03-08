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
        l = "eza";
        tree = "eza --tree --level=5 .";
        nrs =
          "g a && sudo nixos-rebuild switch --flake '/home/${user}/repos/nix#${user}'";
        nfu = "nix flake update";
        nfurs = "nfu && nrs && reboot";
        gg = "g a && g c 'boop' && g p";
        r =
          "cd $(cd ~ && fd -atd '^.git$' --hidden -E '.local/share' --max-depth=3 --exec dirname | rofi -dmenu)";
        pi = "kitty +kitten ssh pi@192.168.1.90";
        zaphod =
          "gh run watch && rm *.uf2 && gh run download -n firmware && sudo rm -rf /tmp/kb && mkdir /tmp/kb && sudo mount /dev/$(lsblk -n -l --output NAME | rofi -dmenu) /tmp/kb && sudo cp zaphod.uf2 /tmp/kb";
        om = "make -f ~/repos/nix/scripts/om";
        omc = "make -f ~/repos/nix/scripts/om clean";
        omt = "make -f ~/repos/nix/scripts/om test";
        omd = "make -f ~/repos/nix/scripts/om debug";
        omr = "make -f ~/repos/nix/scripts/om release";
        ro = "~/repos/nix/scripts/restart-osu";
        # omc && omd && ro
      };
      oh-my-zsh = {
        enable = true;
        theme = "robbyrussell";
        plugins = [ "command-not-found" "git" "history" ];
      };
      initExtra = ''
        function copy-last-command-to-clipboard {
            print -rn -- $history[$[HISTCMD-1]] | wl-copy
        }
        zle -N copy-last-command-to-clipboard

        bindkey '^o' copy-last-command-to-clipboard
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
