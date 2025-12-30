{wsl, home-manager, ...}:{
  imports = [
    wsl
    home-manager
  ];
  wsl = {
    defaultUser = "bonjour";
    enable = true;
    useWindowsDriver = true;
    usbip.enable = true;
  };
  home-manager = {
    users.bonjour = {
      home.stateVersion = "25.11";
    };
  };
}