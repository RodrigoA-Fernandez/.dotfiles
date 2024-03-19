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

  programs.neovim = {
    enable = true;
    defaultEditor = true;
  };
  home.packages = [
    #Uni
    pkgs.obsidian
    pkgs.postman
    pkgs.xournalpp
    pkgs.rnote
    pkgs.jetbrains.idea-ultimate
    pkgs.jre
    pkgs.texliveFull

    pkgs.libsForQt5.dolphin
    #SO
    pkgs.waybar
    pkgs.xdg-desktop-portal
    pkgs.papirus-icon-theme
    pkgs.evince
    pkgs.qt6Packages.qtstyleplugin-kvantum
    pkgs.candy-icons
    pkgs.wlogout
    pkgs.killall
    pkgs.jq
    pkgs.wmctrl
    pkgs.gvfs
    pkgs.gnome-text-editor
    pkgs.chromium
    pkgs.gnome.file-roller
    pkgs.python3
    pkgs.playerctl
    pkgs.pulseaudio
    pkgs.eww
    pkgs.gnome.adwaita-icon-theme

    #Miscelanea
    pkgs.neofetch
    pkgs.wl-clipboard

    #Nvim
    pkgs.stylua
    pkgs.gnumake
    pkgs.unzip
    pkgs.libgcc
    pkgs.lua-language-server
    pkgs.ripgrep

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
    ./programs/nvim.nix
    ./programs/eww.nix
    ./programs/xournalpp.nix
  ];

  colorScheme = inputs.nix-colors.colorSchemes.gruvbox-dark-medium;

  home.file.".config/nixpkgs/config.nix".text = ''
    { allowUnfree = true; }
  '';

 
  xdg.mimeApps = {
    enable = true;
    defaultApplications = {
      "application/pdf" = ["evince.desktop"];
      "inode/directory" = ["thunar.desktop"];

    };
    associations.added = {
      "application/pdf"=["com.github.xournalpp.xournalpp.desktop"];
      "application/x-xopp"=["com.github.xournalpp.xournalpp.desktop"];
    };
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
