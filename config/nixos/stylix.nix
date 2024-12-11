{ pkgs, ... }: {
  stylix = {
    enable = true;
    image = ../images/bg.png;
    polarity = "dark";
    base16Scheme = "${pkgs.base16-schemes}/share/themes/onedark.yaml";
    fonts.sizes = {
      applications = 10;
      desktop = 10;
      terminal = 15;
      popups = 10;
    };
  };
}
