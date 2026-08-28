{
  inputs = {
    latest.url = "github:nixos/nixpkgs/nixos-unstable";
    stable.url = "github:nixos/nixpkgs/nixos-26.05";
  };
  outputs = {self, latest, stable, ...}:{
    packages.x86_64-linux.default = latest.legacyPackages.x86_64-linux.buildEnv {
      name = "bonjour-default";
      paths = [
        ( import ./system.nix { pkgs = latest.legacyPackages.x86_64-linux; } )
        ( import ./gnomeExtensions.nix { pkgs = latest.legacyPackages.x86_64-linux; } )
        ( import ./apps.nix { pkgs = latest.legacyPackages.x86_64-linux; } )
        ( import ./fallback.nix { pkgs = stable.legacyPackages.x86_64-linux; } )
      ];
    };
  };
}
