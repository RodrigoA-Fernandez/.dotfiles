{config, lib, pkgs, ...}: 
{
 programs.zsh = {
  enable = false;
  enableCompletion = true;
  enableAutosuggestions = true;
  syntaxHighlighting.enable = true;

  shellAliases = {
    ll = "ls -l";
    update = "sudo nixos-rebuild switch --flake /etc/nixos";
    "java-run" = "${pkgs.jetbrains.jdk}/lib/openjdk/bin/java -javaagent:${pkgs.jetbrains.idea-ultimate}/idea-ultimate/lib/idea_rt.jar=38389:${pkgs.jetbrains.idea-ultimate}/idea-ultimate/bin -Dfile.encoding=UTF-8 -classpath";
  };
  history.size = 10000;
  history.path = "${config.xdg.dataHome}/zsh/history";
};
}
