{host, ...}:{
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
  imports = builtins.filter builtins.pathExists [ ./${host} ./${host}.nix ];
}