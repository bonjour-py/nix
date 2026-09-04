{ pkgs, callPackage, buildEnv }: buildEnv {
  name = "apps";
  paths = [
    ( callPackage ./systemTools.nix {} )
    ( callPackage ./gnomeExtensions.nix {} )
    pkgs.remmina
    pkgs.firefox
    ( callPackage ./vscode.nix {} )
    ( callPackage ./bitwarden.nix {} )
    ( callPackage ./cutecloud.nix {} )
    ( callPackage ./owncloud.nix {} )
    ( callPackage ./qq.nix {} )
  ];
}
