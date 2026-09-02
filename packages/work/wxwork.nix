{pkgs, buildEnv, makeDesktopItem}: buildEnv {
  name = "wxwork";
  paths = [
    pkgs.remmina
    (
      makeDesktopItem {
        name = "wxwork";
        desktopName = "企业微信";
        icon = "/home/bonjour/documents/bin/.icons/huidusec.ico";
        exec = "remmina -c /home/bonjour/.local/share/remmina/huidusec_rdp_wxwork_192-168-110-92.remmina";
      }
    )
  ];
}





