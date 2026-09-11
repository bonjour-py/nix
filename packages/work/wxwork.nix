{ pkgs, makeDesktopItem }: makeDesktopItem {
  name = "work.wxwork";
  desktopName = "企业微信";
  icon = ./icons/windows.svg;
  exec = ''${pkgs.remmina}/bin/remmina -c "rdp://bonjour:zdU76+p0wBg=@192.168.110.92" --set-option "sound=local" --set-option "scale=2" --set-option "multitransport=1" --set-option "drive=/home/bonjour/download" --enable-fullscreen'';
}