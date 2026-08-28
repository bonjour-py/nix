{pkgs}: pkgs.buildEnv {
  name = "system";
  paths = with pkgs;[
    gnome-system-monitor
    refine
    showtime
    baobab
    gnome-weather
    gnome-firmware
    gnome-logs
    dconf-editor
    pinit
  ];
}