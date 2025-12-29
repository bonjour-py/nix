{
  imports = [ ./default.nix ];
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
}