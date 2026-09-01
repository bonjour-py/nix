{latest, stable}: latest.buildEnv {
  name = "bonjour-default";
  paths = [
    ( latest.callPackage ./systemTools.nix {} )
    ( latest.callPackage ./gnomeExtensions.nix {} )
    ( latest.callPackage ./applications.nix {} )
    ( latest.callPackage ./appimage.nix { fallbacks = stable; } )
  ];
}