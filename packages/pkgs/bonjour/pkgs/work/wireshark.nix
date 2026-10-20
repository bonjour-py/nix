{ makeDesktopItem, waypipe }: makeDesktopItem {
  name = "work.wireshark";
  desktopName = "work wireshark";
  icon = ./icons/kali.svg;
  exec = "${waypipe}/bin/waypipe --title-prefix work --video h264 ssh 192.168.110.91 wireshark";
}