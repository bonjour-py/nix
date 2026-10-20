{ buildEnv,
  gnomeExtensions
}:
buildEnv {
  name = "bonjour-gnomeExtensions";
  paths = with gnomeExtensions;[
    dash-to-dock
    gtk4-desktop-icons-ng-ding
    appindicator
    window-is-ready-remover
    lockscreen-studio
    astra-monitor
    clipboard-indicator
  ];
}