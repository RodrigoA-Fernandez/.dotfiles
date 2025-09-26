{ pkgs, lib, ... }:
let
  compress-repo = pkgs.fetchFromGitHub {
    owner = "KKV9";
    repo = "compress.yazi";
    rev = "c2646395394f22b6c40bff64dc4c8c922d210570";
    hash = "sha256-qAuMD4YojLfVaywurk5uHLywRRF77U2F7ql+gR8B/lo=";
  };
in
{
  home.packages = [

  ];
  programs.yazi = {
    enable = true;
    enableZshIntegration = true;

    settings = {
      manager = {
        show_hidden = true;
      };
      preview = {
        max_width = 1000;
        max_height = 1000;
      };
    };

    plugins = {
      "chmod" = pkgs.yaziPlugins.chmod;
      "compress" = "${compress-repo}";
      "full-border" = pkgs.yaziPlugins.full-border;
    };

    keymap = {
      manager.prepend_keymap = [
        {
          on = [
            "c"
            "a"
          ];
          run = "plugin compress";
          desc = "Comprimir los archivos seleccionados.";
        }
        {
          on = [
            "c"
            "p"
          ];
          run = "plugin command";
          desc = "Run command Prompt";
        }
        {
          on = [
            "c"
            "m"
          ];
          run = "plugin chmod";
          desc = "Chmod on selected files";
        }

      ];
    };
  };
}
