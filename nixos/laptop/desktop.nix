{pkgs, ...}:{
  services.displayManager.cosmic-greeter.enable = true;
  services.desktopManager.cosmic.enable = true;
  services.flatpak.enable = true;
  services.flatpak.remotes = [
    {
      name = "flathub";
      location = "https://mirrors.cernet.edu.cn/flathub";
    }
  ];
}