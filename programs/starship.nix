{config, ...}:
{
  programs.starship = {
    enable = true;
    enableZshIntegration = true;
    settings = {
      "$schema" = "https://starship.rs/config-schema.json";
      format =  ''
        [](#${config.lib.stylix.colors.base0F})$os$username[](bg:#${config.lib.stylix.colors.base0A} fg:#${config.lib.stylix.colors.base0F})$directory[](fg:#${config.lib.stylix.colors.base0A} bg:#${config.lib.stylix.colors.base0C})$git_branch$git_status[](fg:#${config.lib.stylix.colors.base0C} bg:#${config.lib.stylix.colors.base0D})$c$rust$golang$nodejs$php$java$kotlin$haskell$python[](fg:#${config.lib.stylix.colors.base0D} bg:#${config.lib.stylix.colors.base03})$docker_context[](fg:#${config.lib.stylix.colors.base03} bg:#${config.lib.stylix.colors.base01})$time[ ](fg:#${config.lib.stylix.colors.base01})$line_break$character'';

      os = {
        disabled = false;
	style = "bg:#${config.lib.stylix.colors.base0F} fg:#${config.lib.stylix.colors.base07}";
        symbols = {
          Windows = "󰍲";
          Ubuntu = "󰕈";
          SUSE = "";
          Raspbian = "󰐿";
          Mint = "󰣭";
          Macos = "󰀵";
          Manjaro = "";
          Linux = "󰌽";
          Gentoo = "󰣨";
          Fedora = "󰣛";
          Alpine = "";
          Amazon = "";
          Android = "";
          Arch = "󰣇";
          Artix = "󰣇";
          CentOS = "󱄅";
          Debian = "󰣚";
          Redhat = "󱄛";
          RedHatEnterprise = "󱄛";
          NixOS = "󱄅";
        };
      };

      username = {
        show_always = true;
        style_user = "bg:#${config.lib.stylix.colors.base0F} fg:#${config.lib.stylix.colors.base07}";
        style_root = "bg:#${config.lib.stylix.colors.base0F} fg:#${config.lib.stylix.colors.base07}";
        format = "[ $user ]($style)";
      };

      directory = {
        style = "fg:#${config.lib.stylix.colors.base07} bg:#${config.lib.stylix.colors.base0A}";
        format = "[ $path ]($style)";
        truncation_length = 3;
        truncation_symbol = "…/";
        substitutions = {
          "Documents" = "󰈙 ";
          "Downloads" = " ";
          "Music" = "󰝚 ";
          "Pictures" = " ";
          "Developer" = "󰲋 ";
        };
      };

    git_branch = {
        symbol = "";
        style = "bg:#${config.lib.stylix.colors.base0C}";
        format = "[[ $symbol $branch ](fg:#${config.lib.stylix.colors.base07} bg:#${config.lib.stylix.colors.base0C})]($style)";
    };
    git_status = {
        style = "bg:#${config.lib.stylix.colors.base0C}";
        format = "[[($all_status$ahead_behind )](fg:#${config.lib.stylix.colors.base07} bg:#${config.lib.stylix.colors.base0C})]($style)";
    };
    nodejs = {
        symbol = "";
        style = "bg:#${config.lib.stylix.colors.base0D}";
        format = "[[ $symbol( $version) ](fg:#${config.lib.stylix.colors.base07} bg:#${config.lib.stylix.colors.base0D})]($style)";
    };
    c = {
        symbol = " ";
        style = "bg:#${config.lib.stylix.colors.base0D}";
        format = "[[ $symbol( $version) ](fg:#${config.lib.stylix.colors.base07} bg:#${config.lib.stylix.colors.base0D})]($style)";
    };
    rust = {
        symbol = "";
        style = "bg:#${config.lib.stylix.colors.base0D}";
        format = "[[ $symbol( $version) ](fg:#${config.lib.stylix.colors.base07} bg:#${config.lib.stylix.colors.base0D})]($style)";
    };
    golang = {
        symbol = "";
        style = "bg:#${config.lib.stylix.colors.base0D}";
        format = "[[ $symbol( $version) ](fg:#${config.lib.stylix.colors.base07} bg:#${config.lib.stylix.colors.base0D})]($style)";
    };
    php = {
        symbol = "";
        style = "bg:#${config.lib.stylix.colors.base0D}";
        format = "[[ $symbol( $version) ](fg:#${config.lib.stylix.colors.base07} bg:#${config.lib.stylix.colors.base0D})]($style)";
    };
    java = {
        symbol = " ";
        style = "bg:#${config.lib.stylix.colors.base0D}";
        format = "[[ $symbol( $version) ](fg:#${config.lib.stylix.colors.base07} bg:#${config.lib.stylix.colors.base0D})]($style)";
    };
    kotlin = {
        symbol = "";
        style = "bg:#${config.lib.stylix.colors.base0D}";
        format = "[[ $symbol( $version) ](fg:#${config.lib.stylix.colors.base07} bg:#${config.lib.stylix.colors.base0D})]($style)";
    };
    haskell = {
        symbol = "";
        style = "bg:#${config.lib.stylix.colors.base0D}";
        format = "[[ $symbol( $version) ](fg:#${config.lib.stylix.colors.base07} bg:#${config.lib.stylix.colors.base0D})]($style)";
    };
    python = {
        symbol = "";
        style = "bg:#${config.lib.stylix.colors.base0D}";
        format = "[[ $symbol( $version) ](fg:#${config.lib.stylix.colors.base07} bg:#${config.lib.stylix.colors.base0D})]($style)";
    };
    docker_context = {
        symbol = "";
        style = "bg:#${config.lib.stylix.colors.base03}";
        format = "[[ $symbol( $context) ](fg:#83a598 bg:#${config.lib.stylix.colors.base03})]($style)";
    };
    time = {
        disabled = false;
        time_format = "%R";
        style = "bg:#${config.lib.stylix.colors.base01}";
        format = "[[  $time ](fg:#${config.lib.stylix.colors.base07} bg:#${config.lib.stylix.colors.base01})]($style)";
    };
    line_break = {
        disabled = false;
    };
    character = {
        disabled = false;
        success_symbol = "[](bold fg:color_green)";
        error_symbol = "[](bold fg:color_red)";
        vimcmd_symbol = "[](bold fg:color_green)";
        vimcmd_replace_one_symbol = "[](bold fg:color_purple)";
        vimcmd_replace_symbol = "[](bold fg:color_purple)";
        vimcmd_visual_symbol = "[](bold fg:#${config.lib.stylix.colors.base0A})";
    };
    };
  };
  # home.file.".config/starship.toml".text = ''
  #   "$schema" = "https://starship.rs/config-schema.json"
  #   format = "[](#d65d0e)$os$username[](bg:#fabd2f fg:#d65d0e)$directory[](fg:#fabd2f bg:#8ec07c)$git_branch$git_status[](fg:#8ec07c bg:#83a598)$c$rust$golang$nodejs$php$java$kotlin$haskell$python[](fg:#83a598 bg:#665c54)$docker_context[](fg:#665c54 bg:#3c3836)$time[ ](fg:#3c3836)$line_break$character"

  #   [c]
  #   format = "[[ $symbol( $version) ](fg:#fbf1c7 bg:#83a598)]($style)"
  #   style = "bg:#83a598"
  #   symbol = " "

  #   [character]
  #   disabled = false
  #   error_symbol = "[](bold fg:color_red)"
  #   success_symbol = "[](bold fg:color_green)"
  #   vimcmd_replace_one_symbol = "[](bold fg:color_purple)"
  #   vimcmd_replace_symbol = "[](bold fg:color_purple)"
  #   vimcmd_symbol = "[](bold fg:color_green)"
  #   vimcmd_visual_symbol = "[](bold fg:#fabd2f)"

  #   [directory]
  #   format = "[ $path ]($style)"
  #   style = "fg:#fbf1c7 bg:#fabd2f"
  #   truncation_length = 3
  #   truncation_symbol = "…/"

  #   [directory.substitutions]
  #   Developer = "󰲋 "
  #   Documents = "󰈙 "
  #   Downloads = " "
  #   Music = "󰝚 "
  #   Pictures = " "

  #   [docker_context]
  #   format = "[[ $symbol( $context) ](fg:#83a598 bg:#665c54)]($style)"
  #   style = "bg:#665c54"
  #   symbol = ""

  #   [git_branch]
  #   format = "[[ $symbol $branch ](fg:#fbf1c7 bg:#8ec07c)]($style)"
  #   style = "bg:#8ec07c"
  #   symbol = ""

  #   [git_status]
  #   format = "[[($all_status$ahead_behind )](fg:#fbf1c7 bg:#8ec07c)]($style)"
  #   style = "bg:#8ec07c"

  #   [golang]
  #   format = "[[ $symbol( $version) ](fg:#fbf1c7 bg:#83a598)]($style)"
  #   style = "bg:#83a598"
  #   symbol = ""

  #   [haskell]
  #   format = "[[ $symbol( $version) ](fg:#fbf1c7 bg:#83a598)]($style)"
  #   style = "bg:#83a598"
  #   symbol = ""

  #   [java]
  #   format = "[[ $symbol( $version) ](fg:#fbf1c7 bg:#83a598)]($style)"
  #   style = "bg:#83a598"
  #   symbol = " "

  #   [kotlin]
  #   format = "[[ $symbol( $version) ](fg:#fbf1c7 bg:#83a598)]($style)"
  #   style = "bg:#83a598"
  #   symbol = ""

  #   [line_break]
  #   disabled = false

  #   [nodejs]
  #   format = "[[ $symbol( $version) ](fg:#fbf1c7 bg:#83a598)]($style)"
  #   style = "bg:#83a598"
  #   symbol = ""

  #   [os]
  #   disabled = false
  #   style = "bg:#d65d0e fg:#fbf1c7"

  #   [os.symbols]
  #   Alpine = ""
  #   Amazon = ""
  #   Android = ""
  #   Arch = "󰣇"
  #   Artix = "󰣇"
  #   CentOS = "󱄅"
  #   Debian = "󰣚"
  #   Fedora = "󰣛"
  #   Gentoo = "󰣨"
  #   Linux = "󰌽"
  #   Macos = "󰀵"
  #   Manjaro = ""
  #   Mint = "󰣭"
  #   NixOS = "󱄅"
  #   Raspbian = "󰐿"
  #   RedHatEnterprise = "󱄛"
  #   Redhat = "󱄛"
  #   SUSE = ""
  #   Ubuntu = "󰕈"
  #   Windows = "󰍲"

  #   [php]
  #   format = "[[ $symbol( $version) ](fg:#fbf1c7 bg:#83a598)]($style)"
  #   style = "bg:#83a598"
  #   symbol = ""

  #   [python]
  #   format = "[[ $symbol( $version) ](fg:#fbf1c7 bg:#83a598)]($style)"
  #   style = "bg:#83a598"
  #   symbol = ""

  #   [rust]
  #   format = "[[ $symbol( $version) ](fg:#fbf1c7 bg:#83a598)]($style)"
  #   style = "bg:#83a598"
  #   symbol = ""

  #   [time]
  #   disabled = false
  #   format = "[[  $time ](fg:#fbf1c7 bg:#3c3836)]($style)"
  #   style = "bg:#3c3836"
  #   time_format = "%R"

  #   [username]
  #   format = "[ $user ]($style)"
  #   show_always = true
  #   style_root = "bg:#d65d0e fg:#fbf1c7"
  #   style_user = "bg:#d65d0e fg:#fbf1c7"
  # '';

}
