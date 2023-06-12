{ pkgs, ... }: {
  stylix = {
    # /etc/stylix/palette.html 
    # ~/.config/stylix/palette.html
    # https://github.com/tinted-theming/base16-schemes
    image = ../util/bg.png;
    polarity = "dark";
    base16Scheme = "${pkgs.base16-schemes}/share/themes/onedark.yaml";

    fonts = let
      f = (pkgs.nerdfonts.override { fonts = [ "FiraCode" ]; });
      fs = 12;
    in {
      serif = {
        package = f;
        name = "FiraCode Nerd Font";
      };
      sansSerif = {
        package = f;
        name = "FiraCode Nerd Font";
      };
      monospace = {
        package = f;
        name = "FiraCode Nerd Font";
      };
      emoji = {
        package = f;
        name = "FiraCode Nerd Font";
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
