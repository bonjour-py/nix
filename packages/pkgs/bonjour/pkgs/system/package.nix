{ buildEnv, callPackage }: buildEnv {
  name = "bonjour-system";
  paths = map ( x: callPackage /${x} {}) [
    ./gnomeExtensions.nix
    ./systemTools.nix
  ];
}