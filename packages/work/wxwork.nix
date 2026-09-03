{ pkgs, symlinkJoin, writeShellApplication, makeDesktopItem }: symlinkJoin {
  name = "work.wxwork";
  paths = [
    (
      writeShellApplication {
        name = "work.wxwork";
        runtimeInputs = [ pkgs.remmina ];
        text = ''remmina -c rdp://bonjour:zdU76+p0wBg=@192.168.110.92 --set-option sound=local --set-option scale=2 --set-option multitransport=1'';
      }
    )
    (
      makeDesktopItem {
        name = "work.wxwork";
        desktopName = "企业微信";
        icon = ./wxwork.ico;
        exec = "work.wxwork";
      }
    )
  ];
}
