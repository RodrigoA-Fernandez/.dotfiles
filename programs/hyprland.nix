{config, lib, pkgs, inputs, ...}:
let
 mainMod = "SUPER";
in{
#  home.file.".config/hypr/hyprpaper.conf".text = ''
# preload = ~/.dotfiles/images/wallpaper.jpg
# wallpaper = eDP-1,~/.dotfiles/images/wallpaper.jpg
#  '';

home.packages = [
    pkgs.hyprpaper
    pkgs.swappy
    pkgs.grim
    pkgs.slurp
    pkgs.xdg-desktop-portal-hyprland
    pkgs.xdg-desktop-portal-gtk
];

xdg.portal.config = {
  default = [
    "hyprland"
    "gtk"
  ];
};
	#  wayland.windowManager.hyprland = {
	#    enable = false;
	#    # "$mod" = "${mainMod}";
	#    settings = {
	#     "exec-once" = [
	# 	"syncthing"
	# 	"hyprpape"
	# 	"systemctl --user enable opentabletdriver.service --now"
	# 	"libinput-gestures-setup star"
	# 	"ag"
	#     ];
	#     input = {
	#       kb_layout = "es";
	#       follow_mouse = 1;
	#       touchpad  = {
	# 	  natural_scroll = "yes";
	#       };
	#       sensitivity = 0; # -1.0 - 1.0, 0 means no modification.
	#     };
	#     general = {
	# 	    gaps_in = 5;
	# 	    gaps_out = 10;
	# 	    border_size = 2;
	# 	    "col.active_border" = "rgba(${config.lib.stylix.colors.base08}ff)";
	# 	    "col.inactive_border" = "rgba(${config.lib.stylix.colors.base07}ff)";
	# 	    layout = "dwindle";
	# 	};
	#
	#     misc = {
	#       disable_hyprland_logo = "no";
	#     };
	#
	# 	decoration = {
	# 	    # See https://wiki.hyprland.org/Configuring/Variables/ for more
	#
	# 	    rounding = 5;
	#
	# 	    blur = {
	# 		enabled = true;
	# 		size = 7;
	# 		passes = 4;
	# 		new_optimizations = true;
	# 	    };
	#
	# 	    blurls = "lockscreen";
	#
	# 	    drop_shadow = "true";
	# 	    shadow_range = 4;
	# 	    shadow_render_power = 3;
	# 	    "col.shadow" = "rgba(${config.lib.stylix.colors.base00}aa)";
	# 	};
	#
	# 	animations  = {
	# 	    enabled = true;
	#
	# 	    # Some default animations, see https://wiki.hyprland.org/Configuring/Animations/ for more
	# 	    bezier = "myBezier, 0.10, 0.9, 0.1, 1.05";
	#
	# 	    animation = [
	# 	     "windows, 1, 7, myBezier, slide"
	# 	     "windowsOut, 1, 7, myBezier, slide"
	# 	     "border, 1, 10, default"
	# 	     "fade, 1, 7, default"
	# 	     "workspaces, 1, 6, default"
	# 	     "specialWorkspace, 1, 6, myBezier, slidevert"
	# 	     ];
	# 	};
	#
	# 	dwindle  = {
	# 	    # See https://wiki.hyprland.org/Configuring/Dwindle-Layout/ for more
	# 	    pseudotile = "yes"; # master switch for pseudotiling. Enabling is bound to mainMod + P in the keybinds section below
	# 	    preserve_split = "yes"; # you probably want this
	# 	};
	#
	# 	# master  {
	# 	#     # See https://wiki.hyprland.org/Configuring/Master-Layout/ for more
	# 	#     new_is_master = true
	# 	# }
	#
	# 	gestures = {
	# 	    # See https://wiki.hyprland.org/Configuring/Variables/ for more
	# 	    workspace_swipe = "on";
	# 	};
	#
	#
	# 	# Example windowrule v1
	# 	windowrule = [ 
	# 	"float,^(pavucontrol)$"
	# 	"float,^(nm-connection-editor)$"
	# 	"float,^(chromium)$"
	# 	"float,^(thunar)$"
	# 	"float, title:^(btop)$"
	# 	"float, title:^(update-sys)$"
	# 	];
	#
	# 	windowrulev2 =[
	# 	 "opacity 0.8 0.8,class:^(kitty)$"
	# 	 "animation popin,class:^(kitty)$,title:^(update-sys)$"
	# 	 "animation popin,class:^(thunar)$"
	# 	 "opacity 0.8 0.8,class:^(thunar)$"
	# 	 "opacity 0.8 0.8,class:^(VSCodium)$"
	# 	 "animation popin,class:^(chromium)$"
	# 	 "move cursor -3% -105%,class:^(wofi)$"
	# 	 "noanim,class:^(wofi)$"
	# 	 "opacity 0.8 0.6,class:^(wofi)$"
	# 	];
	#
	# 	bind =[
	# 	" ${mainMod}, Q, exec, kitty  "
	# 	" ALT, F4, killactive, "
	# 	" ${mainMod}, M, exec, ags -t powermenu"
	# 	" ${mainMod}, Tab, exec, ags -t overview"
	# 	" ${mainMod} SHIFT, M, exit, "
	# 	" ${mainMod}, E, exec, thunar "
	# 	" ${mainMod}, V, togglefloating, "
	# 	" ${mainMod}, C, exec, chromium "
	# 	" ${mainMod}, O, exec, obsidian "
	# 	" ${mainMod}, P, pseudo, "
	# 	" ${mainMod}, F, fullscreen, "
	# 	" ALT, V, exec, cliphist list | wofi -dmenu | cliphist decode | wl-copy "
	# 	" ${mainMod}, Space, exec, ags -t launcher"
	#
	# 	" ${mainMod}, left, movefocus, l"
	# 	" ${mainMod}, right, movefocus, r"
	# 	" ${mainMod}, up, movefocus, u"
	# 	" ${mainMod}, down, movefocus, d"
	#
	# 	"${mainMod} Shift, left, movewindow, l"
	# 	"${mainMod} Shift, right, movewindow, r"
	# 	"${mainMod} Shift, up, movewindow, u"
	# 	"${mainMod} Shift, down, movewindow, d"
	#
	# 	"${mainMod}, 1, workspace, 1"
	# 	"${mainMod}, 2, workspace, 2"
	# 	"${mainMod}, 3, workspace, 3"
	# 	"${mainMod}, 4, workspace, 4"
	# 	"${mainMod}, 5, workspace, 5"
	# 	"${mainMod}, 6, workspace, 6"
	# 	"${mainMod}, 7, workspace, 7"
	# 	"${mainMod}, 8, workspace, 8"
	# 	"${mainMod}, 9, workspace, 9"
	# 	"${mainMod}, 0, workspace, 10"
	#
	# 	"${mainMod} SHIFT, 1, movetoworkspace, 1"
	# 	"${mainMod} SHIFT, 2, movetoworkspace, 2"
	# 	"${mainMod} SHIFT, 3, movetoworkspace, 3"
	# 	"${mainMod} SHIFT, 4, movetoworkspace, 4"
	# 	"${mainMod} SHIFT, 5, movetoworkspace, 5"
	# 	"${mainMod} SHIFT, 6, movetoworkspace, 6"
	# 	"${mainMod} SHIFT, 7, movetoworkspace, 7"
	# 	"${mainMod} SHIFT, 8, movetoworkspace, 8"
	# 	"${mainMod} SHIFT, 9, movetoworkspace, 9"
	# 	"${mainMod} SHIFT, 0, movetoworkspace, 10"
	#
	# 	"F86Launch4,   exec, ags -r 'recorder.start()'"
	# 	"{mainMod}, S,         exec, ags -r 'recorder.screenshot()'"
	# 	"${mainMod} SHIFT, S,    exec, ags -r 'recorder.screenshot(true)'"
	#
	# 	" ${mainMod} Ctrl, left, resizeactive, -10 0"
	# 	" ${mainMod} Ctrl, right, resizeactive, 10 0"
	# 	" ${mainMod} Ctrl, up, resizeactive, 0 -10"
	# 	" ${mainMod} Ctrl, down, resizeactive, 0 10"
	#
	# 	" ${mainMod}, mouse:272, movewindow"
	# 	" ${mainMod}, mouse:273, resizewindow"
	# 	];
	# };
	#  };
  home.file.".config/hypr/hyprland.conf".text = ''
        exec-once = syncthing 
        exec-once = hyprpaper
        exec-once = systemctl --user enable opentabletdriver.service --now       
        exec-once = libinput-gestures
        exec-once = ags
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
            col.active_border = rgba(${config.lib.stylix.colors.base08}ff)
            col.inactive_border = rgba(${config.lib.stylix.colors.base07}ff)
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
        
            drop_shadow = true
            shadow_range = 4
            shadow_render_power = 3
            col.shadow = rgba(${config.lib.stylix.colors.base00}aa)
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

        # master  {
        #     # See https://wiki.hyprland.org/Configuring/Master-Layout/ for more
        #     new_is_master = true
        # }

        gestures  {
            # See https://wiki.hyprland.org/Configuring/Variables/ for more
            workspace_swipe = on
        }


        # Example windowrule v1
        windowrule = float,^(pavucontrol)$
        windowrule = float,^(nm-connection-editor)$
        windowrule = float,^(chromium)$
        windowrule = float,^(thunar)$
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
        bind = ${mainMod}, Tab, exec, ags -t overview
        bind = ${mainMod} SHIFT, M, exit, 
        bind = ${mainMod}, E, exec, thunar 
        bind = ${mainMod}, V, togglefloating, 
        bind = ${mainMod}, C, exec, chromium 
        bind = ${mainMod}, O, exec, obsidian 
        bind = ${mainMod}, F, fullscreen, 
        # bind = ${mainMod}, S, exec, slurp | grim -g - - | wl-copy  
        bind = ${mainMod}, T, exec, ~/.config/hypr/latexocr.sh  
        bind = ALT, V, exec, cliphist list | wofi -dmenu | cliphist decode | wl-copy 
        # bind = ${mainMod}, Space, exec, ~/.config/rofi/launcher.sh
        bind = ${mainMod}, Space, exec, ags -t launcher

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

        bind=,XF86Launch4,   exec, ags -r 'recorder.start()'
        bind= ${mainMod}, S,         exec, ags -r 'recorder.screenshot()'
        bind= ${mainMod} SHIFT, S,    exec, ags -r 'recorder.screenshot(true)'

        binde = ${mainMod} Ctrl, H, resizeactive, -10 0
        binde = ${mainMod} Ctrl, L, resizeactive, 10 0
        binde = ${mainMod} Ctrl, K, resizeactive, 0 -10
        binde = ${mainMod} Ctrl, H, resizeactive, 0 10

        bindm = ${mainMod}, mouse:272, movewindow
        bindm = ${mainMod}, mouse:273, resizewindow
  '';

  home.file.".config/hypr/latexocr.sh".text = ''
        #!/usr/bin/env bash
        out=`slurp | grim -g - - > /tmp/texocr.png

        notify-send "Comienzo escaneo LaTeX" 
        pix2tex /tmp/texocr.png | sed 's/^[^:]*: //'`
        wl-copy "$out"
        notify-send "Escaneo LaTeX finalizado"
    '';
  
  home.file.".config/hypr/latexocr.sh".executable = true;
}
