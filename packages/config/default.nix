{ callPackage, buildEnv }: rec {
  git = callPackage ./git.nix {};
  ssh = callPackage ./ssh.nix {};
  all = buildEnv {
    name = "config";
    paths = [
      git
      ssh
    ];
  };
}
