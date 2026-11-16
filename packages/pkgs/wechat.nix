{pkgs}: (
  import pkgs.path {
    system = "x86_64-linux";
    config.allowUnfree = true;
  }
).wechat