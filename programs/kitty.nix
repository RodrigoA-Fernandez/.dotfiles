{
  ...
}:
let
in
{
  fonts.fontconfig.enable = true;
  stylix.targets.kitty.enable = true;
  programs.kitty = {
    enable = false;
    shellIntegration.enableZshIntegration = true;
  };
}
