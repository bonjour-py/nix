{pkgs, callPackage, buildEnv, writeTextFile}: rec {
  git = callPackage ./git.nix {};
  ssh = callPackage ./ssh.nix {};
  activate = writeTextFile {
    name = "/config/activate";
    destination = "/config/activate";
    executable = true;
    text = ''
      #! ${pkgs.runtimeShell}
      PROFILE=$HOME/.local/state/nix/profiles/profile
      case "$1" in
        activate)
          echo "ln -sf $PROFILE/config/git/config $HOME/.config/git/config"
          ln -s $PROFILE/config/git/config $HOME/.config/git/config
          echo "ln -sf $PROFILE/config/ssh/config $HOME/.ssh/config"
          ln -s $PROFILE/config/ssh/config $HOME/.ssh/config
          ;;
        deactivate)
          echo "rm -f $HOME/.config/git/config"
          rm -f $HOME/.config/git/config
          echo "rm -f $HOME/.ssh/config"
          rm -f $HOME/.ssh/config
          ;;
        *)
          echo "Usage: $0 {activate|deactivate}"
          exit 1
          ;;
      esac
    '';
  };
  default = buildEnv {
    name = "config";
    paths = [
      git
      ssh
      activate
    ];
  };
}
