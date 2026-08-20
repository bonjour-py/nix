{pkgs, ...}:{
  services = {
    displayManager.gdm.enable = true;
    desktopManager.gnome.enable = true;
    gnome = {
      core-apps.enable = false;
      gcr-ssh-agent.enable = false;
    };
    fwupd.enable = true;
    fprintd.enable = true;
  };
  programs.appimage = {
    enable = true;
    binfmt = true;
    package = pkgs.appimage-run.override {
      extraPkgs = pkgs: [
        pkgs.git
        pkgs.libva
        pkgs.ffmpeg
        pkgs.libepoxy
      ];
    };
  };
  environment.systemPackages = with pkgs;[
    gnome-console
    nautilus
    gnome-system-monitor
    refine
    showtime
    baobab
    gnome-weather
    gnome-firmware
    gnome-logs
    dconf-editor
    gnome-extension-manager
    gnomeExtensions.appindicator
    gnomeExtensions.dash-to-dock
    gnomeExtensions.gtk4-desktop-icons-ng-ding
    gnomeExtensions.user-themes
    gnomeExtensions.system-monitor-next
    gnomeExtensions.window-is-ready-remover
    pinit
  ];
  i18n.inputMethod = {
    enable = true;
    type = "ibus";
    ibus = {
      waylandFrontend = true;
      engines = [ pkgs.ibus-engines.libpinyin ];
    };
  };
  fonts.enableDefaultPackages = true;
  users.users.bonjour.extraGroups = ["networkmanager"];
}
