{
  config,
  pkgs,
  ...
}:
let
  mainMod = "SUPER";
in
{

  home.packages = [
    pkgs.hyprpaper
    pkgs.swappy
    pkgs.grim
    pkgs.slurp
    pkgs.xdg-desktop-portal-hyprland
    pkgs.xdg-desktop-portal-gtk
    pkgs.libnotify
    pkgs.cliphist
  ];

  xdg.portal.config = {
    default = [
      "hyprland"
      "gtk"
    ];
  };
  home.file.".config/hypr/hyprland.conf".text = ''
    exec-once = syncthing 
    exec-once = hyprpaper
    exec-once = systemctl --user enable opentabletdriver.service --now
    exec-once = libinput-gestures
    exec-once = hyprpanel

    debug:disable_logs = false

    input {
        kb_layout = es
        follow_mouse = 1
        touchpad  {
            natural_scroll = yes
        }

        sensitivity = 0 # -1.0 - 1.0, 0 means no modification.
        accel_profile = flat
        kb_options=caps:swapescape
    }

    general  {
        gaps_in = 5
        gaps_out = 10
        border_size = 2
        col.inactive_border = rgba(${config.lib.stylix.colors.base07}ff)
        col.active_border = rgba(${config.lib.stylix.colors.base09}ff)
        layout = dwindle
    }

    misc  {
        disable_hyprland_logo = no
    }

     decoration  {
         # See https://wiki.hyprland.org/Configuring/Variables/ for more

         rounding = 5

         blur  {
             enabled = true
             size = 7
             passes = 4
             new_optimizations = true
         }

         blurls = lockscreen
     }

    animations  {
        enabled = true

        # Some default animations, see https://wiki.hyprland.org/Configuring/Animations/ for more
        bezier = myBezier, 0.10, 0.9, 0.1, 1.05

        animation = windows, 1, 7, myBezier, slide
        animation = windowsOut, 1, 7, myBezier, slide
        animation = border, 1, 10, default
        animation = fade, 1, 7, default
        animation = workspaces, 1, 6, default
        animation = specialWorkspace, 1, 6, myBezier, slidevert
    }

    dwindle  {
        # See https://wiki.hyprland.org/Configuring/Dwindle-Layout/ for more
        pseudotile = yes # master switch for pseudotiling. Enabling is bound to mainMod + P in the keybinds section below
        preserve_split = yes # you probably want this
    }


    gesture = 3, horizontal, workspace


    # Example windowrule v1
    windowrule = float, title:^(thunar)$
    windowrule = float, title:^(btop)$
    windowrule = float, title:^(update-sys)$

    windowrulev2 = opacity 0.8 0.8,class:^(kitty)$
    windowrulev2 = animation popin,class:^(kitty)$,title:^(update-sys)$
    windowrulev2 = animation popin,class:^(thunar)$
    windowrulev2 = opacity 0.8 0.8,class:^(thunar)$
    windowrulev2 = opacity 0.8 0.8,class:^(VSCodium)$
    windowrulev2 = animation popin,class:^(chromium)$
    windowrulev2 = move cursor -3% -105%,class:^(wofi)$
    windowrulev2 = noanim,class:^(wofi)$
    windowrulev2 = opacity 0.8 0.6,class:^(wofi)$

    bind = ${mainMod}, Q, exec, kitty
    bind = ALT, F4, killactive,
    bind = ${mainMod}, M, exec, ags -t powermenu
    bind = ${mainMod} SHIFT, M, exit,
    bind = ${mainMod}, E, exec, thunar
    bind = ${mainMod}, V, togglefloating,
    bind = ${mainMod}, C, exec, chromium
    bind = ${mainMod}, O, exec, obsidian
    bind = ${mainMod}, F, fullscreen,
    bind = ${mainMod}, S, exec, slurp | grim -g - - | wl-copy
    bind = ${mainMod}, T, exec, ~/.config/hypr/latexocr.s
    bind = ALT, V, exec, cliphist list | wofi -dmenu | cliphist decode | wl-copy
    bind = ${mainMod}, Space, exec, ~/.config/rofi/launcher.sh

    bind = ${mainMod}, left, movefocus, l
    bind = ${mainMod}, right, movefocus, r
    bind = ${mainMod}, up, movefocus, u
    bind = ${mainMod}, down, movefocus, d

    bind = ${mainMod} Shift, left, movewindow, l
    bind = ${mainMod} Shift, right, movewindow, r
    bind = ${mainMod} Shift, up, movewindow, u
    bind = ${mainMod} Shift, down, movewindow, d

    bind = ${mainMod}, H, movefocus, l
    bind = ${mainMod}, L, movefocus, r
    bind = ${mainMod}, K, movefocus, u
    bind = ${mainMod}, J, movefocus, d

    bind = ${mainMod} Shift, H, movewindow, l
    bind = ${mainMod} Shift, L, movewindow, r
    bind = ${mainMod} Shift, K, movewindow, u
    bind = ${mainMod} Shift, J, movewindow, d


    bind = ${mainMod}, 1, workspace, 1
    bind = ${mainMod}, 2, workspace, 2
    bind = ${mainMod}, 3, workspace, 3
    bind = ${mainMod}, 4, workspace, 4
    bind = ${mainMod}, 5, workspace, 5
    bind = ${mainMod}, 6, workspace, 6
    bind = ${mainMod}, 7, workspace, 7
    bind = ${mainMod}, 8, workspace, 8
    bind = ${mainMod}, 9, workspace, 9
    bind = ${mainMod}, 0, workspace, 10

    bind = ${mainMod} SHIFT, 1, movetoworkspace, 1
    bind = ${mainMod} SHIFT, 2, movetoworkspace, 2
    bind = ${mainMod} SHIFT, 3, movetoworkspace, 3
    bind = ${mainMod} SHIFT, 4, movetoworkspace, 4
    bind = ${mainMod} SHIFT, 5, movetoworkspace, 5
    bind = ${mainMod} SHIFT, 6, movetoworkspace, 6
    bind = ${mainMod} SHIFT, 7, movetoworkspace, 7
    bind = ${mainMod} SHIFT, 8, movetoworkspace, 8
    bind = ${mainMod} SHIFT, 9, movetoworkspace, 9
    bind = ${mainMod} SHIFT, 0, movetoworkspace, 10

    bind = ${mainMod} Ctrl, H, resizeactive, -10 0
    bind = ${mainMod} Ctrl, L, resizeactive, 10 0
    bind = ${mainMod} Ctrl, K, resizeactive, 0 -10
    bind = ${mainMod} Ctrl, H, resizeactive, 0 10

    bindm = ${mainMod}, mouse:272, movewindow
    bindm = ${mainMod}, mouse:273, resizewindow

    monitor = eDP-1, preferred, 0x0, 1 
    monitor = HDMI-A-1, preferred, -554x-1080, 1
    monitor = DP-1,preferred, 1366x-473, 1
  '';

  home.file.".config/hypr/latexocr.sh" = {
    text = ''
      #!/usr/bin/env bash
      out=$(slurp | grim -g - - > /tmp/texocr.png)

      notify-send "Comienzo escaneo LaTeX" 
      pix2tex /tmp/texocr.png | sed 's/^[^:]*: //'`
      wl-copy "$out"
      notify-send "Escaneo LaTeX finalizado"
    '';
    executable = true;
  };
}
