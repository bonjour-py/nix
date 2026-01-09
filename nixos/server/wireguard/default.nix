{config, ...}:{
  age.secrets = {
    "wireguard/server.private" = {
      file = ./server.private.age;
      group = "systemd-network";
      mode = "640";
    };
    "wireguard/gateway-server.preshared" = {
      file = ./gateway-server.preshared.age;
      group = "systemd-network";
      mode = "640";
    };
  };
  networking.wireguard.interfaces.wireguard = {
    privateKeyFile = config.age.secrets."wireguard/server.private".path;
    ips = ["192.168.59.254/32"];
    peers = [
      {
        publicKey = "IVgZMl95LtD/UzhGWZZDV6gGdBnnFFvhJafXGkCXuk0=";
        presharedKeyFile = config.age.secrets."wireguard/gateway-server.preshared".path;
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
  systemd.network.networks."40-wireguard" = {
    dns = ["192.168.59.255"];
    domains = ["bonjour" "~gateway.bonjour" "~oss-cn-beijing-internal.aliyuncs.com"];
  };
  services.resolved.extraConfig = "DNSStubListenerExtra = 192.168.59.254";
}