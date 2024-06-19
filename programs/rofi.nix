{ config, pkgs, inputs, ... }:
{
  programs.rofi ={
    enable = false;
    # theme = "/home/rodrigo/.config/rofi/launcher.rasi";
  };

  home.file.".config/rofi/launcher.sh" = {
    text = ''
    #!/usr/bin/env bash
  
  ## Author : Aditya Shakya (adi1090x)
  ## Github : @adi1090x
  #
  ## Rofi   : Launcher (Modi Drun, Run, File Browser, Window)
  #
  ## Available Styles
  #
  ## style-1     style-2     style-3     style-4     style-5
  
  dir="$HOME/.config/rofi/"
  
  ## Run
  rofi \
      -show drun \
      -theme ''${dir}/launcher.rasi
    '';
   executable = true;
 };

  home.file.".config/rofi/launcher.rasi".text = ''
	/**
	 *
	 * Author : Aditya Shakya (adi1090x)
	 * Github : @adi1090x
	 * 
	 * Rofi Theme File
	 * Rofi Version: 1.7.3
	 **/

	/*****----- Configuration -----*****/
	configuration {
		modi:                       "drun,filebrowser,window";
	    show-icons:                 true;
	    display-drun:               "Apps";
	    display-run:                "Run";
	    display-filebrowser:        "Files";
	    display-window:             "Windows";
		drun-display-format:        "{name}\n[<span weight='light' size='small'><i>({generic})</i></span>]";
		window-format:              "Class : {c}\nWorkspace : {w}";
	}

	/*****----- Global Properties -----*****/
	* {
	    font:                        "Iosevka Nerd Font 10";
	}

	/*****----- Main Window -----*****/
	window {
	    /* properties for window widget */
	    transparency:                "real";
	    location:                    center;
	    anchor:                      center;
	    fullscreen:                  false;
	    width:                       500px;
	    x-offset:                    0px;
	    y-offset:                    0px;

	    /* properties for all widgets */
	    enabled:                     true;
	    margin:                      0px;
	    padding:                     0px;
	    border-radius:               10px;
	    cursor:                      "default";
	    background-color:            #${config.lib.stylix.colors.base01}aa;
	}

	/*****----- Main Box -----*****/
	mainbox {
	    enabled:                     true;
	    spacing:                     15px;
	    padding:                     30px;
	    background-color:            transparent;
	    children:                    [ "inputbar", "mode-switcher", "listview" ];
	}

	/*****----- Inputbar -----*****/
	inputbar {
	    enabled:                     true;
	    spacing:                     15px;
	    margin:                      0px;
	    background-color:            transparent;
	    children:                    [ "textbox-prompt-colon", "entry" ];
	}

	textbox-prompt-colon {
	    enabled:                     true;
	    expand:                      false;
	    padding:                     12px 16px;
	    border:                      1px;
	    border-radius:               10px;
	    border-color:                #${config.lib.stylix.colors.base00};
	    background-color:            #${config.lib.stylix.colors.base02}22;
	    text-color:                  #${config.lib.stylix.colors.base07};
	    str:                         "";
	}
	entry {
	    enabled:                     true;
	    padding:                     12px 16px;
	    border:                      1px;
	    border-radius:               10px;
	    border-color:                #${config.lib.stylix.colors.base00};
	    background-color:            #${config.lib.stylix.colors.base02}22;
	    text-color:                  #${config.lib.stylix.colors.base07};
	    cursor:                      text;
	    placeholder:                 "Search...";
	    placeholder-color:           inherit;
	    vertical-align:              0.5;
	    horizontal-align:            0.0;
	}

	/*****----- Listview -----*****/
	listview {
	    enabled:                     true;
	    columns:                     1;
	    lines:                       5;
	    cycle:                       true;
	    dynamic:                     true;
	    scrollbar:                   false;
	    layout:                      vertical;
	    reverse:                     false;
	    fixed-height:                true;
	    fixed-columns:               true;
	    
	    spacing:                     10px;
	    background-color:            transparent;
	    cursor:                      "default";
	}

	/*****----- Elements -----*****/
	element {
	    enabled:                     true;
	    spacing:                     10px;
	    margin:                      0px;
	    padding:                     10px;
	    border:                      0px solid;
	    border-radius:               10px;
	    background-color:            transparent;
	    text-color:                  #${config.lib.stylix.colors.base07};
	    cursor:                      pointer;
	}
	element normal.active {
	    background-image:            linear-gradient(to right, #${config.lib.stylix.colors.base08}, #${config.lib.stylix.colors.base09});
	    text-color:                  #${config.lib.stylix.colors.base07};
	}
	element selected.normal {
	    border-radius:               10px;
	    background-image:            linear-gradient(to right, #${config.lib.stylix.colors.base08}, #${config.lib.stylix.colors.base09});
	    text-color:                  #${config.lib.stylix.colors.base07};
	}
	element selected.active {
	    background-image:            linear-gradient(to right, #${config.lib.stylix.colors.base0C}, #${config.lib.stylix.colors.base0D});
	    text-color:                  #${config.lib.stylix.colors.base07};
	}
	element-icon {
	    background-color:            transparent;
	    size:                        48px;
	    cursor:                      inherit;
	}
	element-text {
	    background-color:            inherit;
	    text-color:                  inherit;
	    cursor:                      inherit;
	    vertical-align:              0.5;
	    horizontal-align:            0.0;
	}

	/*****----- Mode Switcher -----*****/
	mode-switcher{
	    enabled:                     true;
	    expand:                      false;
	    spacing:                     15px;
	    background-color:            transparent;
	}
	button {
	    font:                        "Iosevka Nerd Font Bold 10";
	    padding:                     10px;
	    border-radius:               100%;
	    background-image:            linear-gradient(to right, #${config.lib.stylix.colors.base0C}, #${config.lib.stylix.colors.base0D});
	    text-color:                  #${config.lib.stylix.colors.base07};
	    cursor:                      pointer;
	}
	button selected {
	    background-image:            linear-gradient(to right, #${config.lib.stylix.colors.base08}, #${config.lib.stylix.colors.base09});
	    text-color:                  #${config.lib.stylix.colors.base07};
	}

	/*****----- Message -----*****/
	error-message {
	    padding:                     20px;
	    background-color:            white;
	    text-color:                  black;
	}
	textbox {
	    padding:                     0px;
	    border-radius:               0px;
	    text-color:                  black;
	    vertical-align:              0.5;
	    horizontal-align:            0.0;
	}
  '';



}

