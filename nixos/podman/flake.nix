{
  outputs = {self}:{
    nixosModules = {
      default = {
        virtualisation.podman = {
          enable = true;
          autoPrune.enable = true;
          defaultNetwork.settings = {
            network_interface = "podman";
            dns_enabled = true;
          };
        };
        networking.firewall.trustedInterfaces = ["podman"];
      };
      server = {};
      gateway = {
        imports = [
          self.nixosModules.default
          ./caddy.nix
          ./coturn.nix
        ];
        virtualisation.podman.defaultNetwork.settings = {
          network_dns_servers = ["192.168.59.14"];
          subnets = [
            {
              subnet = "192.168.59.14/28";
              gateway = "192.168.59.14";
            }
          ];
        };
        systemd.network.networks."10-podman" = {
          name = "podman";
          address = ["192.168.59.14/28"];
          dns = ["192.168.59.14"];
          domains = ["~gateway.bonjour"];
        };
      };
      laptop = {};
    };
  };
}