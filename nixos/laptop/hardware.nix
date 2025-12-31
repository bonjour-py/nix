{wsl, ...}:{
  system.stateVersion = "25.11";
  nixpkgs.hostPlatform = "x86_64-linux";
  imports = [wsl];
  wsl = {
    enable = true;
    defaultUser = "bonjour";
    useWindowsDriver = true;
    usbip.enable = true;
  };
}