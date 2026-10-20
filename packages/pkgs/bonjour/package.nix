{lib, callPackage, newScope}: (
  lib.filesystem.packagesFromDirectoryRecursive {
    inherit callPackage newScope;
    directory = ./pkgs;
  }
).default