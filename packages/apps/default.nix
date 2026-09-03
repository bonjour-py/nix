{ pkgs, callPackage, buildEnv }: rec {
  qq = callPackage ./qq.nix {};
  cutecloud = callPackage ./cutecloud.nix {};
  bitwarden = callPackage ./bitwarden.nix {};
  owncloud = callPackage ./owncloud.nix {};
  vscode = callPackage ./vscode.nix {};
  all = buildEnv {
    name = "appimage";
    paths = [
      qq
      cutecloud
      bitwarden
      owncloud
      vscode
      ( callPackage ./systemTools.nix {} )
      ( callPackage ./gnomeExtensions.nix {} )
      pkgs.remmina
      pkgs.firefox
    ];
  };
}
