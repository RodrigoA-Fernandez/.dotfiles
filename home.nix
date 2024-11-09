{ config, pkgs, inputs, stylix, lib, ... }:
{
   gtk = {
     iconTheme.package = pkgs.gruvbox-plus-icons;
     iconTheme.name = "Gruvbox-Plus-Dark";
   };

  home.username = "rodrigo";
  home.homeDirectory = "/home/rodrigo";

  home.stateVersion = "24.11"; 


  # services.kdeconnect = {
  #   enable = true;
  #   package = pkgs.kdePackages.kdeconnect-kde;
  #   indicator = true;
  # };

  home.packages = [
  # pkgs.xterm
     #Uni
    pkgs.obsidian
    pkgs.postman
    pkgs.xournalpp
    pkgs.geogebra
 #    pkgs.rnote
 #    pkgs.jetbrains.idea-ultimate
 #    pkgs.jre
    pkgs.texliveFull
 #
    #SO
    pkgs.localsend
    pkgs.flutter319
    pkgs.adwaita-icon-theme
    pkgs.tmux
    pkgs.tmuxinator
    pkgs.cargo
    pkgs.ripgrep
    pkgs.xfce.thunar
    pkgs.gtk4
    pkgs.libinput-gestures
    pkgs.wmctrl
 #    #Miscelanea
 #    pkgs.neofetch
 #    pkgs.wl-clipboard
    pkgs.whatsapp-for-linux
 #    pkgs.gimp
    pkgs.libreoffice-qt
 #    pkgs.hunspell
 #    pkgs.hunspellDicts.uk_UA
 #    pkgs.hunspellDicts.es_ES
    pkgs.thunderbird

    #Nvim
    # pkgs.neovim
    pkgs.git
    pkgs.gcc
    pkgs.unzip
    pkgs.fzf
    pkgs.cbfmt
    pkgs.zathura
    pkgs.neovide

    #Lorry
    pkgs.direnv

    pkgs.libnotify
    (pkgs.callPackage ./programs/latexocr {inherit inputs;})
     ];

  services.lorri.enable = true;

  home.sessionVariables = {
    GTK_USE_PORTAL = "1";
    EDITOR = "nvim";
    PKG_CONFIG_PATH="${pkgs.luajitPackages.magick}/lib/";
  };


  imports = [
    # ./programs/waybar.nix
    ./programs/zsh.nix
    ./programs/nvim.nix
    ./programs/hyprland.nix
    ./programs/starship.nix
    # ./programs/rofi.nix
    # ./programs/eww.nix
    ./programs/tmux.nix
    ./programs/libinput-gestures.nix
    ./programs/ags.nix
    ./programs/yazi.nix
    ./programs/kitty.nix
    ];

  programs.firefox = {
      enable = true;
      profiles = {
        default = {
          id = 0;
          name = "default";
          isDefault = true;
          settings = {
            # "browser.startup.homepage" = "https://duckduckgo.com";
            "browser.search.defaultenginename" = "Google";
            "browser.search.order.1" = "Google";

            "signon.rememberSignons" = false;
            "widget.use-xdg-desktop-portal.file-picker" = 0;
            "browser.aboutConfig.showWarning" = false;
            "browser.compactmode.show" = true;
            "browser.cache.disk.enable" = false; # Be kind to hard drive

            "mousewheel.default.delta_multiplier_x" = 20;
            "mousewheel.default.delta_multiplier_y" = 20;
            "mousewheel.default.delta_multiplier_z" = 20;

            # Firefox 75+ remembers the last workspace it was opened on as part of its session management.
            # This is annoying, because I can have a blank workspace, click Firefox from the launcher, and
            # then have Firefox open on some other workspace.
            "widget.disable-workspace-management" = true;
          };
          search = {
            force = true;
            default = "Google";
            order = [ "Google" ];
          };
        };
      };
    };
}
