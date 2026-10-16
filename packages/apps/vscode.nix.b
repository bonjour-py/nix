{ pkgs }: (
  import pkgs {
    config.allowUnfree = true;
  }
).vscode