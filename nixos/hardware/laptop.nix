{wsl, ...}:{
  imports = [ wsl ];
  wsl = {
    enable = true;
    useWindowsDriver = true;
    usbip.enable = true;
    startMenuLaunchers = true;
  };
}