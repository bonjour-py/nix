{
  outputs = {self}:{
    nixosModules = {
      default = {
        networking = {
          useNetworkd = true;
          nftables.enable = true;
        };
      };
      server = {
        imports = [self.nixosModules.default];
        systemd.network = {
          enable = true;
          networks."10-eno1" = {
            name = "eno1";
            address = ["192.168.110.98/24"];
            gateway = ["192.168.110.1"];
            dns = ["114.114.114.114" "223.5.5.5"];
          };
        };
      };
      gateway = self.nixosModules.default;
      laptop = {};
    };
  };
}