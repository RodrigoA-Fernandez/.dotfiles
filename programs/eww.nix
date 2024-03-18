{pkgs, config, ...}:
{
  home.file = {
    ".config/eww/bar/eww.yuck".source = ./eww/bar/eww.yuck;
    ".config/eww/dashboard/eww.yuck".source = ./eww/dashboard/eww.yuck;
    ".config/eww/scripts/audio".source = ./eww/scripts/audio;
    ".config/eww/scripts/battery".source = ./eww/scripts/battery;
    ".config/eww/scripts/network".source = ./eww/scripts/network;
    ".config/eww/scripts/workspaces.py".source = ./eww/scripts/workspaces.py;
    ".config/eww/scripts/launch_bar".source = ./eww/scripts/launch_bar;
    ".config/eww/scripts/launch_dashboard".source = ./eww/scripts/launch_dashboard;
    ".config/eww/dashboard/eww.scss".text = ''
        /** Global *******************************************/
        *{
          all: unset;
          font-family: 'JetBrains Mono Nerd Font';
          color: #${config.colorScheme.palette.base07};
        }
    
    
        /** Background ***************************************/
        .background {
          background-color: #${config.colorScheme.palette.base00};
          border: 2px solid #${config.colorScheme.palette.base08};
          border-radius: 12px;
          padding: 10px;
        }
    
    
        /** Generic window ***********************************/
        .genwin {
          background-color: #${config.colorScheme.palette.base01};
                border-radius: 16px;
          padding:5px;
        }
    
    
        /* Network ********************************************/
        .btn_net{
        }
    
        .network {
          font-size: 12px;
          /*color: #f7e1d3;*/
        }
    
    
        /* Bluetooth ******************************************/
        .btn_bluet {
          font-size: 12px
        }
    
        /* Battery **********************************************/
        .battery {
          padding-top: 30px;
          font-size: 12px;
        }
    
        .baticon {
                font-size: 14px;
        }
    
        /* Microphone *****************************************/
        .btn_mic {
          font-size: 16px;
        }
    
    
        /** System Sliders ********************************************/
        .slidersbox {
          padding: 4px;
        }
    
        .iconbright {
                font-size : 12px;
                font-weight : normal;
          /*color: #eed49f;*/
        }
    
        .bright_bar scale trough {
                all: unset;
                background-color: #${config.colorScheme.palette.base09};
                border-radius: 16px;
                min-height: 20px;
                min-width: 240px;
          margin-right: 10px;
        }
    
        .bright_bar scale trough highlight {
                all: unset;
                border-radius: 16px;
                /*background-color: #eed49f;*/
                background-color: #${config.colorScheme.palette.base0A};
        }
    
        .iconvolume {
                font-size : 15px;
                font-weight : normal;
          margin-left: 4px;
        }
    
        .volume_bar scale trough {
                all: unset;
                background-color: #${config.colorScheme.palette.base09};
                border-radius: 16px;
                min-height: 20px;
                min-width: 240px;
          margin-right: 10px;
        }
    
        .volume_bar scale trough highlight {
                all: unset;
                border-radius: 16px;
                background-color: #${config.colorScheme.palette.base0A};
        }
    
        .iconmic {
                font-size : 15px;
                font-weight : normal;
          margin-left: 4px;
        }
    
        .mic_bar scale trough {
                all: unset;
                background-color: #${config.colorScheme.palette.base09};
                border-radius: 16px;
                min-height: 20px;
                min-width: 240px;
          margin-right: 10px;
        }
    
        .mic_bar scale trough highlight {
                all: unset;
                border-radius: 16px;
                background-color: #${config.colorScheme.palette.base0A};
        }
    
    
        /** Music ***************************************/
        .album_art {
                background-size: 180px;
                min-height: 180px;
                min-width: 180px;
                margin: 4px;
                border-radius: 14px;
        }
    
        .song {
                color: #8FBCBB;
                font-size : 12px;
                font-weight : bold;
                margin : 30px 0px 0px 0px;
        }
    
        .artist {
                color: #Eed49f;
                font-size : 16px;
                font-weight : normal;
                margin : 0px 0px 15px 0px;
        }
    
        .btn_prev, .btn_play, .btn_next {
        }
        .btn_prev {
                font-size : 32px;
                font-weight : normal;
        }
        .btn_play {
                font-size : 35px;
                font-weight : bold;
                margin-left: -12px;
        }
        .btn_next {
                font-size : 32px;
                font-weight : normal;
        }
    
    
        /** Calendar *******************************************/
    
        .cal {
          padding: 5px 5px 0px 5px;
          border: transparent;
                font-size: 11px
        }
    
        calendar {
          color: #${config.colorScheme.palette.base04};
        }
    
        calendar:selected {
          color: #${config.colorScheme.palette.base0A};
        }
    
        calendar.header {
          color: #${config.colorScheme.palette.base08};
          font-weight: bold;
        }
    
        calendar.button {
          color: #${config.colorScheme.palette.base09};
        }
    
        calendar.highlight {
          color: #${config.colorScheme.palette.base08};
          font-weight: bold;
        }
    
        calendar:indeterminate {
          color: #${config.colorScheme.palette.base03};
        }
    
    
    
    
        /** Power buttons ***************************************/
        .btn_poweroff {
                font-size : 12px;
          padding: 8px 0;
                margin: 0px 4px 0px -5px;
        }
    
    
    
        /** EOF *************************************************/
      '';
  };
}




