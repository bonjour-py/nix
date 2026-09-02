{pkgs, symlinkJoin, writeShellApplication, makeDesktopItem}: symlinkJoin {
  name = "work.kaliApps";
  paths = [
    (
      writeShellApplication {
        name = "work.kaliApps";
        runtimeInputs = [ pkgs.waypipe ];
        text = ''waypipe --title-prefix work --video h264 ssh work "$@"'';
      }
    )
    (
      makeDesktopItem {
        name = "work.kaliApps";
        desktopName = "kali apps";
        icon = "/home/bonjour/.local/share/icons/scalable/apps/kali.svg";
        exec = "work.kaliApps wofi --show run";
        actions = {
          ssh = {
            name = "ssh";
            exec = "work.kaliApps";
          };
          firefox = {
            name = "firefox";
            exec = "work.kaliApps firefox";
          };
          libreoffice = {
            name = "libreoffice";
            exec = "work.kaliApps libreoffice";
          };
        };
      }
    )
  ];
}





