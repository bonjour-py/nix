{config, ...}:{
  age.secrets = {
    "gateway.private" = {
      file = ./gateway.private.age;
      group = "systemd-network";
      mode = "640";
    };
    "gateway-server.preshared" = {
      file = ./gateway-server.preshared.age;
      group = "systemd-network";
      mode = "640";
    };
    "gateway-desktop.preshared" = {
      file = ./gateway-desktop.preshared.age;
      group = "systemd-network";
      mode = "640";
    };
    "gateway-laptop.preshared" = {
      file = ./gateway-laptop.preshared.age;
      group = "systemd-network";
      mode = "640";
    };
  };
  networking = {
    wireguard.interfaces.wireguard = {
      privateKeyFile = config.age.secrets."gateway.private".path;
      listenPort = 51820;
      ips = ["192.168.59.255/32"];
      peers = [
        {
          publicKey = "pqRDNzPfs9jEzN5I2xmLLpzcJQXgviELcVXuSF1KP1c=";
          presharedKeyFile = config.age.secrets."gateway-server.preshared".path;
          allowedIPs = ["192.168.59.254/32" "192.168.59.30/28"];
        }
        {
          publicKey = "ExalSxnw/1BD/4+C/WGx7sr2j+20ZP0GaCdOREonLmY=";
          presharedKeyFile = config.age.secrets."gateway-laptop.preshared".path;
          allowedIPs = ["192.168.59.251/32"];
        }
        {
          name = "desktop";
          publicKey = "IMg+/XWKx2VVGzzoVN0Chtka5ZD6USwk6UnPL5I5SQM=";
          presharedKeyFile = config.age.secrets."gateway-desktop.preshared".path;
          allowedIPs = ["192.168.59.252/32"];
        }
      ];
    };
    firewall.allowedUDPPorts = [51820];
  };
  systemd.network.networks."40-wireguard" = {
    dns = ["192.168.59.254"];
    domains = ["bonjour" "~server.bonjour"];
  };
  services.resolved.extraConfig = "DNSStubListenerExtra = 192.168.59.255";
}