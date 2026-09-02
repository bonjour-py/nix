{latest, stable}: {
  default = latest.buildEnv {
    name = "bonjour-default";
    paths = [
      ( latest.callPackage ./systemTools.nix {} )
      ( latest.callPackage ./gnomeExtensions.nix {} )
      ( latest.callPackage ./work {} ).all
      ( latest.callPackage ./appimage {} ).all
    ];
  };
}