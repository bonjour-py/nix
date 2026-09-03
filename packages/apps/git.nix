{ lib, writeText }: writeText "git" (
  lib.generators.toGitINI {
    init.defaultBranch = "main";
    user = {
      name = "bonjour";
      email = "33248848+bonjour-py@users.noreply.github.com";
    };
    commit.gpgSign = true;
    gpg = {
      format = "ssh";
      ssh.defaultKeyCommand = "ssh-add -L";
    };
  }
)