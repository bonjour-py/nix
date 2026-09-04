{ makeDesktopItem }: makeDesktopItem {
  name = "work.menu";
  desktopName = "work menu";
  icon = ./icons/kali.svg;
  exec = "work waypipe wofi --normal-window --show run";
}