{ callPackage, buildEnv }: rec {
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
