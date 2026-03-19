{pkgs, ...}:{
  services.displayManager.gdm.enable = true;
  services.desktopManager.gnome.enable = true;
  services.flatpak.enable = true;
  services.flatpak.remotes = [
    {
    name = "flathub";
    location = "https://mirrors.cernet.edu.cn/flathub";
    }
  ];
}