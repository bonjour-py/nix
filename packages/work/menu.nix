{ bin, makeDesktopItem }: makeDesktopItem {
  name = "work.menu";
  desktopName = "work menu";
  icon = ./icons/kali.svg;
  exec = "${bin} waypipe wofi --normal-window --show run";
}