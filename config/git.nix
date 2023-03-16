{ a }: {
  enable = true;
  userName = "${a.user}";
  userEmail = "${a.email}";
  extraConfig = { init.defaultBranch = "main"; };
  aliases = {
    c = "commit -am";
    s = "status";
    a = "add .";
    i = "init";
    d = "diff";
    p = "push origin main";
  };
}
