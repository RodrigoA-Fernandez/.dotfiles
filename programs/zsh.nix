{config, lib, pkgs, ...}: 
{
 programs.zsh = {
  enable = true;
  enableCompletion = true;
  enableAutosuggestions = true;
  syntaxHighlighting.enable = true;

  shellAliases = {
    ll = "ls -l";
    update = "sudo nixos-rebuild switch";
  };
  history.size = 10000;
  history.path = "${config.xdg.dataHome}/zsh/history";
};
}
