{
  imports = [ ./default.nix ];
  networking.wireguard.interfaces.wireguard = {
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
  systemd = {
    services."systemd-networkd".serviceConfig.LoadCredential = ["wireguard-wireguard-gateway-public-key:/etc/wireguard/gateway.public"];
    network.networks."40-wireguard" = {
      dns = ["192.168.59.255"];
      domains = ["bonjour" "~gateway.bonjour" "~oss-cn-beijing-internal.aliyuncs.com"];
    };
  };
  services.resolved.extraConfig = "DNSStubListenerExtra = 192.168.59.254";
}