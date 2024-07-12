{
  inputs,
  pkgs,
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
}
