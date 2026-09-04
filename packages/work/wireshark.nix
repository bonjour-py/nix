{ bin, makeDesktopItem }: makeDesktopItem {
  name = "work.wireshark";
  desktopName = "work wireshark";
  icon = ./icons/kali.svg;
  exec = "${bin} waypipe wireshark";
}