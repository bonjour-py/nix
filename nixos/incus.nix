{pkgs, ...}:{
  virtualisation.incus = {
    enable = true;
    package = pkgs.incus;
    ui.enable = true;
    preseed = {
      config."core.https_address" = "[::]:443";
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
    };
  };
  security.apparmor.enable = true;
  networking.firewall.allowedTCPPorts = [ 80 443 ];
}