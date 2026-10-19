{latest, stable}: latest.lib.filesystem.packagesFromDirectoryRecursive {
  inherit (import latest {system = "x86_64-linux"; config.allowUnfree = true;}) callPackage newScope;
  directory = ./pkgs;
}