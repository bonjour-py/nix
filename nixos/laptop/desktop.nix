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
  environment.systemPackages = [ pkgs.gnome-console pkgs.nautilus ];
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
}
