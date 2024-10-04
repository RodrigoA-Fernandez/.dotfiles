{pkgs, config, ...}:let
terminal.colors = {
    "DESKTOP-G7U6IGR\n" = "xterm-256color";
    "nixos\n" = "xterm-256color";
    "pcdrdg\n" = "xterm-kitty";
  };
in{
  
  programs.tmux = {
    enable = true;
    keyMode = "vi";
    escapeTime = 10;
    extraConfig = ''
      unbind r
      bind r source-file ~/.tmux.conf

      bind-key h select-pane -L
      bind-key j select-pane -D
      bind-key k select-pane -U
      bind-key l select-pane -R

      set-option -g focus-events on
      set-option -sa terminal-features ',xterm-kitty:RGB'

      set -g @tmux_power_theme 'coral'

      set -g status-position top

      set -gq allow-passthrough on

      set -g visual-activity off
    '';
    plugins = 
      [
        pkgs.tmuxPlugins.vim-tmux-navigator
        pkgs.tmuxPlugins.power-theme

      ];
  };
#   home.file.".tmux.conf".text = ''
#
#
#
# set -g @plugin 'tmux-plugins/tpm'
#
#
#
# run '~/.config/tmux/tpm/tpm'  '';
}




