{pkgs, buildEnv}: buildEnv {
  name = "systemTools";
  paths = with pkgs;[
    gnome-system-monitor
    refine
    showtime
    baobab
    gnome-weather
    gnome-firmware
    gnome-logs
    dconf-editor
    firefox
  ];
}