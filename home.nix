{
  pkgs,
  stylix,
  ...
}:
{
  gtk = {
    iconTheme.package = pkgs.gruvbox-plus-icons;
    iconTheme.name = "Gruvbox-Plus-Dark";
  };

  home.username = "rodrigo";
  home.homeDirectory = "/home/rodrigo";

  home.stateVersion = "23.11";

  home.packages = [
    # pkgs.xterm
    #Uni
    pkgs.obsidian
    pkgs.postman
    pkgs.xournalpp
    pkgs.geogebra6
    pkgs.nerd-fonts.jetbrains-mono
    #    pkgs.jetbrains.idea-ultimate
    pkgs.texliveFull
    #
    #SO
    pkgs.localsend
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
    pkgs.whatsapp-for-linux
    pkgs.thunderbird

    #Nvim
    pkgs.git
    pkgs.gcc
    pkgs.unzip
    pkgs.fzf
    pkgs.cbfmt
    pkgs.tree-sitter
    pkgs.marksman
    pkgs.lua-language-server
    pkgs.stylua

    pkgs.chromium
  ];

  home.sessionVariables = {
    GTK_USE_PORTAL = "1";
    EDITOR = "nvim";
  };

  imports = [
    # ./programs/waybar.nix
    ./programs/zsh.nix
    ./programs/hyprland.nix
    ./programs/starship.nix
    ./programs/rofi.nix
    ./programs/tmux.nix
    ./programs/libinput-gestures.nix
    ./programs/hyprpanel.nix
    ./programs/yazi.nix
    ./programs/kitty.nix
    ./programs/nvim.nix
  ];
  programs.firefox = {
    enable = true;
    profiles = {
      default = {
        id = 0;
        name = "default";
        isDefault = true;
        settings = {
          "browser.search.defaultenginename" = "google";
          "browser.search.order.1" = "google";

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
          default = "google";
          order = [ "google" ];
        };
      };
    };
  };
  stylix.targets.firefox.profileNames = [
    "default"
  ];
}
