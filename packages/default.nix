{latest, stable}: latest.lib.filesystem.packagesFromDirectoryRecursive {
  inherit (latest.legacyPackages.x86_64-linux) callPackage newScope;
  directory = ./pkgs;
}