{
  networking = {
    firewall.trustedInterfaces = ["wireguard"];
    hosts = {
      "192.168.59.255" = ["gateway.bonjour"];
      "192.168.59.254" = ["server.bonjour"];
      "192.168.59.251" = ["laptop.bonjour"];
      "192.168.59.252" = ["desktop.bonjour"];
    };
  };
}