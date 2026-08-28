{pkgs, buildEnv}: buildEnv {
  name = "gnomeExtensions";
  paths = with pkgs.gnomeExtensions;[
    dash-to-dock
    gtk4-desktop-icons-ng-ding
    appindicator
    window-is-ready-remover
    lockscreen-studio
    astra-monitor
    clipboard-indicator
  ];
}