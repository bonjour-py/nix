{
  virtualisation.podman = {
    enable = true;
    autoPrune.enable = true;
    defaultNetwork.settings = {
      network_interface = "podman";
      network_dns_servers = ["192.168.59.14"];
      dns_enabled = true;
      subnets = [
        {
          subnet = "192.168.59.14/28";
          gateway = "192.168.59.14";
        }
      ];
    };
  };
  systemd.network.networks."10-podman" = {
    name = "podman";
    address = ["192.168.59.14/28"];
    dns = ["192.168.59.14"];
    domains = ["~gateway.bonjour"];
  };
  networking.firewall.trustedInterfaces = ["podman"];
}