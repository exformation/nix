{ pkgs, ... }: {
  stylix = {
    enable = true;
    image = ../images/bg.png;
    polarity = "dark";
    base16Scheme = "${pkgs.base16-schemes}/share/themes/onedark.yaml";
    fonts.sizes = {
      applications = 14;
      desktop = 14;
      terminal = 14;
      popups = 14;
    };
  };
}
