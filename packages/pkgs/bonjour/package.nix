{ buildEnv, callPackage, 
  remmina, firefox, bitwarden-desktop, vscode, flclash, owncloud, qq, wechat
}: 
buildEnv {
  name = "bonjour-default";
  paths = [ 
    ( callPackage ./system {} )
    remmina
    firefox
    bitwarden-desktop
    ( vscode.fhsWithPackages (pkgs: [ pkgs.git ]) )
    flclash
    owncloud
    qq
    wechat
    ( callPackage ./work {} )
  ];
}