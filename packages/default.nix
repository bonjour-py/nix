{latest, stable}: latest.lib.filesystem.packagesFromDirectoryRecursive {
  callPackage = latest.callPackage;
  directory = ./.;
}