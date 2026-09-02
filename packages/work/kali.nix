{pkgs, buildEnv, makeDesktopItem}: buildEnv {
  name = "kaliApps";
  paths = [
    pkgs.waypipe
    (
      makeDesktopItem {
        name = "kaliApps";
        desktopName = "kali apps";
        icon = "/home/bonjour/documents/bin/.icons/huidusec.ico";
        exec = "waypipe --title-prefix huidusec --video h264 ssh work wofi --show run";
        actions = {
          ssh = {
            name = "ssh";
            exec = "kgx -e ssh work";
          };
          firefox = {
            name = "firefox";
            exec = "waypipe --title-prefix huidusec --video h264 ssh work firefox";
          };
          libreoffice = {
            name = "libreoffice";
            exec = "waypipe --title-prefix huidusec --video h264 ssh work libreoffice";
          };
        };
      }
    )
  ];
}





