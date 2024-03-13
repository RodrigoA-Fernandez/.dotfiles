{config, lib, pkgs, ...}:
let
 mainMod = "SUPER";
in{
 wayland.windowManager.hyprland = {
    enable = true;
    package = pkgs.hyprland;
    xwayland.enable = true;

    systemd.enable = true;
    settings = {
        exec-once = ["syncthing" "libinput-gestures-setup autostart start"];
        input = {
            kb_layout = "es";

            follow_mouse = "1";

            touchpad = {
                natural_scroll = "yes";
            };

            sensitivity = "0"; # -1.0 - 1.0, 0 means no modification.
        };

        general = {
            gaps_in = "5";
            gaps_out = "10";
            border_size = "2";
            "col.active_border" = "rgba(${config.colorScheme.palette.base08}ff)";
            "col.inactive_border" = "rgba(${config.colorScheme.palette.base07}ff)";
        
            layout = "dwindle";
        };

        misc = {
            disable_hyprland_logo = "no";
        };

        decoration = {
            # See https://wiki.hyprland.org/Configuring/Variables/ for more
        
            rounding = "5";
            
            blur = {
                enabled = true;
                size = "7";
                passes = "4";
                new_optimizations = "true";
            };
        
            blurls = "lockscreen";
        
            drop_shadow = "yes";
            shadow_range = "4";
            shadow_render_power = "3";
            "col.shadow" = "rgba(${config.colorScheme.palette.base00}aa)";
        };

        animations = {
            enabled = "yes";
        
            # Some default animations, see https://wiki.hyprland.org/Configuring/Animations/ for more
            bezier = "myBezier, 0.10, 0.9, 0.1, 1.05";
        
            animation = [
             "windows, 1, 7, myBezier, slide"
             "windowsOut, 1, 7, myBezier, slide"
             "border, 1, 10, default"
             "fade, 1, 7, default"
             "workspaces, 1, 6, default"
        	];
        };

        dwindle = {
            # See https://wiki.hyprland.org/Configuring/Dwindle-Layout/ for more
            pseudotile = "yes"; # master switch for pseudotiling. Enabling is bound to mainMod + P in the keybinds section below
            preserve_split = "yes"; # you probably want this
        };

        master = {
            # See https://wiki.hyprland.org/Configuring/Master-Layout/ for more
            new_is_master = true;
        };

        gestures = {
            # See https://wiki.hyprland.org/Configuring/Variables/ for more
            workspace_swipe = "on";
        };


# Ex    ample windowrule v1
        windowrule = [
         "float,^(pavucontrol)$"
         "float,^(blueman-manager)$"
         "float,^(nm-connection-editor)$"
         "float,^(chromium)$"
         "float,^(thunar)$"
         "float, title:^(btop)$"
         "float, title:^(update-sys)$"
        ];
# Ex    ample windowrule v2
# wi    ndowrulev2 = float,class:^(kitty)$,title:^(kitty)$
        windowrulev2 = [ 
         "opacity 0.8 0.8,class:^(kitty)$"
         "animation popin,class:^(kitty)$,title:^(update-sys)$"
         "animation popin,class:^(thunar)$"
         "opacity 0.8 0.8,class:^(thunar)$"
         "opacity 0.8 0.8,class:^(VSCodium)$"
         "animation popin,class:^(chromium)$"
         "move cursor -3% -105%,class:^(wofi)$"
         "noanim,class:^(wofi)$"
         "opacity 0.8 0.6,class:^(wofi)$"
        ];



        bind =[
            "${mainMod}, Q, exec, kitty  "
            "ALT, F4, killactive, "
            "${mainMod}, L, exec, swaylock "
            "${mainMod}, M, exec, wlogout --protocol layer-shell "
            "${mainMod} SHIFT, M, exit, "
            "${mainMod}, E, exec, thunar "
            "${mainMod}, V, togglefloating, "
            "${mainMod}, SPACE, exec, wofi "
            "${mainMod}, P, pseudo, "
            "${mainMod}, F, exec, firefox "
            "${mainMod}, J, togglesplit, "
            "${mainMod}, S, exec, grim -g '$(slurp)' - | swappy -f - "
            "ALT, V, exec, cliphist list | wofi -dmenu | cliphist decode | wl-copy "
            "${mainMod}, Space, exec, rofi -show drun"
        
            "${mainMod}, left, movefocus, l"
            "${mainMod}, right, movefocus, r"
            "${mainMod}, up, movefocus, u"
            "${mainMod}, down, movefocus, d"

            "${mainMod} Shift, left, movewindow, l"
            "${mainMod} Shift, right, movewindow, r"
            "${mainMod} Shift, up, movewindow, u"
            "${mainMod} Shift, down, movewindow, d"
            
            "${mainMod}, 1, workspace, 1"
            "${mainMod}, 2, workspace, 2"
            "${mainMod}, 3, workspace, 3"
            "${mainMod}, 4, workspace, 4"
            "${mainMod}, 5, workspace, 5"
            "${mainMod}, 6, workspace, 6"
            "${mainMod}, 7, workspace, 7"
            "${mainMod}, 8, workspace, 8"
            "${mainMod}, 9, workspace, 9"
            "${mainMod}, 0, workspace, 10"

            "${mainMod} SHIFT, 1, movetoworkspace, 1"
            "${mainMod} SHIFT, 2, movetoworkspace, 2"
            "${mainMod} SHIFT, 3, movetoworkspace, 3"
            "${mainMod} SHIFT, 4, movetoworkspace, 4"
            "${mainMod} SHIFT, 5, movetoworkspace, 5"
            "${mainMod} SHIFT, 6, movetoworkspace, 6"
            "${mainMod} SHIFT, 7, movetoworkspace, 7"
            "${mainMod} SHIFT, 8, movetoworkspace, 8"
            "${mainMod} SHIFT, 9, movetoworkspace, 9"
            "${mainMod} SHIFT, 0, movetoworkspace, 10"
        ];

	binde = [
	    "${mainMod} Ctrl, left, resizeactive, -10 0"
            "${mainMod} Ctrl, right, resizeactive, 10 0"
            "${mainMod} Ctrl, up, resizeactive, 0 -10"
            "${mainMod} Ctrl, down, resizeactive, 0 10"
	];


        bindm = [ 
          "${mainMod}, mouse:272, movewindow"
          "${mainMod}, mouse:273, resizewindow"
        ];
    };
  };
}
