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
#  home.packages = [
#    #Uni
#    pkgs.obsidian
#    pkgs.postman
#    pkgs.xournalpp
#    pkgs.rnote
#    pkgs.jetbrains.idea-ultimate
#    pkgs.jre
#    pkgs.texliveFull
#
#    pkgs.libsForQt5.dolphin
#    #SO
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
#    pkgs.whatsapp-for-linux
#    pkgs.gimp
#    pkgs.libreoffice-qt
#    pkgs.hunspell
#    pkgs.hunspellDicts.uk_UA
#    pkgs.hunspellDicts.es_ES
#    pkgs.thunderbird
#
#    #Nvim
#    pkgs.stylua
#    pkgs.gnumake
#    pkgs.unzip
#    pkgs.ripgrep
#
#  ];

  home.sessionVariables = {
    GTK_USE_PORTAL = "1";
    EDITOR = "nvim";
  };

  imports = [
    ./programs/waybar.nix
    ./programs/zsh.nix
    ./programs/hyprland.nix
    ./programs/starship.nix
    ./programs/rofi.nix
    ./programs/eww.nix
    ./programs/tmux.nix
    ./programs/libinput-gestures.nix
    ./stylix.nix
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
