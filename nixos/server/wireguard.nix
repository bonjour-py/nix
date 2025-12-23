{
  systemd = {
    services."systemd-networkd".serviceConfig.LoadCredential = ["wireguard-wireguard-gateway-public-key:/etc/wireguard/gateway.public"];
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
  };
  networking = {
    wireguard.interfaces.wireguard = {
      privateKeyFile = "/etc/wireguard/server.private";
      ips = ["192.168.59.254/32"];
      peers = [
        {
          name = "gateway";
          publicKey = "@wireguard-wireguard-gateway-public-key";
          presharedKeyFile = "/etc/wireguard/gateway-server.preshared";
          endpoint = "gateway.bonjour.zone:51820";
          persistentKeepalive = 25;
          allowedIPs = [
            "192.168.59.255/32"
            "192.168.59.251/32"
            "192.168.59.252/32"
            "192.168.59.14/28"
          ];
        }
      ];
    };
    firewall.trustedInterfaces = ["wireguard"];
    hosts."192.168.59.254" = ["server.bonjour"];
  };
  systemd.network.networks."40-wireguard" = {
    dns = ["192.168.59.255"];
    domains = ["bonjour" "~gateway.bonjour" "~oss-cn-beijing-internal.aliyuncs.com"];
  };
  services.resolved.extraConfig = "DNSStubListenerExtra = 192.168.59.254";
}