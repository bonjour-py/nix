{
  outputs = {self}:{
    nixosModules = {
      default = {pkgs, ...}:{
        virtualisation.incus = {
          enable = true;
          package = pkgs.incus;
          ui.enable = true;
          preseed.config."core.https_address" = "[::]:443";
        };
        security.apparmor.enable = true;
        networking.firewall = {
          trustedInterfaces = ["incusbr-bonjour"];
          allowedTCPPorts = [ 80 443 ];
        };
      };
      server = {
        imports = [self.nixosModules.default];
        virtualisation.incus.preseed = {
          config = {
            "user.ui.title" = "server.bonjour";
          };
          networks = [
            {
              config = {
                "dns.domain" = "server.bonjour";
                "dns.search" = "server.bonjour";
                "ipv4.address" = "192.168.59.30/28";
                "ipv4.nat" = "true";
                "ipv6.address" = "none";
              };
              description = "";
              name = "incusbr-bonjour";
              type = "bridge";
              project = "default";
            }
            {
              config = {
                parent = "eno1";
              };
              description = "";
              name = "incusmacv";
              type = "macvlan";
              project = "default";
            }
          ];
          storage_pools = [
            {
              config = {
                source = "/var/lib/incus/storage-pools/bonjour";
                "volatile.initial_source" = "/var/lib/incus/storage-pools/bonjour";
              };
              description = "";
              name = "bonjour";
              driver = "btrfs";
            }
            {
              config = {
                source = "/var/lib/incus/storage-pools/work";
                "volatile.initial_source" = "/var/lib/incus/storage-pools/work";
              };
              description = "";
              name = "work";
              driver = "btrfs";
            }
          ];
          storage_volumes = [ ];
          profiles = [
            {
              config = { };
              description = "Default Incus profile";
              devices = { };
              name = "default";
              project = "";
            }
            {
              config = {
                "cloud-init.vendor-data" = ''
                  #cloud-config
                  locale: zh_CN
                  timezone: Asia/Shanghai
                  apk_repos:
                    alpine_repo:
                      base_url: http://mirrors.cernet.edu.cn/alpine
                      version: latest-stable
                      community_enabled: true
                  package_update: true
                  package_upgrade: true
                  package_reboot_if_required: true
                  ssh_genkeytypes: [ed25519]
                  user:
                    name: bonjour
                    gecos: Bonjour LI,bonjour@bonjour.zone
                    sudo: ALL=(ALL) NOPASSWD:ALL
                  ssh_authorized_keys:
                    - ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIFU1BO8fzrt6bmud/+q/Jqm7UK8hXJZvA7wCIi11Cec+ BonjourLI
                '';
              };
              description = "Default Incus profile for project bonjour";
              devices = {
                eth0 = {
                  network = "incusbr-bonjour";
                  type = "nic";
                };
                root = {
                  path = "/";
                  pool = "bonjour";
                  type = "disk";
                };
              };
              name = "default";
              project = "bonjour";
            }
            {
              config = {
                "security.nesting" = "true";
              };
              description = "Default Incus profile for project work";
              devices = {
                eth0 = {
                  network = "incusmacv";
                  type = "nic";
                };
                root = {
                  path = "/";
                  pool = "work";
                  type = "disk";
                };
              };
              name = "default";
              project = "work";
            }
          ];
          projects = [
            {
              config = {
                "features.images" = "true";
                "features.profiles" = "true";
                "features.storage.buckets" = "true";
                "features.storage.volumes" = "true";
                restricted = "false";
              };
              description = "";
              name = "bonjour";
            }
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
            {
              config = {
                "features.images" = "true";
                "features.profiles" = "true";
                "features.storage.buckets" = "true";
                "features.storage.volumes" = "true";
                restricted = "false";
              };
              description = "";
              name = "work";
            }
          ];
          certificates = [
            {
              name = "bonjour";
              type = "client";
              restricted = false;
              projects = [ ];
              certificate = ''
                -----BEGIN CERTIFICATE-----
                MIICuzCCAkKgAwIBAgIUNkh+ap//1gQJCZmQGA4FeBg08acwCgYIKoZIzj0EAwMw
                gZMxCzAJBgNVBAYTAkNOMRAwDgYDVQQIDAdCZWlqaW5nMRAwDgYDVQQHDAdCZWlq
                aW5nMRMwEQYDVQQKDApCb25qb3VyIExJMRIwEAYDVQQLDAlCb25qb3VyTEkxEjAQ
                BgNVBAMMCUJvbmpvdXJMSTEjMCEGCSqGSIb3DQEJARYUYm9uam91ckBib25qb3Vy
                LnpvbmUwIBcNMjQxMTEzMDM1MzMwWhgPMjEyNDEwMjAwMzUzMzBaMIGTMQswCQYD
                VQQGEwJDTjEQMA4GA1UECAwHQmVpamluZzEQMA4GA1UEBwwHQmVpamluZzETMBEG
                A1UECgwKQm9uam91ciBMSTESMBAGA1UECwwJQm9uam91ckxJMRIwEAYDVQQDDAlC
                b25qb3VyTEkxIzAhBgkqhkiG9w0BCQEWFGJvbmpvdXJAYm9uam91ci56b25lMHYw
                EAYHKoZIzj0CAQYFK4EEACIDYgAE/q65C5nSYaiOm6095pQGnOEAk7P2mW0FkUyJ
                zc5SWtvC+UOiqQiBTAcsiiVfcgYUCE2iYHrstn5srzHPfDQoLLrjpoklT6wWBIsp
                EJhspMTqZXhaetfziVyp8XoyfIkCo1MwUTAdBgNVHQ4EFgQUri21cSjdebXomtH4
                /keddL5AvH4wHwYDVR0jBBgwFoAUri21cSjdebXomtH4/keddL5AvH4wDwYDVR0T
                AQH/BAUwAwEB/zAKBggqhkjOPQQDAwNnADBkAjBxDx4/PybKsUTBwp05R9x1fTGw
                zw13DlbWiPCJ8zVD36gg9bUw4NEXZahvnlyZ+WsCMGjwOUIauvigu9L4ratzY+ub
                teWflOpPwmTN82ioIqlakbrFCQy4GJYHGHGxYWO0XA==
                -----END CERTIFICATE-----
              '';
              description = "Bonjour LI";
            }
          ];
          cluster_groups = [ ];
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
        users.users.bonjour.extraGroups = ["incus-admin"];
      };
      gateway = {};
      laptop = {};
    };
  };
}