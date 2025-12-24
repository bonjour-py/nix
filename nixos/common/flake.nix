{
  outputs = {self}:{
    nixosModules = {
      default = {
        nixpkgs.hostPlatform = "x86_64-linux";
        system.stateVersion = "25.11";
        time.timeZone = "Asia/Shanghai";
        i18n.defaultLocale = "zh_CN.UTF-8";
        nix = {
          settings = {
            experimental-features = [ "nix-command" "flakes" ];
            substituters = [ "https://mirrors.cernet.edu.cn/nix-channels/store" ];
          };
          gc.automatic = true;
        };
      };
      server = {
        imports = [self.nixosModules.default];
        networking.hostName = "server";
      };
      gateway = {
        imports = [self.nixosModules.default];
        networking.hostName = "gateway";
      };
      laptop = {
        imports = [self.nixosModules.default];
        networking.hostName = "laptop";
      };
    };
  };
}