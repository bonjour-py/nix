{fallbacks, callPackage, buildEnv}: buildEnv {
  name = "bonjour-default";
  paths = [
    ( callPackage ./systemTools.nix {} )
    ( callPackage ./gnomeExtensions.nix {} )
    ( callPackage ./applications.nix {} )
    ( callPackage ./appimage.nix { inherit fallbacks; } )
  ];
}