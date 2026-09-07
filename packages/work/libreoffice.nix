{ pkgs, makeDesktopItem }: makeDesktopItem {
  name = "work.libreoffice";
  desktopName = "work libreoffice";
  icon = ./icons/kali.svg;
  exec = "${pkgs.waypipe}/bin/waypipe --title-prefix work --video h264 ssh 192.168.110.91 libreoffice";
}