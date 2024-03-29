{ pkgs, user, email, ... }: {
  home-manager.users."${user}".programs = {
    git = {
      enable = true;
      userName = user;
      userEmail = email;
      extraConfig = { init.defaultBranch = "main"; };
      ignores = [ ".env" ".envrc" ".direnv/" ".vscode/" ];
      aliases = {
        c = "commit -am";
        s = "status";
        a = "add .";
        i = "init";
        d = "diff";
        p = "push origin HEAD";
        ig = "rm --cached -r .";
      };
    };
    gh = {
      enable = true;
      settings = {
        git_protocol = "ssh";
        # TODO: add more
        aliases = {
          co = "pr checkout";
          pv = "pr view";
        };
        # TODO: why doesn't this install them?
        # TODO: why doesn't eco work?
        extensions = with pkgs; [ gh-dash gh-eco ];
      };
    };
  };
}
