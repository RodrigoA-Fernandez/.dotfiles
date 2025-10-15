{
  config,
  pkgs,
  ...
}:
{
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    syntaxHighlighting.enable = true;

    shellAliases = {
      ll = "ls -l";
      update = "sudo nixos-rebuild switch --flake /etc/nixos#default --impure";
      home-switch = "home-manager switch --flake ~/.dotfiles/ --extra-experimental-features \"nix-command flakes\" --impure";
      "java-run" =
        "${pkgs.jetbrains.jdk}/lib/openjdk/bin/java -javaagent:${pkgs.jetbrains.idea-ultimate}/idea-ultimate/lib/idea_rt.jar=38389:${pkgs.jetbrains.idea-ultimate}/idea-ultimate/bin -Dfile.encoding=UTF-8 -classpath";
    };

    sessionVariables = { };

    history.size = 10000;
    history.path = "${config.xdg.dataHome}/zsh/history";
    initContent = ''
      eval "$(direnv hook zsh)"

      export PATH="$HOME/go/bin:$PATH"
      export PATH="/mnt/c/Users/rafv/AppData/Local/Microsoft/WinGet/Links:$PATH"
      export PATH="/mnt/c/Windows/System32:$PATH"
      export EDITOR='nvim'
      export VISUAL='nvim'
      export GRIM_DEFAULT_DIR='~/Pictures/Screenshots'
      export NIX_LD=$(nix eval --impure --raw --expr 'let pkgs = import <nixpkgs> {}; NIX_LD = pkgs.lib.fileContents "${pkgs.stdenv.cc}/nix-support/dynamic-linker"; in NIX_LD ')
    '';
  };
}
