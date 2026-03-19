{pkgs, ...}:{
  xdg.portal.enable = true;
  xdg.portal.extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
  xdg.portal.config.common.default = "*";
  services.flatpak.enable = true;
  services.flatpak.remotes = [
    {
    name = "flathub";
    location = "https://mirrors.cernet.edu.cn/flathub";
    }
  ];
  services.flatpak.packages = [
    "com.dingtalk.DingTalk"
  ];
  home-manager.users.bonjour = {pkgs, ...}:{
    home = {
      stateVersion = "25.11";
    };
  };
}