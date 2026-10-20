{ 
  buildEnv, 
  system, work,
  remmina, firefox, bitwarden-desktop, vscode, flclash, owncloud, qq, wechat
}: 
buildEnv {
  name = "bonjour-default";
  paths = [ 
    system
    remmina
    firefox
    bitwarden-desktop
    ( vscode.fhsWithPackages (pkgs: [ pkgs.git ]) )
    flclash
    owncloud
    qq
    wechat
    work
  ];
}