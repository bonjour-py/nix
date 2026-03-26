{pkgs, ...}:{
  services = {
    displayManager.gdm.enable = true;
    desktopManager.gnome.enable = true;
    gnome.gcr-ssh-agent.enable = false;
    fprintd.enable = true;
  };
  environment = {
    gnome.excludePackages = with pkgs;[
      gnome-tour
      gnome-user-docs
      yelp
      gnome-text-editor
      epiphany
      baobab
      decibels
      gnome-logs
      gnome-contacts
      gnome-calculator
      gnome-calendar
      gnome-characters
      gnome-font-viewer
      gnome-clocks
      gnome-maps
      gnome-music
      gnome-weather
      loupe
      papers
      showtime
      simple-scan
      snapshot
      gnome-connections
    ];
    systemPackages = with pkgs.gnomeExtensions;[
      appindicator
      dash-to-dock
      gtk4-desktop-icons-ng-ding
      user-themes
      system-monitor-next
    ];
  };
  
  i18n.inputMethod = {
    enable = true;
    type = "ibus";
    ibus = {
      waylandFrontend = true;
      engines = [ pkgs.ibus-engines.libpinyin ];
    };
  };
  users.users.bonjour.extraGroups = ["networkmanager"];
}
