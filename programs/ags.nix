{
  inputs,
  pkgs,
  config,
  ...
}: {
   imports = [
     inputs.ags.homeManagerModules.default
   ];

  home.packages = with pkgs; [
    esbuild
    nodejs_22
    dart-sass
    fd
    brightnessctl
    swww
    inputs.matugen.packages.${system}.default
    slurp
    wf-recorder
    wl-clipboard
    wayshot
    swappy
    hyprpicker
    pavucontrol
    networkmanager
    gtk3
    power-profiles-daemon
  ];

  programs.ags = {
    enable = true;
    configDir = ../ags;
    extraPackages = with pkgs; [
      accountsservice
    ];
  };


 home.file.".local/share/ags/colors.json".text = builtins.toJSON {
     "primary-bg"  = "#${config.lib.stylix.colors.base09}";
     "primary-fg"  = "#${config.lib.stylix.colors.base00}";
     "error-bg"    = "#${config.lib.stylix.colors.base01}";
     "error-fg"    = "#${config.lib.stylix.colors.base08}";

     "charging-fg" = "#${config.lib.stylix.colors.base0A}";
  };
}
