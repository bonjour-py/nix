{ 
  buildEnv, 
  gnome-system-monitor, refine, showtime, baobab, gnome-weather, gnome-firmware, gnome-logs, dconf-editor
}: 
buildEnv {
  name = "bonjour-systemTools";
  paths = [
    gnome-system-monitor
    refine
    showtime
    baobab
    gnome-weather
    gnome-firmware
    gnome-logs
    dconf-editor
  ];
}