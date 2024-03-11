{pkgs, config, ...}
:{
  services.syncthing = {
    enable = true;
    tray = true;
  };
}
