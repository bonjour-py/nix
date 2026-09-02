{pkgs, buildEnv, callPackage}: rec {
  kali = callPackage ./kali.nix {};
  wxwork = callPackage ./wxwork.nix {};
  all = buildEnv {
    name = "work";
    paths = [
      kali
      wxwork
    ];
  };
}