{pkgs, config, ...}:let
terminal.colors = {
    "DESKTOP-G7U6IGR" = "xterm-256color";
    "pcdrdg" = "xterm-kitty";
  };
in{
  
  home.file.".tmux.conf".text = ''
    unbind r
    bind r source-file ~/.tmux.conf
    
    setw -g mode-keys vi

    bind-key h select-pane -L
    bind-key j select-pane -D
    bind-key k select-pane -U
    bind-key l select-pane -R
    
    set-option -sg escape-time 10
    set-option -g focus-events on
    set-option -sa terminal-features ',${terminal.colors."${builtins.getEnv "HOSTNAME"}"}:RGB'

    set -g @plugin 'tmux-plugins/tpm'
    set -g @plugin 'christoomey/vim-tmux-navigator'
    set -g @plugin 'jimeh/tmuxifier'
    #set -g @plugin 'tinted-theming/tinted-tmux'

    set -g @plugin 'egel/tmux-gruvbox'
    set -g @tmux-gruvbox 'dark' # or 'light'   

    set -g status-position top
    
    run '~/.config/tmux/tpm/tpm'
  '';
# Si en algún momento quito tmuxifier hay que recordar cambiar la linea que lo añade al path en .zshrc
}




