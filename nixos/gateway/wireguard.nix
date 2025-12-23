{
  systemd = {
    tmpfiles.settings.wireguard."/etc/wireguard" = {
      "0" = {
        type = "C";
        argument = "%h/wireguard";
      };
      "1" = {
        type = "Z";
        group = "systemd-network";
        mode = "0640";
      };
      "2" = {
        type = "z";
        mode = "0755";
      };
    };
    services."systemd-networkd".serviceConfig.LoadCredential = [
      "wireguard-wireguard-server-public-key:/etc/wireguard/server.public"
      "wireguard-wireguard-laptop-public-key:/etc/wireguard/laptop.public"
      "wireguard-wireguard-desktop-public-key:/etc/wireguard/desktop.public"
    ];
  };
  networking = {
    wireguard.interfaces.wireguard = {
      privateKeyFile = "/etc/wireguard/gateway.private";
      listenPort = 51820;
      ips = ["192.168.59.255/32"];
      peers = [
        {
          name = "server";
          publicKey = "@wireguard-wireguard-server-public-key";
          presharedKeyFile = "/etc/wireguard/gateway-server.preshared";
          allowedIPs = ["192.168.59.254/32" "192.168.59.30/28"];
        }
        {
          name = "laptop";
          publicKey = "@wireguard-wireguard-laptop-public-key";
          presharedKeyFile = "/etc/wireguard/gateway-laptop.preshared";
          allowedIPs = ["192.168.59.251/32"];
        }
        {
          name = "desktop";
          publicKey = "@wireguard-wireguard-desktop-public-key";
          presharedKeyFile = "/etc/wireguard/gateway-desktop.preshared";
          allowedIPs = ["192.168.59.252/32"];
        }
      ];
    };
    firewall = {
      trustedInterfaces = ["wireguard"];
      allowedUDPPorts = [51820];
    };
    hosts = {
      "192.168.59.255" = ["gateway.bonjour"];
      "192.168.59.254" = ["server.bonjour"];
      "192.168.59.251" = ["laptop.bonjour"];
      "192.168.59.252" = ["desktop.bonjour"];
    };
  };
  systemd.network.networks."40-wireguard" = {
    dns = ["192.168.59.254"];
    domains = ["bonjour" "~server.bonjour"];
  };
  services.resolved.extraConfig = "DNSStubListenerExtra = 192.168.59.255";
}