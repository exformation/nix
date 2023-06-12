{ pkgs, ... }: {
  stylix = {
    # /etc/stylix/palette.html 
    # ~/.config/stylix/palette.html
    # https://github.com/tinted-theming/base16-schemes
    image = ../util/bg.png;
    polarity = "dark";
    base16Scheme = "${pkgs.base16-schemes}/share/themes/onedark.yaml";

    fonts = let
      # f = (pkgs.nerdfonts.override { fonts = [ "FiraCode" ]; });
      fs = 12;
    in {
      serif = {
        package = pkgs.dejavu_fonts;
        name = "DejaVu Serif";
      };
      sansSerif = {
        package = pkgs.dejavu_fonts;
        name = "DejaVu Sans";
      };
      monospace = {
        package = pkgs.dejavu_fonts;
        name = "DejaVu Sans Mono";
      };
      emoji = {
        package = pkgs.noto-fonts-emoji;
        name = "Noto Color Emoji";
      };
      sizes = {
        applications = fs;
        desktop = fs;
        terminal = fs;
        popups = fs;
      };
    };
  };
}
