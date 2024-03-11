{config, lib, pkgs, ...}:{
 fonts.fontconfig.enable = true;
 programs.kitty = {
   enable = true;
   font = {
     name  = "FiraCode";
     size = 12;
   };
   shellIntegration.enableZshIntegration = true;
   settings = {
     foreground = "#${config.colorScheme.palette.base05}";
     background = "#${config.colorScheme.palette.base00}";
     cursor = "#${config.colorScheme.palette.base07}";
     cursor_text_color = "#${config.colorScheme.palette.base01}";
   };
 };
}
