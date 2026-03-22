{pkgs, ...}:{
  nixpkgs.config.allowUnfree = true;
  i18n.inputMethod = {
    enable = true;
    type = "ibus";
    ibus = {
      waylandFrontend = true;
      engines = [ pkgs.ibus-engines.pinyin ];
    };
  };
  fonts.enableDefaultPackages = true;
  services = {
    displayManager.gdm.enable = true;
    desktopManager.gnome.enable = true;
    fprintd.enable = true;
    flatpak.enable = true;
  };
  environment.gnome.excludePackages = with pkgs;[
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
  users.users.bonjour.extraGroups = ["networkmanager"];
}
