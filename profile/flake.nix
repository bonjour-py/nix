{
  inputs = {
    latest.url = "github:nixos/nixpkgs/nixos-unstable";
    stable.url = "github:nixos/nixpkgs/nixos-26.05";
  };
  outputs = {self, latest, stable, ...}:{
    packages.x86_64-linux.default = latest.legacyPackages.x86_64-linux.buildEnv {
      name = "bonjour-default";
      paths = [
        ( latest.legacyPackages.x86_64-linux.callPackage ./systemTools.nix {} )
        ( latest.legacyPackages.x86_64-linux.callPackage ./gnomeExtensions.nix {} )
        ( latest.legacyPackages.x86_64-linux.callPackage ./applications.nix {} )
        ( latest.legacyPackages.x86_64-linux.callPackage ./appimage.nix {fallbacks = stable.legacyPackages.x86_64-linux;} )
      ];
    };
  };
}
