{
  imports = [
    ../default.nix
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
}