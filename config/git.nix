{ inputs }: {
  enable = true;
  userName = "${inputs.user}";
  userEmail = "${inputs.email}";
  extraConfig = { init.defaultBranch = "main"; };
  aliases = {
    c = "commit -am";
    s = "status";
    a = "add .";
    i = "init";
    d = "diff";
    p = "push origin main";
    ignore = "rm --cached -r . ";
  };
}
