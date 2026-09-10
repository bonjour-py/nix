{pkgs, ...}:{
  imports = [
    ./bonjour.nix
    ./work.nix
  ];
  fileSystems."/var/lib/incus" = {
    device = "UUID=324394db-5218-4f0a-acfc-a6d54932aa5e";
    fsType = "btrfs";
    options = [ "subvol=@incus" "compress=zstd" ];
  };
  virtualisation.incus = {
    enable = true;
    package = pkgs.incus;
    ui.enable = true;
    preseed = {
      config = {
        "core.https_address" = "[::]:443";
        "user.ui.title" = "server.bonjour";
        "core.https_trusted_proxy" = "192.168.59.255";
      };
      storage_pools = [
        {
          config = {
            source = "/var/lib/incus/storage-pools/default";
            "volatile.initial_source" = "/var/lib/incus/storage-pools/default";
          };
          description = "";
          name = "default";
          driver = "btrfs";
        }
      ];
      profiles = [
        {
          config = { };
          description = "Default Incus profile";
          devices = { };
          name = "default";
          project = "";
        }
      ];
      projects = [
        {
          config = {
            "features.images" = "true";
            "features.networks" = "true";
            "features.networks.zones" = "true";
            "features.profiles" = "true";
            "features.storage.buckets" = "true";
            "features.storage.volumes" = "true";
          };
          description = "Default Incus project";
          name = "default";
        }
      ];
      certificates = [
        {
          name = "bonjour";
          type = "client";
          restricted = false;
          projects = [ ];
          certificate = "LS0tLS1CRUdJTiBDRVJUSUZJQ0FURS0tLS0tCk1JSUN1ekNDQWtLZ0F3SUJBZ0lVTmtoK2FwLy8xZ1FKQ1ptUUdBNEZlQmcwOGFjd0NnWUlLb1pJemowRUF3TXcKZ1pNeEN6QUpCZ05WQkFZVEFrTk9NUkF3RGdZRFZRUUlEQWRDWldscWFXNW5NUkF3RGdZRFZRUUhEQWRDWldscQphVzVuTVJNd0VRWURWUVFLREFwQ2IyNXFiM1Z5SUV4Sk1SSXdFQVlEVlFRTERBbENiMjVxYjNWeVRFa3hFakFRCkJnTlZCQU1NQ1VKdmJtcHZkWEpNU1RFak1DRUdDU3FHU0liM0RRRUpBUllVWW05dWFtOTFja0JpYjI1cWIzVnkKTG5wdmJtVXdJQmNOTWpReE1URXpNRE0xTXpNd1doZ1BNakV5TkRFd01qQXdNelV6TXpCYU1JR1RNUXN3Q1FZRApWUVFHRXdKRFRqRVFNQTRHQTFVRUNBd0hRbVZwYW1sdVp6RVFNQTRHQTFVRUJ3d0hRbVZwYW1sdVp6RVRNQkVHCkExVUVDZ3dLUW05dWFtOTFjaUJNU1RFU01CQUdBMVVFQ3d3SlFtOXVhbTkxY2t4Sk1SSXdFQVlEVlFRRERBbEMKYjI1cWIzVnlURWt4SXpBaEJna3Foa2lHOXcwQkNRRVdGR0p2Ym1wdmRYSkFZbTl1YW05MWNpNTZiMjVsTUhZdwpFQVlIS29aSXpqMENBUVlGSzRFRUFDSURZZ0FFL3E2NUM1blNZYWlPbTYwOTVwUUduT0VBazdQMm1XMEZrVXlKCnpjNVNXdHZDK1VPaXFRaUJUQWNzaWlWZmNnWVVDRTJpWUhyc3RuNXNyekhQZkRRb0xMcmpwb2tsVDZ3V0JJc3AKRUpoc3BNVHFaWGhhZXRmemlWeXA4WG95ZklrQ28xTXdVVEFkQmdOVkhRNEVGZ1FVcmkyMWNTamRlYlhvbXRINAova2VkZEw1QXZINHdId1lEVlIwakJCZ3dGb0FVcmkyMWNTamRlYlhvbXRINC9rZWRkTDVBdkg0d0R3WURWUjBUCkFRSC9CQVV3QXdFQi96QUtCZ2dxaGtqT1BRUURBd05uQURCa0FqQnhEeDQvUHliS3NVVEJ3cDA1Ujl4MWZUR3cKencxM0RsYldpUENKOHpWRDM2Z2c5YlV3NE5FWFphaHZubHlaK1dzQ01HandPVUlhdXZpZ3U5TDRyYXR6WSt1Ygp0ZVdmbE9wUHdtVE44MmlvSXFsYWtickZDUXk0R0pZSEdIR3hZV08wWEE9PQotLS0tLUVORCBDRVJUSUZJQ0FURS0tLS0t";
          description = "Bonjour LI";
        }
      ];
    };
  };
  systemd.network.networks."10-incusbr-bonjour" = {
    name = "incusbr-bonjour";
    address = ["192.168.59.30/28"];
    dns = ["192.168.59.30"];
    domains = ["~server.bonjour"];
  };
  networking.firewall = {
    allowedTCPPorts = [ 80 443 ];
    trustedInterfaces = ["incusbr-bonjour"];
  };
  users.users.bonjour.extraGroups = ["incus-admin"];
}