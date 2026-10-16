{ callPackage, buildEnv }: buildEnv {
  name = "apps";
  paths = map ( x: callPackage /${x} {}) [
      ./systemTools.nix
      ./gnomeExtensions.nix
      ./remmina.nix
      ./firefox.nix
      ./vscode.nix
      ./bitwarden.nix
      ./flclash.nix
      ./owncloud.nix
      ./qq.nix
      ./wechat.nix
    ];
}
