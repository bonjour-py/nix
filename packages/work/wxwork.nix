{pkgs, buildEnv, makeDesktopItem}: buildEnv {
  name = "work.wxwork";
  paths = [
    pkgs.remmina
    (
      makeDesktopItem {
        name = "work.wxwork";
        desktopName = "企业微信";
        icon = "/home/bonjour/.local/share/icons/scalable/apps/huidusec.ico";
        exec = "remmina -c /home/bonjour/.local/share/remmina/huidusec_rdp_wxwork_192-168-110-92.remmina";
      }
    )
  ];
}
