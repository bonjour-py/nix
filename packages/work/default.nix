{buildEnv, callPackage}: rec {
  kali = callPackage ./kaliApps.nix {};
  wxwork = callPackage ./wxwork.nix {};
  all = buildEnv {
    name = "work";
    paths = [
      kali
      wxwork
    ];
  };
}