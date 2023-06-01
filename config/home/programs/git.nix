{ user, email, ... } @ inputs: {
  home-manager.users."${user}".programs.git = {
    enable = true;
    userName = user;
    userEmail = email;
    extraConfig = { init.defaultBranch = "main"; };
    aliases = {
      c = "commit -am";
      s = "status";
      a = "add .";
      i = "init";
      d = "diff";
      p = "push origin main";
      ignore = "rm --cached -r .";
    };
  };
}
