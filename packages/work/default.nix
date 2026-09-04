{pkgs, buildEnv, callPackage}: buildEnv {
  name = "work";
  paths = [
    ( callPackage ./work.nix {} )
    ( callPackage ./menu.nix {} )
    ( callPackage ./firefox.nix {} )
    ( callPackage ./libreoffice.nix {} )
    ( callPackage ./wireshark.nix {} )
    ( callPackage ./wxwork.nix {} )
  ];
}