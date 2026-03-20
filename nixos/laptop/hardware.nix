{
  wsl = {
    enable = true;
    defaultUser = "bonjour";
    useWindowsDriver = true;
    usbip.enable = true;
  };
  services.openssh.generateHostKeys = true;
}