{
  virtualisation.incus.preseed = {
    projects = [
      {
        name = "work";
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
        project = "work";
        name = "default";
        description = "Default Incus profile for project work";
        devices = {
          eth0 = {
            network = "incusmacv";
            type = "nic";
          };
          root = {
            path = "/";
            pool = "default";
            type = "disk";
          };
        };
        config = {
          "security.nesting" = "true";
        };
      }
    ];
  };
}