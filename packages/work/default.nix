{ symlinkJoin, callPackage }: symlinkJoin {
  name = "work";
  paths = [
    ( callPackage ./menu.nix {} )
    ( callPackage ./firefox.nix {} )
    ( callPackage ./libreoffice.nix {} )
    ( callPackage ./wireshark.nix {} )
    ( callPackage ./wxwork.nix {} )
  ];
}