{ makeDesktopItem, waypipe }: makeDesktopItem {
  name = "work.firefox";
  desktopName = "work firefox";
  icon = ./icons/kali.svg;
  exec = "${waypipe}/bin/waypipe --title-prefix work --video h264 ssh 192.168.110.91 firefox";
}