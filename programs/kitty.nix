{config, lib, pkgs, stylix, ...}:let 
in{
 fonts.fontconfig.enable = true;
 stylix.targets.kitty.enable = true;
 programs.kitty = {
   enable = false;
   #font = {
   #  name  = "FiraCode";
   #  size = 12;
   #};
   shellIntegration.enableZshIntegration = true;
   #settings = {
   #  foreground = "#${config.colorScheme.palette.base05}";
   #  background = "#${config.colorScheme.palette.base00}";
   #  cursor = "#${config.colorScheme.palette.base07}";
   #  cursor_text_color = "#${config.colorScheme.palette.base01}";
   #};
 };
 # home.file.".config/kitty/kitty.conf".text = ''
 #    font_family Firacode
 #    font_size 12
 #
 #    foreground  #${config.colorScheme.palette.base05}
 #    background  #${config.colorScheme.palette.base00}
 #    cursor  #${config.colorScheme.palette.base07}
 #    cursor_text_color  #${config.colorScheme.palette.base01}
 #
 # '';
}
