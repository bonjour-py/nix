{ bin, makeDesktopItem }: makeDesktopItem {
  name = "work.wxwork";
  desktopName = "企业微信";
  icon = ./icons/windows.svg;
  exec = "${bin} wxwork";
}