{ symlinkJoin, callPackage }: symlinkJoin {
  name = "bonjour-work";
  paths = map ( x: callPackage /${x} {}) [
    ./menu.nix
    ./firefox.nix
    ./libreoffice.nix
    ./wireshark.nix
    ./wxwork.nix
  ];
}