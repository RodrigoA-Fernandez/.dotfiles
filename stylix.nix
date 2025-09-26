{ config, pkgs, ... }:
{
  # Habilitamos Stylix
  stylix = {
    enable = true;
    autoEnable = true;
    polarity = "dark";

    # Imagen de fondo
    image = ./images/wallpaper.jpg;

    # Esquema de colores
    base16Scheme = "${pkgs.base16-schemes}/share/themes/gruvbox-dark-hard.yaml";

    # Fuentes
    fonts = {
      monospace = {
        package = pkgs.nerd-fonts.jetbrains-mono;
        name = "JetBrainsMono Nerd Font Mono";
      };
    };

    # Cursor
    cursor = {
      package = pkgs.bibata-cursors;
      name = "Bibata-Modern-Ice";
      size = 20;
    };

    # Targets (aplicaciones/entornos)
    targets = {
      gtk.enable = true;
      # kde.enable = true;
      # hyprland.enable = false;
    };
  };
  fonts.fontconfig.defaultFonts.monospace = [ "JetBrainsMono" ];
}
