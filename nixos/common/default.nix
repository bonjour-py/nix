{
  nixpkgs.hostPlatform = "x86_64-linux";
  system.stateVersion = "25.11";
  time.timeZone = "Asia/Shanghai";
  i18n.defaultLocale = "zh_CN.UTF-8";
  fonts.enableDefaultPackages = true;
  nix = {
    settings = {
      experimental-features = [ "nix-command" "flakes" ];
      substituters = [ "https://mirrors.cernet.edu.cn/nix-channels/store" ];
    };
    gc.automatic = true;
  };
}