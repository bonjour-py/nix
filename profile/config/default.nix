{pkgs, callPackage, buildEnv, writeTextFile}: rec {
  git = callPackage ./git.nix {};
  ssh = callPackage ./ssh.nix {};
  default = buildEnv {
    name = "config";
    paths = [
      git
      ssh
    ];
  };
}
