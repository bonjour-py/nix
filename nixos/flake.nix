{
  inputs = {
    common.url = "./version";
    hardware.url = "./hardware";
    network.url = "./network";
    users.url = "./users";
    wireguard.url = "./wireguard";
    podman.url = "./podman";
    incus.url = "./incus";
  };
  outputs = {
    self,
    common,
    hardware,
    network,
    users,
    wireguard,
    podman,
    incus,
  }:{
    nixosModules = {
      server.imports = [
        common.nixosModules.server
        hardware.nixosModules.server
        network.nixosModules.server
        users.nixosModules.server
        wireguard.nixosModules.server
        incus.nixosModules.server
      ];
      gateway.imports = [
        common.nixosModules.gateway
        hardware.nixosModules.gateway
        network.nixosModules.gateway
        users.nixosModules.gateway
        wireguard.nixosModules.gateway
        podman.nixosModules.gateway
      ];
      laptop.imports = [
        common.nixosModules.laptop
        hardware.nixosModules.laptop
        network.nixosModules.laptop
        users.nixosModules.laptop
      ];
    };
  };
}