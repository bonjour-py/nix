{ bin, makeDesktopItem }: makeDesktopItem {
  name = "work.libreoffice";
  desktopName = "work libreoffice";
  icon = ./icons/kali.svg;
  exec = "${bin} waypipe libreoffice";
}