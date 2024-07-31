{ config, pkgs, inputs, stylix, ... }:
{
   gtk = {
     iconTheme.package = pkgs.gruvbox-plus-icons;
     iconTheme.name = "Gruvbox-Plus-Dark";
   };

  home.username = "rodrigo";
  home.homeDirectory = "/home/rodrigo";

  home.stateVersion = "23.11"; 

  programs.neovim = {
    enable = false;
    defaultEditor = true;
  };

  # services.kdeconnect = {
  #   enable = true;
  #   package = pkgs.kdePackages.kdeconnect-kde;
  #   indicator = true;
  # };

 home.packages = [
#    #Uni
   pkgs.obsidian
   pkgs.postman
   pkgs.xournalpp
#    pkgs.rnote
#    pkgs.jetbrains.idea-ultimate
#    pkgs.jre
#    pkgs.texliveFull
#
#    #SO
   pkgs.localsend
   pkgs.flutter319
#    pkgs.waybar
#    pkgs.xdg-desktop-portal
#    pkgs.papirus-icon-theme
#    pkgs.evince
#    pkgs.qt6Packages.qtstyleplugin-kvantum
#    pkgs.candy-icons
#    pkgs.wlogout
#    pkgs.killall
#    pkgs.jq
#    pkgs.wmctrl
#    pkgs.gvfs
#    pkgs.gnome-text-editor
#    pkgs.chromium
#    pkgs.gnome.file-roller
#    pkgs.python3
#    pkgs.playerctl
#    pkgs.pulseaudio
#    pkgs.eww
#    pkgs.gnome.adwaita-icon-theme
#
#    #Miscelanea
#    pkgs.neofetch
#    pkgs.wl-clipboard
   pkgs.whatsapp-for-linux
#    pkgs.gimp
#    pkgs.libreoffice-qt
#    pkgs.hunspell
#    pkgs.hunspellDicts.uk_UA
#    pkgs.hunspellDicts.es_ES
   pkgs.thunderbird
 ];

  home.sessionVariables = {
    GTK_USE_PORTAL = "1";
    EDITOR = "nvim";
  };

  imports = [
    # inputs.ags.homeManagerModules.default
    ./programs/waybar.nix
    ./programs/zsh.nix
    ./programs/hyprland.nix
    ./programs/starship.nix
    ./programs/rofi.nix
    ./programs/eww.nix
    ./programs/tmux.nix
    ./programs/libinput-gestures.nix
    ./stylix.nix
     ./programs/ags.nix
    ];

  
  home.file.".config/nixpkgs/config.nix".text = ''
    { allowUnfree = true; }
  '';

  programs.firefox = {
    enable = true;
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
