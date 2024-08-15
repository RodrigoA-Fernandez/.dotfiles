{ config, pkgs, inputs, stylix, ... }:
{
  stylix.enable = true;
  stylix.targets.gtk.enable = true;
  stylix.targets.kde.enable = true;
  stylix.targets.firefox.enable = true;


  stylix.autoEnable = true;
  # stylix.base16Scheme = "${pkgs.base16-schemes}/share/themes/gruvbox-dark-medium.yaml";
  stylix.base16Scheme = "${pkgs.base16-schemes}/share/themes/gruvbox-dark-hard.yaml";
  # stylix.base16Scheme = "${pkgs.base16-schemes}/share/themes/bright.yaml";
  stylix.image = ./images/wallpaper.jpg;

  stylix.fonts = {
    monospace = {
      package = pkgs.nerdfonts.override {fonts =["FiraCode"];};
      name = "FiraCode";
    };
  };
  
  stylix.polarity = "dark";

  stylix.cursor.package = pkgs.bibata-cursors;
  stylix.cursor.name = "Bibata-Modern-Ice";
  stylix.cursor.size = 20;
}
