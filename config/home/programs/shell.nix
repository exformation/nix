{ self, user, ... }: {
  home-manager.users."${user}".programs = {
    fish = {
      enable = true;
      shellAliases = {
        g = "git";
        v = "nvim";
        l = "eza";
        t = "eza --tree --level=5";
        nrs =
          "g a && sudo nixos-rebuild switch --flake '/home/${user}/repos/nix#${user}'";
        nfu = "nix flake update";
        nfurs = "nfu && nrs --upgrade && reboot";
        gg = "g a && g c 'boop' && g p";
        pi = "kitty +kitten ssh pi@192.168.1.90";
        om = "make -f ${self}/scripts/om";
        ro = "${self}/scripts/restart-osu";
        # om clean && om release && ro &
      };
      shellInit = ''
        set fish_greeting
        bind \ck 'fg'
      '';
      functions = {
        fish_prompt = ''
          set -g __fish_git_prompt_showupstream auto
          set -g __fish_git_prompt_show_informative_status true
          set -g __fish_git_prompt_showdirtystate true
          printf '\\n%s%s%s %s%s\\n$ ' (set_color magenta) (fish_git_prompt) (set_color $fish_color_cwd) (prompt_pwd --full-length-dirs 2) (set_color normal)
        '';
        mkcd = "mkdir -p $argv; and cd $argv";
      };
    };
  };
}
# fish_config prompt choose disco
# funced fish_prompt
