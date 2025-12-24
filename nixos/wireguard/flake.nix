{
  outputs = {self}:{
    nixosModules = {
      default = {
        systemd.tmpfiles.settings.wireguard."/etc/wireguard" = {
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
        networking = {
          firewall.trustedInterfaces = ["wireguard"];
          hosts = {
            "192.168.59.255" = ["gateway.bonjour"];
            "192.168.59.254" = ["server.bonjour"];
            "192.168.59.251" = ["laptop.bonjour"];
            "192.168.59.252" = ["desktop.bonjour"];
          };
        };
      };
      server = {
        imports = [self.nixosModules.default];
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
      };
      gateway = {
        imports = [self.nixosModules.default];
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
          firewall.allowedUDPPorts = [51820];
        };
        systemd = {
          services."systemd-networkd".serviceConfig.LoadCredential = [
            "wireguard-wireguard-server-public-key:/etc/wireguard/server.public"
            "wireguard-wireguard-laptop-public-key:/etc/wireguard/laptop.public"
            "wireguard-wireguard-desktop-public-key:/etc/wireguard/desktop.public"
          ];
          network.networks."40-wireguard" = {
            dns = ["192.168.59.254"];
            domains = ["bonjour" "~server.bonjour"];
          };
        };
        services.resolved.extraConfig = "DNSStubListenerExtra = 192.168.59.255";
      };
      laptop = {};
    };
  };
}