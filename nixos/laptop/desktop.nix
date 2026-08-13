{pkgs, ...}:{
  services = {
    displayManager.gdm.enable = true;
    desktopManager.gnome.enable = true;
    gnome = {
      core-apps.enable = false;
      gcr-ssh-agent.enable = false;
      gnome-software.enable = true;
    };
    fwupd.enable = true;
    fprintd.enable = true;
    flatpak.enable = true;
  };
  environment.systemPackages = (
    with pkgs;[
      gnome-console
      nautilus
      gnome-system-monitor
    ]
  ) ++ (
    with pkgs.gnomeExtensions;[
      appindicator
      dash-to-dock
      gtk4-desktop-icons-ng-ding
      user-themes
      system-monitor-next
      window-is-ready-remover
    ]
  );
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
