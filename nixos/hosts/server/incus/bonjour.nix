{
  virtualisation.incus.preseed = {
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
    ];
    projects = [
      {
        name = "bonjour";
        description = "";
        config = {
          "features.images" = "true";
          "features.profiles" = "true";
          "features.storage.buckets" = "true";
          "features.storage.volumes" = "true";
          restricted = "false";
        };
      }
    ];
    profiles = [
      {
        project = "bonjour";
        name = "default";
        description = "Default Incus profile for project bonjour";
        devices = {
          eth0 = {
            network = "incusbr-bonjour";
            type = "nic";
          };
          root = {
            path = "/";
            pool = "default";
            type = "disk";
          };
        };
        config = {
          "cloud-init.vendor-data" = ''
            #cloud-config
            locale: zh_CN
            timezone: Asia/Shanghai
            apk_repos:
              alpine_repo:
                base_url: http://mirrors.tuna.tsinghua.edu.cn/alpine
                version: latest-stable
                community_enabled: true
            package_update: true
            package_upgrade: true
            package_reboot_if_required: true
          '';
        };
      }
    ];
  };
}