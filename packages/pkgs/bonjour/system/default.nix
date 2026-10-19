{ symlinkJoin, callPackage }: symlinkJoin {
  name = "bonjour-system";
  paths = map ( x: callPackage /${x} {}) [
    ./gnomeExtensions.nix
    ./systemTools.nix
  ];
}