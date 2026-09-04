{ symlinkJoin, callPackage }: symlinkJoin {
  name = "work";
  paths = let bin = callPackage ./work.nix {}; in [
    ( callPackage ./menu.nix { inherit bin; } )
    ( callPackage ./firefox.nix { inherit bin; } )
    ( callPackage ./libreoffice.nix { inherit bin; } )
    ( callPackage ./wireshark.nix { inherit bin; } )
    ( callPackage ./wxwork.nix { inherit bin; } )
  ];
}