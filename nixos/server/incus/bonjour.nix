{
  virtualisation.incus.preseed = {
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
                base_url: http://mirrors.cernet.edu.cn/alpine
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