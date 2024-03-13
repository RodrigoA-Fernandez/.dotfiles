{ config, pkgs, inputs, ... }:
let
in{
  nixpkgs = {
    config = {
      allowUnfree = true;
      allowUnfreePredicate = (_: true);
    };
  };

  gtk = {
    enable = true;
    theme = {
      name = "Gruvbox-Dark-BL";
      package = pkgs.gruvbox-gtk-theme;
    };
    iconTheme.package = pkgs.gruvbox-plus-icons;
    iconTheme.name = "Gruvbox-Plus-Dark";
  };

  home.username = "rodrigo";
  home.homeDirectory = "/home/rodrigo";

  home.stateVersion = "23.11"; 

  programs.eww = {
    enable = true;
    configDir = ./programs/eww;
  };
  home.packages = [
    #Uni
    pkgs.obsidian
    pkgs.postman
    pkgs.netbeans
    pkgs.firefox
    pkgs.xournalpp
    
    #SO
    pkgs.waybar
    pkgs.opentabletdriver
    pkgs.xdg-desktop-portal
    pkgs.papirus-icon-theme
    pkgs.xfce.thunar 
    pkgs.libsForQt5.okular
    pkgs.qt6Packages.qtstyleplugin-kvantum
    pkgs.candy-icons
    pkgs.wlogout
    pkgs.killall
    pkgs.jq
    pkgs.libinput-gestures
    pkgs.wmctrl

    #Miscelanea
    pkgs.neofetch
    pkgs.wl-clipboard

    #Nvim
    pkgs.stylua
    pkgs.gnumake
    pkgs.unzip
    pkgs.libgcc

  ];

  home.sessionVariables = {
    GTK_USE_PORTAL = "1";
    EDITOR = "nvim";
  };

  imports = [
    inputs.nix-colors.homeManagerModules.default
    ./programs/waybar.nix
    ./programs/zsh.nix
    ./programs/hyprland.nix
    ./programs/kitty.nix
    ./programs/starship.nix
    ./programs/rofi.nix
    ./programs/git.nix
    ./programs/syncthing.nix
  ];

  colorScheme = inputs.nix-colors.colorSchemes.gruvbox-dark-medium;

  home.file = {
    # # Building this configuration will create a copy of 'dotfiles/screenrc' in
    # # the Nix store. Activating the configuration will then make '~/.screenrc' a
    # # symlink to the Nix store copy.
    # ".screenrc".source = dotfiles/screenrc;

    # # You can also set the file content immediately.
    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';
  };

  

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
