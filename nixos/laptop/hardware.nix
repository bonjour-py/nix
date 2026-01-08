{
  system.stateVersion = "25.11";
  nixpkgs.hostPlatform = "x86_64-linux";
  wsl = {
    enable = true;
    defaultUser = "bonjour";
    useWindowsDriver = true;
    usbip.enable = true;
  };
  services.openssh.generateHostKeys = true;
}