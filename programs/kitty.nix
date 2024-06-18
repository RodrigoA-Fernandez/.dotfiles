{config, lib, pkgs, stylix, ...}:{
 fonts.fontconfig.enable = true;
 programs.kitty = {
   enable = false;
   font = {
     name  = "FiraCode";
     size = 12;
   };
   shellIntegration.enableZshIntegration = true;
   settings = {
     foreground = "#${stylix.base16Scheme.base05}";
     background = "#${stylix.base16Scheme.base00}";
     cursor = "#${stylix.base16Scheme.base07}";
     cursor_text_color = "#${stylix.base16Scheme.base01}";
   };
 };
 home.file.".config/kitty/kitty.conf".text = ''
    font_family Firacode
    font_size 12

    foreground  #${stylix.base16Scheme.base05}
    background  #${stylix.base16Scheme.base00}
    cursor  #${stylix.base16Scheme.base07}
    cursor_text_color  #${stylix.base16Scheme.base01}

 '';
}
