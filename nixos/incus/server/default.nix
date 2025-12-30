{
  imports = [
    ./bonjour.nix
    ./work.nix
  ];
  virtualisation.incus.preseed = {
    config = {
      "user.ui.title" = "server.bonjour";
      "core.https_trusted_proxy" = "192.168.59.255";
    };
    networks = [
      {
        project = "default";
        name = "incusbr-bonjour";
        type = "bridge";
        description = "";
        config = {
          "dns.domain" = "server.bonjour";
          "dns.search" = "server.bonjour";
          "ipv4.address" = "192.168.59.30/28";
          "ipv4.nat" = "true";
          "ipv6.address" = "none";
        };
      }
      {
        project = "default";
        name = "incusmacv";
        type = "macvlan";
        description = "";
        config = {
          parent = "eno1";
        };
      }
    ];
  };
  fileSystems."/var/lib/incus" = {
    device = "UUID=297e0847-bab9-4d30-90e0-6163e404ebcf";
    options = [ "subvol=@incus" "compress=zstd" ];
  };
  systemd.network.networks."10-incusbr-bonjour" = {
    name = "incusbr-bonjour";
    address = ["192.168.59.30/28"];
    dns = ["192.168.59.30"];
    domains = ["~server.bonjour"];
  };
  networking.firewall.trustedInterfaces = ["incusbr-bonjour"];
  users.users.bonjour.extraGroups = ["incus-admin"];
}